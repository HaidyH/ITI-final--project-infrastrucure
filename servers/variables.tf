
variable "ec2-type" {
  type = string
}

variable "public-subnet-ids" {
   type = list
  
}

variable "vpc-id" {
   type = string
}

variable "private-subnet-ids" {
   type = list
}

variable "public-sg-id" {
   type = string
}

variable "private-sg-id" {
   type = string
}




variable "internal-LB-DNS" {
   type = string
}

variable "public-target-group-arn" {
   type = string
}

variable "private-target-group-arn" {

  
}