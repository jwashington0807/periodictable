output "state_bucket_names" {
  description = "Names of the S3 state buckets, keyed by environment"
  value       = { for k, v in aws_s3_bucket.terraform_state : k => v.bucket }
}

output "state_lock_table_names" {
  description = "Names of the DynamoDB state lock tables, keyed by environment"
  value       = { for k, v in aws_dynamodb_table.terraform_state_lock : k => v.name }
}
