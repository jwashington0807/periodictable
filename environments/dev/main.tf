# VPC Module
module "vpc" {
  source = "../../modules/vpc"

  tags                   = local.app_tags
  name_prefix            = local.name_prefix
  cidr_block             = var.cidr_block
  private_subnets        = var.private_subnets
  public_subnets         = var.public_subnets
  aws_availability_zones = var.aws_availability_zones
}

# Security Groups Module
module "web_server_sg" {
  source = "../../modules/security_groups"

  tags        = local.app_tags
  name_prefix = local.name_prefix
  vpc_id      = module.vpc.vpc_id
}

# EC2 Module
module "ec2" {
  source = "../../modules/ec2"

  name_prefix        = local.name_prefix
  tags               = local.app_tags
  ec2_instance_count = var.ec2_instance_count
  ec2_ami            = var.ec2_ami
  ec2_instance_type  = var.ec2_instance_type
  public_subnet_ids  = module.vpc.public_subnets_ids
  vpc_id             = module.vpc.vpc_id
  security_group_ids = [module.web_server_sg.web_sg_id]
}

# Secrets Module
module "secrets" {
  source = "../../modules/secrets"

  name_prefix = local.name_prefix
  tags        = local.app_tags
  db_username = var.db_username
}

# DynamoDB Module (application table)
module "dynamodb" {
  source = "../../modules/dynamodb"

  name_prefix = local.name_prefix
  tags        = local.app_tags
  table_name  = "elements"
  hash_key    = "element_number"
  hash_key_type = "N"
}

# ACM Certificate Resource
resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
