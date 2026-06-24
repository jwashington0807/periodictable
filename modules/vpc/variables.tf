# VPC Module Variables

variable "tags" {
  type = map(string)
}

variable "name_prefix" {
  type = string
}

variable cidr_block {
  type        = string
}

variable public_subnets {
  type        = list(string)
}

variable private_subnets {
  type        = list(string)
}

variable aws_availability_zones {
  type        = list(string)
}
