variable "ami" {
  description = "AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  type        = string
  description = "Type for EC2 Instance"
}

variable "instance_key" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "default_tags" {
  description = "Default tags to apply to the instance"
  type        = map(string)
  default     = {}
}

variable "root_block_device" {
  description = "The root block device configuration"
  type        = map(string)
  default = {
    volume_size = "8"
    volume_type = "gp2"
  }
}
