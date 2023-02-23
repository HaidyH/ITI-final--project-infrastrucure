 //internet gateway 
resource "aws_internet_gateway" "gw" {
    vpc_id = var.vpc-id
    tags = {
    Name = var.gw-name
  }
}


resource "aws_eip" "eip" {

  vpc = true
  depends_on = [
    aws_internet_gateway.gw

  ]


}