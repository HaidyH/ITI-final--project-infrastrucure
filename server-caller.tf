module "ec2" {
  source    = "./servers"
  subnet-id = module.vpc.subnet-id-1

  ami-id    = "ami-0aa7d40eeae50c9a9"
  ec2-type  = "t2.micro"


}



