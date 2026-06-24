terraform {
  backend "s3" {
    bucket         = "periodictable-jt-terraform-state-dev"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    profile        = "periodictable-dev"
    use_lockfile   = true
    encrypt        = true
  }
}
