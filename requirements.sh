#! /bin/bash

# Installing node 14
curl -sL https://deb.nodesource.com/setup_14.x | bash -
apt install -y nodejs
npm install -g npm

# Install Terraform 0.13.6
wget https://releases.hashicorp.com/terraform/0.13.6/terraform_0.13.6_linux_amd64.zip -O /usr/local/bin/terraform.zip 
unzip /usr/local/bin/terraform.zip -d /usr/local/bin/ 
rm /usr/local/bin/terraform.zip




