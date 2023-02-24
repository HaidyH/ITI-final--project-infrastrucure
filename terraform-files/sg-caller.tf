module "security-groups" {
  source  = "./securitygroups"
  traffic = "0.0.0.0/0"
  vpc-id  = module.vpc.vpc-id

}