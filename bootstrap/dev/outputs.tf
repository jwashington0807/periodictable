output "state_bucket_name" {
  description = "Name of the S3 state bucket"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "state_lock_table_name" {
  description = "Name of the DynamoDB state lock table"
  value       = aws_dynamodb_table.terraform_state_lock.name
}
