module "vpc" {
  source = "./vpc"
  /* s_group_vpc_cidr = "0.0.0.0/0" */
  public-subnet-cidr = ["10.0.0.0/24",  "10.0.2.0/24"]
  private-subnet-cidr = ["10.0.1.0/24", "10.0.3.0/24"]
  AZ        = ["us-east-1a", "us-east-1b"]
  subnet-num = ["1", "2"]
  vpc-cidr    = "10.0.0.0/16"
  vpc-name    = "HaidyVPC"
  nat-id = module.nat.nat-id
  gw-id  = module.Internet-gateway.gw-id

}