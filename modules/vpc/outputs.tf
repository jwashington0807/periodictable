
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnets_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.periodictable_vpc_public_subnets[*].id
}

output "private_subnets_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.periodictable_vpc_private_subnets[*].id
}
