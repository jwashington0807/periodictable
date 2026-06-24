resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_secretsmanager_secret" "db_password" {
  name        = "${var.name_prefix}-db-password-${random_id.suffix.hex}"
  description = "Database password for ${var.name_prefix}"

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-db-password"
    }
  )
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id = aws_secretsmanager_secret.db_password.id
  secret_string = jsonencode({
    username = var.db_username
    password = random_password.db_password.result
    engine   = "mysql"
    host     = "" # Will be populated by application or looked up
  })
}