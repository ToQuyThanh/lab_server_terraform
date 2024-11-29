# Values ​​of variables are stored in .tfvars
data "aws_availability_zones" "available" {}

# X86_64 AMI
data "aws_ami" "amazon_linux_x86" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20230926.0-x86_64-gp2"]
  }
}

# ARM64 AMI
data "aws_ami" "amazon_linux_arm" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20230912.0-arm64-gp2"]
  }
}
