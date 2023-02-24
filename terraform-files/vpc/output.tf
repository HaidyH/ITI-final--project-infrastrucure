output "public-subnet-id-1" {
    value = aws_subnet.public-subnet[0].id
  
}

output "public-subnet-id-2" {
    value = aws_subnet.public-subnet[1].id
  
}

output "private-subnet-id-1" {
    value = aws_subnet.private-subnet[0].id
  
}

output "private-subnet-id-2" {
    value = aws_subnet.private-subnet[1].id
  
}

output "vpc-id" {
  
  value = aws_vpc.vpc-dev.id
}

