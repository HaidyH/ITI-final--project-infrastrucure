resource "aws_instance" "ec2-instance-public" {
    ami = var.ami-id 
    subnet_id = var.subnet-id
    instance_type = var.ec2-type
    /* associate_public_ip_address = true */
    /* vpc_security_group_ids = [aws_security_group.public_sg.id] */


}