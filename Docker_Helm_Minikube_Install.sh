#!/bin/bash

# Disable swapp - may cause some problems when enabled.
swapoff -a

# Update package list and upgrade existing packages
sudo apt-get update -y && sudo apt-get upgrade -y


# Install the required dependencies for Git  
sudo apt-get install -y git

#########################################################################################################################################
# docker part 
#  needed dependencies
sudo apt-get install ca-certificates 
sudo apt-get install curl 
sudo apt-get install  gnupg 
sudo apt-get install  lsb-release

# Install the required dependencies for docker  
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# setting up the repo  for docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# update apt package index
sudo apt-get update

# install install the latest version, run:
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin


# Add the key for Google APT repositories
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -



# Add apt repository to desired location
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# update apt package index again
sudo apt-get update 
# Install the required dependencies for kubernetes 

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

sudo apt-get install -y kubeadm  kubelet 
############################################################################################################################################

# check part 
#sudo systemctl status kubelet.service
# sudo systemctl status docker.service



# Enable the services
sudo systemctl enable docker
sudo systemctl enable kubelet


# Start the servicese
sudo systemctl start kubelet
sudo systemctl start docker

############################################################################################################################################
# Install Dependencies for minikube 
sudo apt install -y curl wget apt-transport-https

# Download Minikube with wget
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# Copy minikube to /usr/local/bin
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube



############################################################################################################################################
#Install Helm
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

# add the user to docker group
sudo usermod -aG docker $USER && newgrp docker

sudo su $USER
# Start minikube with docker 
# minikube start --driver=docker