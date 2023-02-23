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
     ami = data.aws_ami.ubuntu.id 
     instance_type = var.ec2-type
     associate_public_ip_address = true
     key_name = "terraformkey"
     subnet_id = var.public-subnet-id
     vpc_security_group_ids = [var.public-sg-id]
    
     tags = {
       name = "Public-EC2-bastion"
     }
 
   
   
    provisioner "remote-exec" {
        inline = [
            "bash ./config_proxy.sh"
        ]
        
    }

     connection {
     host        = self.public_ip   
     type        = "ssh"
     user        = "ubuntu"
     private_key = file("./terraformkey.pem")
    
   }

    provisioner "local-exec" {
        command = " echo  ' Public-Instance bastion Public IP: ${self.public_ip} \n ' "
         
        
    }


 }



