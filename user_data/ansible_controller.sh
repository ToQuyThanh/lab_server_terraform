#!/bin/bash
# Update system
sudo yum update -y

# Install git
sudo yum install git -y

# Install Ansible
sudo amazon-linux-extras enable ansible2
sudo yum install -y ansible

# Start SSH agent (only if not already running)
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval $(ssh-agent -s)
fi