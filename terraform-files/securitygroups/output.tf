output "public-sg-id" {
  
  value = aws_security_group.public_sg.id
}

output "private-sg-id" {
  
  value = aws_security_group.private_sg.id
}

output "ALB-public-sec-id" {

    value = aws_security_group.ALB-external-sec-group.id
  
}

output "LB-private-sec-id" {

    value = aws_security_group.private-internal-LB-sec-group.id
  
}