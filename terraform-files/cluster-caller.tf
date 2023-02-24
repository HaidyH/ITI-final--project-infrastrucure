module "cluster" {

  source             = "./cluster"
  private-subnet-ids  = [module.vpc.private-subnet-id-1,module.vpc.private-subnet-id-2]
  

} 
