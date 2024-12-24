# Create the Linux EC2 Web server
resource "aws_instance" "lab_instance" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.instance_key
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
  user_data       = file(var.user_data_file)

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
