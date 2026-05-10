locals {

  # Environment Variables
  environment  = var.environment
  is_production      = var.environment == "prod"
  monitoring_enabled = var.monitoring || local.is_production

  # Naming Variables
  bucket_name = "${var.projectname}-${local.environment}-bucket"
}
