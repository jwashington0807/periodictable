# Define a AWS Region
provider "aws" {
  region = var.aws_region
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = var.aws_profile
}

# VPC Module
module "vpc" {
  // Path to the VPC module
  source = "./modules/vpc"

  // Pass variables to the VPC module
  environment = var.environment
  projectname = var.projectname
  domainname = var.domainname
  cidr_block = var.cidr_block
  aws_region = var.aws_region
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  aws_availability_zones = var.aws_availability_zones
}

# Security Groups Module
module "web_server_sg" {
  source = "./modules/security_groups"

  projectname   = var.projectname
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
}

# EC2 Module
module "ec2" {
  source = "./modules/ec2"

  projectname = var.projectname
  environment  = var.environment
  domainname = var.domainname
  ec2_instance_count = var.ec2_instance_count
  ec2_ami = var.ec2_ami
  ec2_instance_type = var.ec2_instance_type
  public_subnet_ids = module.vpc.public_subnets_ids
  vpc_id = module.vpc.vpc_id
}

# Secrets Module
module "secrets" {
  source = "./modules/secrets"

  projectname = var.projectname
  environment  = var.environment
  db_username  = var.db_username
}

# ACM Certificate Resource
resource "aws_acm_certificate" "cert" {
  provider          = var.aws_region_alias
  domain_name       = var.domainname
  validation_method = var.acm_validation_method
}


