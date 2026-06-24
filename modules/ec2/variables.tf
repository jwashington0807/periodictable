# EC2 Module Variables
variable name_prefix {
  type        = string
}

variable tags {
  type = map(string)
}

variable ec2_instance_count {
  type        = number
  default     = 2
}

variable ec2_ami {
  type        = string
}

variable ec2_instance_type {
  type        = string
}

variable public_subnet_ids {
  type        = list(string)
}

variable vpc_id {
  type        = string
}

variable security_group_ids {
  type        = list(string)
  description = "Security group IDs to attach to EC2 instances"
  default     = []
}
