resource "aws_secretsmanager_secret" "db_credentials" {
  name                    = "/product/${var.env}/db-credentials"
  description             = "Database credentials for the product ${var.env} environment"
  recovery_window_in_days = 0

  tags = {
    Name    = "/product/${var.env}/db-credentials"
    Env     = var.env
    Project = var.project
  }
}

resource "aws_secretsmanager_secret_version" "db_credentials" {
  secret_id = aws_secretsmanager_secret.db_credentials.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
    host     = var.db_host
  })
}

resource "aws_secretsmanager_secret" "jwt_secret" {
  name                    = "/product/${var.env}/jwt-secret"
  description             = "JWT signing secret for the product ${var.env} environment"
  recovery_window_in_days = 0

  tags = {
    Name    = "/product/${var.env}/jwt-secret"
    Env     = var.env
    Project = var.project
  }
}

resource "aws_secretsmanager_secret_version" "jwt_secret" {
  secret_id = aws_secretsmanager_secret.jwt_secret.id
  secret_string = jsonencode({
    secret = var.jwt_secret
  })
}
