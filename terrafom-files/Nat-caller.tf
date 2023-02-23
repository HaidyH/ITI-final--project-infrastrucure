module "nat" {
     source = "./Nat"
    subnet_id =   module.vpc.public-subnet-id-1
    allocation_id = module.Internet-gateway.eip-id
  
}