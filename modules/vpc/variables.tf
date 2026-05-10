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

# Module Variables
variable cidr_block {
  type        = string
  default     = "CIDR block for the VPC"
}

variable public_subnets {
  type        = list(string)
  default     = ["10.0.40.0/24", "10.0.41.0/24"]
}

variable private_subnets {
  type        = list(string)
  default     = ["10.0.50.0/24", "10.0.51.0/24"]
}

variable aws_region {
  type        = string
  default     = "AWS Region to deploy resources in"
}

variable aws_availability_zones {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}
