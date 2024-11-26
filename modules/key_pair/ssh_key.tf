# Import public key to AWS
resource "aws_key_pair" "ssh_key_pair" {
  public_key = file(var.public_key_path)
  key_name   = var.key_name
}
