
module "EC2" {
  source    = "./servers"
  vpc-id    = module.vpc.vpc-id
  ec2-type  = "t2.micro"
  public-subnet-id        = module.vpc.public-subnet-id-1
  public-sg-id            = module.security-groups.public-sg-id

}