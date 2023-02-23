module "Internet-gateway" {

  source = "./InternetGatway"
  
  gw-name = "haidy-IGW"
  vpc-id= module.vpc.vpc-id
  

}
