# Generic Variables
variable environment {
  type        = string
  default     = "dev"
  description = "Stage of the environment (dev, staging, prod)"
}

variable domainname {
  type        = string
  default     = "Domain Name of the website"
}

variable projectname {
  type        = string
  default     = "Name of the project"
}

variable ec2_instance_count {
  type        = number
  default     = 2
  description = "Number of EC2 instances to create"
}

variable ec2_ami {
  type        = string
  default     = "ami-0ec10929233384c7f"
  description = "AMI ID for the EC2 instances"
}

variable ec2_instance_type {
  type        = string
  default     = "t2.micro"
  description = "Instance type for the EC2 instances"
}

variable public_subnet_ids {
  type        = list(string)
  default     = []
  description = "List of public subnet IDs"
}

variable vpc_id {
  type        = string
  default     = ""
  description = "VPC ID where the EC2 instances will be launched"
}
