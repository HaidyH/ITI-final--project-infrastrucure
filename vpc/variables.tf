/* 
variable "s_group_vpc_cidr" {
  type = string

  
  } */

variable "subnet-cidr" {
  type = list
}

variable "subnet-name" {
  type = list
}

variable "vpc-cidr" {
  type = string
}

variable "vpc-name" {
  type = string
}