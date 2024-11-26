#!/bin/bash
# Update and install Docker
sudo yum update -y
sudo amazon-linux-extras install docker -y

# Start Docker service
sudo service docker start

# Add ec2-user to Docker group and apply the new group settings
sudo usermod -aG docker ec2-user
newgrp docker

# Enable Docker service to start on boot
sudo systemctl enable docker
