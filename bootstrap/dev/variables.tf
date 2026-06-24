variable "aws_region" {
  type        = string
  description = "AWS region to deploy bootstrap resources in"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI profile to use for authentication"
}

variable "project_name" {
  type        = string
  description = "Project name, used to name the state bucket and lock table"
}

variable "environment" {
  type        = string
  description = "Environment name to create state buckets and lock tables for"
  default     = "dev"
}
