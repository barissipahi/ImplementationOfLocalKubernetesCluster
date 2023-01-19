# ImplementationOfLocalKubernetesCluster
This Project Involves Implementation Of Local Kurbernetes Cluster

Terraform kubernetes provider with minikube

# Prerequisites
 - Vagrant
 - Docker
 - terraform
 - minikube 
 - kubectl 

# 1 : Installing required softwares and dependencies for minikube

sudo chmod +x Docker_Helm_Minikube_Install.sh

./Docker_Helm_Minikube_Install.sh

# 2 : Installing required softwares and dependencies for terraform

sudo chmod +x Terraform_Install.sh

./Terraform_Install.sh

# 3 : Creating folder to put required files for terraform

mkdir terraform_project 

cd terraform_project

cp main.tf <specified path> 

cp -f namespaces <specified path> 

terraform init

terraform plan

terraform apply

# 4 Check if the pods,services etc. are created 

kubectl get all -n applications-namespace
