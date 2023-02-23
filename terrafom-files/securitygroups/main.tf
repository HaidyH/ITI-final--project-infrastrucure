

//public security group
resource "aws_security_group" "public_sg" {
  name        = "allow_ssh_http"
  description = "Allow ssh http inbound traffic"
  vpc_id  = var.vpc-id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh_http_sg"
  }
}

//private security group
resource "aws_security_group" "private_sg" {
    name = "private security group"
    vpc_id  = var.vpc-id
        ingress {
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        security_groups = [aws_security_group.private-internal-LB-sec-group.id]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.traffic]
    }

    tags = {
        Name = "private-sg-group"
    }
}
    


resource "aws_security_group" "ALB-external-sec-group" {

    vpc_id = var.vpc-id


    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = [var.traffic]
    }


    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.traffic]
    }



    tags = {
        name = "ALB-public-sec-group"
    }
}



resource "aws_security_group" "private-internal-LB-sec-group" {

    vpc_id = var.vpc-id


    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        security_groups = [aws_security_group.public_sg.id]
    }


    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [var.traffic]
    }



    tags = {
        name = "private-intrenal-LB-sec-group"
    }
}
