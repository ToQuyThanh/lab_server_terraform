# Get latest Amazon Linux 2 AMI
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# Create the Linux EC2 Web server
resource "aws_instance" "test_instance" {
  ami             = data.aws_ami.amazon-linux-2.id
  instance_type   = var.instance_type
  key_name        = var.instance_key
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
  user_data       = file("${path.module}/setup.sh")

  tags = merge(
    var.default_tags,
    {
      Name = var.instance_name
    }
  )
}
