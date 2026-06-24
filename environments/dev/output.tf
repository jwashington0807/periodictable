# VPC
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnets_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.vpc.private_subnets_ids
}

# EC2
output "ec2_instance_ids" {
  description = "IDs of the EC2 instances"
  value       = module.ec2.instance_id
}

output "ec2_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = module.ec2.public_ip
}

# Security Groups
output "web_sg_id" {
  description = "ID of the web server security group"
  value       = module.web_server_sg.web_sg_id
}

output "db_sg_id" {
  description = "ID of the database security group"
  value       = module.web_server_sg.db_sg_id
}

# DynamoDB
output "dynamodb_table_name" {
  description = "Name of the application DynamoDB table"
  value       = module.dynamodb.table_name
}

output "dynamodb_table_arn" {
  description = "ARN of the application DynamoDB table"
  value       = module.dynamodb.table_arn
}

# ACM
output "acm_certificate_arn" {
  description = "ARN of the ACM certificate"
  value       = aws_acm_certificate.cert.arn
}
