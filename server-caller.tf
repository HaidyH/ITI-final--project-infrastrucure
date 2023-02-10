/* module "ec2" {
  source    = "./servers"
  subnet-id = module.vpc.subnet-id-1 

  ami-id    = "ami-0aa7d40eeae50c9a9"
  ec2-type  = "t2.micro"
  user_data = <<-EOF
    #!/usr/bin/bash
    echo "*** Installing apache2"
    sudo yum -y install httpd
    sudo service httpd start 
    echo "*** Completed Installing apache2"
    EOF

}
*/


