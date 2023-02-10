module "vpc" {
  source = "./vpc"
  /* s_group_vpc_cidr = "0.0.0.0/0" */
  subnet-cidr = ["10.0.2.0/24", "10.0.3.0/24"]
  subnet-name = ["public-subnet-1", "private-subnet-2"]
  vpc-cidr    = "10.0.0.0/16"
  vpc-name    = "HaidyVPC"

}