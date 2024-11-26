# Optional: Define provider version constraints
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Specify the version constraint for the AWS provider
    }
  }
}

provider "aws" {
  # Specify the AWS region
  region = "ap-southeast-1"

  # Configure credentials
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}
