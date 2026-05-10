# Environment Variables
variable environment {
  type        = string
  default     = "dev"
  description = "Stage of the environment (dev, staging, prod)"
}

variable aws_region {
  type        = string
  default     = "AWS region to deploy resources in"
}

variable aws_region_alias {
  type        = string
  default     = "Alias for the AWS region"
}

variable aws_profile {
  type        = string
  default     = "ID of the AWS CLI profile to use for authentication"
  description = "AWS CLI profile to use for authentication"
}

variable domainname {
  type        = string
  default     = "Domain Name of the website"
}

variable projectname {
  type        = string
  default     = "Name of the project"
}

# VPC Variables
variable cidr_block {
  type        = string
  default     = "CIDR block for the VPC"
}

variable aws_availability_zones {
  type        = list(string)
  default     = ["AWS availability zones to use for subnets"]
}

variable public_subnets {
  type        = list(string)
  description = "Public subnet CIDR blocks"
}

variable private_subnets {
  type        = list(string)
  description = "Private subnet CIDR blocks"
}

# EC2 Variables
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

# ACM Variables
variable acm_validation_method {
  type = string
  default = ""
  description = "Validation method for the ACM certificate"
}

# RDS Variables
variable "db_name" {
  description = "Name of the database"
  type        = string
  default     = "webappdb"
}

variable "db_username" {
  description = "Database master username"
  type        = string
  default     = "admin"
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Allocated storage for RDS in GB"
  type        = number
  default     = 10
}

variable "db_engine_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}