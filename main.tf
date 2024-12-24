module "vpc" {
  source = "./modules/vpc"

  cidr_block           = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  aws_azs              = data.aws_availability_zones.available.names[0]
  enable_dns_hostnames = true
  vpc_name             = "LabVPC"

  default_tags = {
    Environment = "Dev"
    Owner       = "ToQuyThanh"
  }

}

module "ssh_key" {
  source          = "./modules/key_pair"
  key_name        = var.key_name
  public_key_path = var.public_key_path
}

# Define instance
locals {
  instances = {
    # Lab1 = {
    #   ami            = data.aws_ami.amazon_linux_x86.id
    #   instance_type  = "t3.micro"
    #   instance_name  = "Ansible controller"
    #   user_data_file = "./user_data/ansible_controller.sh"
    #   volume_size     = 8
    # }
    Lab2 = {
      ami            = data.aws_ami.amazon_linux_arm.id
      instance_type  = "t4g.2xlarge"
      instance_name  = "Data server"
      user_data_file = "./user_data/open_metadata_deploy.sh"
      volume_size     = 16
    }
  }
}


module "ec2_instances" {
  source   = "./modules/ec2"
  for_each = local.instances

  ami             = each.value.ami
  instance_type   = each.value.instance_type
  instance_key    = module.ssh_key.public_key_name
  subnet_id       = module.vpc.public_subnet_id
  security_groups = [module.vpc.sg_name]
  root_block_device = {
    volume_size = each.value.volume_size
    volume_type = "gp2"
  }
  default_tags = {
    Environment = "Dev"
    Owner       = "ToQuyThanh"
  }
  instance_name  = each.value.instance_name
  user_data_file = each.value.user_data_file
}
