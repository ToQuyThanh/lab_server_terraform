variable "cidr_block" {
  type        = string
  description = "Base CIDR Block for VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR Block for Public Subnets in VPC"
  default     = "10.0.0.0/24"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in VPC"
  default     = true
}

variable "aws_azs" {
  type        = string
  description = "AWS Availability Zones"
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

variable "default_tags" {
  description = "Default tags to apply to all resources"
  type        = map(string)
  default     = {}
}