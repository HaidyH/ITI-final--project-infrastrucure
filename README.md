# ITI-final--project-infrastrucure
the project infrastrucure consisted of 
vpc
2 private subnets
2 public subnets
1 ec2 in public subnets (Bastion host)
1 cluster contain 1 node type:t3.medium
nat gateway
internet gateway
2 routes tables
#Final Project
Deploy web application on eks using ci-cd Jenkins pipeline
![2](https://user-images.githubusercontent.com/83189705/221271227-0345cc92-3323-4c30-8a05-24dea7b7293d.png)
#run terraform to create eks cluster
terraform init
terraform apply
#access public ec2 (Bastion host) from your local machine
ssh on ec2 Bastion host to access cluster in private subnet 


#apply following commands to install kubectl and accesss eks cluster
sudo apt update -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
aws eks --region "us-east-1" update-kubeconfig --name Haidy-cluster
aws configure
add your 
aws access key
private access key
choose the region us-east-1

# installing jenkins on eks
copy the following files into your cluster 
![Screenshot from 2023-02-24 21-52-18](https://user-images.githubusercontent.com/83189705/221279492-88e672a2-d124-435b-badb-d73e9965cf59.png)

then run the following commands
kubectl create namespace devops-tools
kubectl apply -f serviceAccount.yaml
kubectl apply -f service.yaml
kubectl apply -f deployment.yaml
![Screenshot from 2023-02-23 19-56-59](https://user-images.githubusercontent.com/83189705/221279591-2592dd4f-6951-4788-9225-f801055c0252.png)

#Now you can access jenkins throw the externalIP on port 8080
ex: http://a940b839175494fc488b16aff4bf94bb-1363825606.us-east-1.elb.amazonaws.com:8080/
get the password and create your 1st user as follows 

![Screenshot from 2023-02-23 20-34-20](https://user-images.githubusercontent.com/83189705/221280810-0162faf7-8780-42a7-a2f6-34cad609bb47.png)
after createing your 1st user now you can create your 1st job 
but 1st we need to ad some credentials for docker and git as follows
![jenkins-credintials](https://user-images.githubusercontent.com/83189705/221281969-d93e491d-cefc-43b9-84ef-41f7033eccac.png)

Now 
click on create a job  and choose pipline 
![jenkis](https://user-images.githubusercontent.com/83189705/221281316-26dc58d9-68c7-47dc-9f32-79b90a9b5072.png)
create your pipline using the following repo and Jenkinsfile
https://github.com/HaidyH/ITI-final--project-app

![Screenshot from 2023-02-24 21-52-44](https://user-images.githubusercontent.com/83189705/221282455-842b832f-0706-4273-a915-a5807b873509.png)


