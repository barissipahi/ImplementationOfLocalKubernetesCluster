#!/bin/bash

# Update package list and upgrade existing packages
sudo apt-get update -y && sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install -y wget unzip

# Download Terraform binary
sudo wget https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip

# Unzip Terraform binary
sudo unzip terraform_1.3.7_linux_amd64.zip

# Move Terraform binary to /usr/local/bin
sudo mv terraform /usr/local/bin/

# Add Terraform binary to PATH
echo 'export PATH="$PATH:/usr/local/bin"' >> ~/.bashrc
source ~/.bashrc

# Verify the installation
terraform --version

