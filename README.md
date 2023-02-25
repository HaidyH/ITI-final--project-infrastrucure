# ITI-final--project-infrastrucure
the project infrastrucure consisted of 

```bash
vpc
2 private subnets
2 public subnets
1 ec2 in public subnets (Bastion host)
1 eks in private subnet the cluster contain 1 node type:t3.medium
nat gateway
internet gateway
2 routes tables
remote backend using s3 and dynamoDB
```
# Screenshots

# vpc
![vpc](https://user-images.githubusercontent.com/83189705/221288702-20a788e4-2dd1-4b9b-8dd8-3b20b0d1524f.png)
# subnets
![subnets](https://user-images.githubusercontent.com/83189705/221288724-b4913caf-b413-494d-98a1-ca11881dd84c.png)
# ec2
![servers](https://user-images.githubusercontent.com/83189705/221288760-e29cb4a4-738b-48e7-aae5-0cdbdb0113ae.png)
# elastic-IP
![elastic-IP](https://user-images.githubusercontent.com/83189705/221288784-f589f194-cbc8-4170-9e00-b564d90d3f1a.png)
# internet-gateway
![internet-gateway](https://user-images.githubusercontent.com/83189705/221288793-641bd11f-77ca-4e14-b93d-8c433eca03d7.png)
# Nat-gateway
![Nat-gateway2](https://user-images.githubusercontent.com/83189705/221288825-bf49d13b-25ca-4629-b03d-ed13d87d0694.png)
# route-tables
![private-route-table](https://user-images.githubusercontent.com/83189705/221288837-19146a4c-2518-478d-9643-fd3839b7ffe7.png)

![route-tables](https://user-images.githubusercontent.com/83189705/221288845-650e09e3-6a04-4f09-ae77-0587f8d242ae.png)
![Screenshot from 2023-02-23 20-02-46](https://user-images.githubusercontent.com/83189705/221288871-3f4a13da-4061-42d0-94a0-cba7ebf54415.png)
# eks
![eks](https://user-images.githubusercontent.com/83189705/221288903-9759cee4-b1ee-42f8-9cc1-f8a0ec834c79.png)
# add ons
![Screenshot from 2023-02-25 00-24-02](https://user-images.githubusercontent.com/83189705/221320869-15057a1c-bcab-402f-9ec9-9c27df4ccd21.png)




# Final Project
Deploy web application on eks using ci-cd Jenkins pipeline
![2](https://user-images.githubusercontent.com/83189705/221271227-0345cc92-3323-4c30-8a05-24dea7b7293d.png)


## Tools:

- AWS (Cloud Provider)
- Terraform (IaC)
- Docker (Containerization Application)
- kubernates
- Jenkins (CI-CD)

## How to Use:


# clone this repo
```bash 
https://github.com/HaidyH/ITI-final--project-infrastrucure
```
# Run terraform to create eks cluster

Before you run terraform init make sure you comment s3 in remote repo as follows :
![Screenshot from 2023-02-24 22-46-25](https://user-images.githubusercontent.com/83189705/221289652-d805e09e-2a01-4a4b-a90e-502fc99bfecd.png)

then uncomment s3 in remote repo and apply the following commands:-

```bash
terraform init
terraform apply
```
#access public ec2 (Bastion host) from your local machine
ssh on ec2 Bastion host to access cluster in private subnet 
```bash
ssh -i "terraformkey.pem" ubuntu@3.85.63.95
```


# Apply following commands to install kubectl and accesss eks cluster

 ```bash
 
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

```


# Installing Jenkins on eks.
copy the following files into your cluster 
![Screenshot from 2023-02-24 21-41-38](https://user-images.githubusercontent.com/83189705/221284773-4b5b9adb-a75f-4fb2-a315-d0bb51c4213a.png)
```bash
then run the following commands
kubectl create namespace devops-tool
kubectl apply -f serviceAccount.yaml
kubectl apply -f service.yaml
kubectl apply -f deployment.yaml
```
![Screenshot from 2023-02-23 19-56-59](https://user-images.githubusercontent.com/83189705/221279591-2592dd4f-6951-4788-9225-f801055c0252.png)

# Now you can access jenkins throw the externalIP on port 8080.
```bash
Ex: http://a940b839175494fc488b16aff4bf94bb-1363825606.us-east-1.elb.amazonaws.com:8080/
```
Get the password and create your 1st user as follows 

```bash
kubectl exec -it pod/jenkins-7c59d5fbc8-tfgvv  cat /var/jenkins_home/secrets/initialAdminPassword -n devops-tool
```


![Screenshot from 2023-02-24 23-41-05](https://user-images.githubusercontent.com/83189705/221298811-9c162eff-b324-4266-ad3c-19a0f218e987.png)

![Screenshot from 2023-02-24 23-35-39](https://user-images.githubusercontent.com/83189705/221298938-db1ac901-0e3b-483c-9b01-5fc046d376de.png)



![Screenshot from 2023-02-23 20-34-20](https://user-images.githubusercontent.com/83189705/221280810-0162faf7-8780-42a7-a2f6-34cad609bb47.png)
# After createing your 1st user now you can create your 1st job. 

But 1st we need to add some credentials for docker and git as follows
![jenkins-credintials](https://user-images.githubusercontent.com/83189705/221281969-d93e491d-cefc-43b9-84ef-41f7033eccac.png)

# Now click on create a job  and choose pipline 
![jenkis](https://user-images.githubusercontent.com/83189705/221281316-26dc58d9-68c7-47dc-9f32-79b90a9b5072.png)

![Screenshot from 2023-02-24 23-48-46](https://user-images.githubusercontent.com/83189705/221322021-9cbe5c89-93d0-45b3-9ff6-975606639907.png)

# create your pipline using the following repo and Jenkinsfile
```bash
https://github.com/HaidyH/ITI-final--project-app

```
Create this stage using any agent because we don’t need to run our Docker CLI commands in a specific image. Using withCredentials, we can specify to use our Docker Hub credentials defined within Jenkins to login to Docker Hub via the Docker CLI and push our newly built image up.

![image](https://user-images.githubusercontent.com/83189705/221322086-8112c6d2-85da-42be-a4c2-ed568b1ffb6f.png)

![Screenshot from 2023-02-24 23-54-05](https://user-images.githubusercontent.com/83189705/221322123-8b6f8d45-ff5e-49ee-a3d9-502b2b09e200.png)


![image](https://user-images.githubusercontent.com/83189705/221320679-65c47176-0469-4ded-9e0d-17b7935f1447.png)

![image](https://user-images.githubusercontent.com/83189705/221322789-0a2238a2-ff98-43ef-bafd-c331190aac09.png)

# Finally

![Screenshot from 2023-02-25 01-14-32](https://user-images.githubusercontent.com/83189705/221320706-321c458b-c63f-485a-8ab1-d5bb9256a9f9.png)

# You can access the web page from external IP bellow 

```bash
http://aaed641a1bce54f47939723a33f7aecb-1463804545.us-east-1.elb.amazonaws.com/
```



![Screenshot from 2023-02-25 01-13-22](https://user-images.githubusercontent.com/83189705/221320818-f1218bd0-2e8b-4c3f-9a4c-d2be4bdf5b32.png)





