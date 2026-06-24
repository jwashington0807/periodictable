provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  # Safety check — prevents accidental deployment to the wrong account
  allowed_account_ids = [var.aws_account_id]
}
