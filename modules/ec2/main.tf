# X86_64
# data "aws_ami" "amazon-linux-2" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-2.0.20230926.0-x86_64-gp2"]
#   }
# }

# arm64
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.20230912.0-arm64-gp2"]
  }
}


# Create the Linux EC2 Web server
resource "aws_instance" "lab_instance" {
  ami             = data.aws_ami.amazon-linux-2.id
  instance_type   = var.instance_type
  key_name        = var.instance_key
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
  user_data       = file("${path.module}/setup.sh")

  root_block_device {
    volume_size = var.root_block_device["volume_size"]
    volume_type = var.root_block_device["volume_type"]
  }

  tags = merge(
    var.default_tags,
    {
      Name = var.instance_name
    }
  )
}
