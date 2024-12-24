#!/bin/bash
# Update and install Docker
sudo yum update -y
sudo amazon-linux-extras enable docker
sudo yum install -y docker

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add ec2-user to Docker group and apply the new group settings
sudo usermod -a -G docker ec2-user

# Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install open-metadata
mkdir openmetadata-docker && cd openmetadata-docker

curl -sL -o docker-compose-postgres.yml https://github.com/open-metadata/OpenMetadata/releases/download/1.6.1-release/docker-compose-postgres.yml

docker-compose -f docker-compose-postgres.yml up --detach
