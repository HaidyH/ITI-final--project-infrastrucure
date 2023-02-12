/* 
variable "s_group_vpc_cidr" {
  type = string

  
  } */

variable "public-subnet-cidr" {
  type = list
}

variable "private-subnet-cidr" {
  type = list
}

variable "subnet-num" {
  type = list
}

variable "vpc-cidr" {
  type = string
}

variable "vpc-name" {
  type = string
}

variable "public-traffic" {

    type = string
    default = "0.0.0.0/0"

}

variable "nat-id" {
  type = string
  
}

variable "gw-id" {
  type = string
  
}


variable "AZ" {
  type = list
  
}