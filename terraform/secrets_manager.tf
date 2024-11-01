resource "aws_secretsmanager_secret" "test" {
  name = "${var.service_name}-secret-example"
}

resource "aws_secretsmanager_secret_version" "test" {
  secret_id     = aws_secretsmanager_secret.test.id
  secret_string = "I came from secrets manager v2"
}