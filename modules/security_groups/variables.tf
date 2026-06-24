# Web Server Security Group Module Variables

variable "tags" {
  type = map(string)
}

variable "name_prefix" {
  type = string
}

variable vpc_id {
  type        = string
  description = "VPC ID where the security groups will be created"
}
