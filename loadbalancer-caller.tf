module "load-balancers" {

  source             = "./Loadbalancer"
  traffic            = var.public-traffic
  
  
  vpc-id             = module.vpc.vpc-id

  public-subnet-ids   = [module.vpc.public-subnet-id-1,module.vpc.public-subnet-id-2]
  private-subnet-ids  = [module.vpc.private-subnet-id-1,module.vpc.private-subnet-id-2]
  
  ALB-public-sec-id  = module.security-groups.ALB-public-sec-id
  LB-private-sec-id  = module.security-groups.LB-private-sec-id

  private-EC2-ids    = [module.EC2.private-EC2-1-id,module.EC2.private-EC2-2-id]
  public-EC2-ids     = [module.EC2.public-EC2-1-id,module.EC2.public-EC2-2-id]

}