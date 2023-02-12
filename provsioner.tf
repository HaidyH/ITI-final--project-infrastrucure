/* 


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

resource "aws_instance" "web" {
  count                  = length(var.subnet-cidr)
  ami                    = "ami-0aa7d40eeae50c9a9"
  subnet_id              = module.vpc.subnet-id-1
  instance_type          = "t2.micro"
  key_name               = "terraformkey"
  vpc_security_group_ids = [module.vpc.sg-id]


  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install nginx -y"
    ]

  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = coalesce(self.public_ip, self.private_ip)
    private_key = file("./terraformkey.pem")

  }

  tags = {

    Name = "appach-ec2"


  }




  provisioner "local-exec" {
    command = " echo  ' Public-Instance ${count.index + 1} Public IP: ${self.public_ip} \n ' >> all-ips.txt"


  }




}

 */
