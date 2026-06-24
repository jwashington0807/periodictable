locals {
  name_prefix = "${var.project_name}-${var.environment}"

  # Tags
  app_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy    = "Terraform"
  }

  # Environment Variables
  monitoring_enabled = var.enable_monitoring
}
