module "cluster" {

  source             = "./cluster"
  /* traffic            = var.public-traffic
  
  
  vpc-id             = module.vpc.vpc-id */

  private-subnet-ids  = [module.vpc.private-subnet-id-1,module.vpc.private-subnet-id-2]
  

} 
