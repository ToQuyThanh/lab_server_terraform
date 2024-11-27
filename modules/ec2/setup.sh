#!/bin/bash
# Update and install Docker
sudo yum update -y
sudo amazon-linux-extras enable docker
sudo yum install -y docker

# Start Docker service
sudo service docker start

# Add ec2-user to Docker group and apply the new group settings
sudo usermod -a -G docker $USER
sudo systemctl enable docker

# Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

