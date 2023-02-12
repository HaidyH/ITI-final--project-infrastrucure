data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

 resource "aws_instance" "EC2-Public" {
     count = 2 
     ami = data.aws_ami.ubuntu.id 
     instance_type = var.ec2-type
     associate_public_ip_address = true
     key_name = "terraformkey"
     subnet_id = var.public-subnet-ids[count.index]
     vpc_security_group_ids = [var.public-sg-id]
    
     tags = {
       name = "Public-EC2-${count.index}"
     }
 
   
   
    provisioner "remote-exec" {
        inline = [
            "sudo apt update -y",
            "sudo apt install nginx -y ",
            "echo 'server { \n listen 80 default_server; \n  listen [::]:80 default_server; \n  server_name _; \n  location / { \n  proxy_pass http://${var.internal-LB-DNS}; \n  } \n}' > default",
            "sudo mv default /etc/nginx/sites-enabled/default",
            "sudo systemctl restart nginx",
            "sudo apt install curl -y",
        ]
        
    }

     connection {
     host        = self.public_ip   
     type        = "ssh"
     user        = "ubuntu"
     private_key = file("./terraformkey.pem")
    
   }

    provisioner "local-exec" {
        command = " echo  ' Public-Instance ${count.index + 1} Public IP: ${self.public_ip} \n ' >> all-ips.txt"
         
        
    }


 }


 resource "aws_alb_target_group_attachment" "public-EC2_1-target-group-attach" {
  target_group_arn = var.public-target-group-arn
  target_id = aws_instance.EC2-Public[0].id
  port = 80
}

resource "aws_alb_target_group_attachment" "public-EC2_2-target-group-attach" {
  target_group_arn = var.public-target-group-arn
  target_id = aws_instance.EC2-Public[1].id
  port = 80
}



 resource "aws_instance" "EC2-Private" {

     
     count = 2 
     
     ami = data.aws_ami.ubuntu.id 
     
     instance_type = var.ec2-type
     
     associate_public_ip_address = false
     
     security_groups = [var.private-sg-id]
     
     user_data = file("servers/private-ec2.sh")
     
     subnet_id = var.private-subnet-ids[count.index]
     
     tags = {
       name = "Private-EC2-${count.index}"
     }
       provisioner "local-exec" {
           command = "echo 'Private-Instance ${count.index + 1} Private-IP: ${self.private_ip}' >> all-ips.txt"
       
    }

     }



resource "aws_alb_target_group_attachment" "private-EC2_1-target-group-attach" {
  target_group_arn = var.private-target-group-arn
  target_id = aws_instance.EC2-Private[0].id
  port = 80
}

resource "aws_alb_target_group_attachment" "private-EC2_2-target-group-attach" {
  target_group_arn = var.private-target-group-arn
  target_id = aws_instance.EC2-Private[1].id
  port = 80
}