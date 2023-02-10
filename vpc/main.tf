resource "aws_vpc" "vpc-dev" {
    cidr_block = var.vpc-cidr
      tags = {
    Name = var.vpc-name
  }
 
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id  = aws_vpc.vpc-dev.id
  count = length(var.subnet-cidr)
  cidr_block = var.subnet-cidr[count.index]
  tags = {
    Name = var.subnet-name[0]
  }
}

/* 
 //internet gateway 
resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.vpc-dev.id
    tags = {
    Name = "haidy-IGW"
  }
}

//nat gateway


resource "aws_nat_gateway" "nat" {
  connectivity_type = "private"
  subnet_id = aws_subnet.public-subnet-1.id

  tags = {
    Name = "Haidy NAT"
  }
}


resource "aws_route_table" "Route-table" {
    vpc_id = aws_vpc.vpc-dev.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.gw.id
    }

  tags = {
    Name = "Haidy-public-route-table"
  }
}

//attach public route table to public subnet
resource "aws_route_table_association" "public_rt_asso" {
  subnet_id = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.Route-table.id
}

//private route table 

resource "aws_route_table" "Route-table-private" {
    vpc_id = aws_vpc.vpc-dev.id
    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "Haidy-private-route-table"
  }
}

//attach private route table to private subnet
resource "aws_route_table_association" "private_rt_asso" {
  subnet_id = aws_subnet.var.subnet-name[1].id
  route_table_id = aws_route_table.Route-table-private.id
} */