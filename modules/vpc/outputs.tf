output "sg_name" {
  value = aws_security_group.sg.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}
