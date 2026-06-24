# Cloud Variables
variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources in"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI profile to use for authentication"
}

variable "aws_account_id" {
  type        = string
  description = "AWS account ID to deploy into — prevents accidental cross-account deployment"
}

variable "project_name" {
  type        = string
  description = "The name of the project, used for naming resources and tags"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Deployment environment (e.g., dev, staging, prod)"
}

# Networking Variables
variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "aws_availability_zones" {
  type        = list(string)
  description = "AWS availability zones to use for subnets"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnet CIDR blocks"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnet CIDR blocks"
}

# Application Variables
variable "app_name" {
  type        = string
  description = "Name of the application"
}

variable "ec2_instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Instance type for the EC2 instances"
}

variable "ec2_instance_count" {
  type        = number
  default     = 2
  description = "Number of EC2 instances to create"
}

variable "ec2_ami" {
  type        = string
  description = "AMI ID for the EC2 instances"
}

variable "domain_name" {
  type        = string
  description = "Domain name of the website"
}

# ACM Variables
variable "acm_validation_method" {
  type        = string
  default     = "DNS"
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

variable "db_engine" {
  type        = string
  default     = "mysql"
  description = "Engine for the RDS"
}

variable "db_engine_version" {
  description = "MySQL engine version"
  type        = string
  default     = "8.0"
}

# Feature Flags
variable "enable_monitoring" {
  description = "Enable monitoring resources (CloudWatch, etc.)"
  type        = bool
  default     = true
}
