
output "gw-id" {
  
  value = aws_internet_gateway.gw.id

}


output "eip-id" {
  
  value = aws_eip.eip.id

}


output "gw" {
  
  value = aws_internet_gateway.gw

}