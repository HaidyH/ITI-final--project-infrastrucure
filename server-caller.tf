
module "EC2" {
  source    = "./servers"
  vpc-id    = module.vpc.vpc-id
  ec2-type  = "t2.micro"
  public-subnet-id        = module.vpc.public-subnet-id-1
  /* private-subnet-ids       = [module.vpc.private-subnet-id-1,module.vpc.private-subnet-id-2] */
  public-sg-id            = module.security-groups.public-sg-id
  /* private-sg-id           = module.security-groups.private-sg-id */
/*   
  internal-LB-DNS          = module.load-balancers.internal-LB-DNS
  public-target-group-arn  = module.load-balancers.public-target-group-arn
  private-target-group-arn = module.load-balancers.private-target-group-arn */

}