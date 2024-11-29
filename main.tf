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

# 1 Instance
# module "ec2_instance" {
#   depends_on = [module.vpc]
#   source     = "./modules/ec2"

#   instance_name = "Lab"
#   instance_type = "c6g.xlarge"

#   root_block_device = {
#     volume_size = "16"
#     volume_type = "gp2"
#   }

#   instance_key    = module.ssh_key.public_key_name
#   security_groups = [module.vpc.sg_name]
#   subnet_id       = module.vpc.public_subnet_id

#   default_tags = {
#     Environment = "Dev"
#     Owner       = "ToQuyThanh"
#   }
# }


# Multiple instance
locals {
  instances = {
    Lab1 = {
      ami           = data.aws_ami.amazon_linux_x86.id
      instance_type = "t3.micro"
      instance_name = "AirflowServer"
    }
    Lab2 = {
      ami           = data.aws_ami.amazon_linux_x86.id
      instance_type = "t3.micro"
      instance_name = "PostgresSQL_server"
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
    volume_size = "16"
    volume_type = "gp2"
  }
  default_tags = {
    Environment = "Dev"
    Owner       = "ToQuyThanh"
  }
  instance_name = each.value.instance_name
}
