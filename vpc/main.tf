//create vpc
resource "aws_vpc" "vpc-dev" {
    cidr_block = var.vpc-cidr
      tags = {
    Name = var.vpc-name
  }
 
}
//public subnet 
resource "aws_subnet" "public-subnet" {
  vpc_id  = aws_vpc.vpc-dev.id
  count = length(var.public-subnet-cidr)
  availability_zone = var.AZ[count.index]
  map_public_ip_on_launch = true 
  cidr_block = var.public-subnet-cidr[count.index]
  tags = {
    Name = "public-subnet-${var.subnet-num[count.index]}"
  }
}

//private subnet 
resource "aws_subnet" "private-subnet" {
  vpc_id  = aws_vpc.vpc-dev.id
  count = length(var.private-subnet-cidr)
  availability_zone = var.AZ[count.index]
  map_public_ip_on_launch = false
  cidr_block = var.private-subnet-cidr[count.index]
  tags = {
    Name = "private-subnet-${var.subnet-num[count.index]}"
  }
}




resource "aws_route_table" "public-rt" {
  vpc_id  = aws_vpc.vpc-dev.id
  route {
    cidr_block = var.public-traffic
    gateway_id = var.gw-id
  }
}

resource "aws_route_table_association" "public" {
    count = length(aws_subnet.public-subnet)
    subnet_id = aws_subnet.public-subnet[count.index].id
    route_table_id = aws_route_table.public-rt.id
  
}


resource "aws_route_table" "private-rt" {
    
    vpc_id  = aws_vpc.vpc-dev.id
    route {
        cidr_block = var.public-traffic
        nat_gateway_id = var.nat-id
    }
  
}


resource "aws_route_table_association" "private" {
    count = length(aws_subnet.private-subnet)
    subnet_id = aws_subnet.private-subnet[count.index].id 
    route_table_id = aws_route_table.private-rt.id
  
}


/* 

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
}  
 */
