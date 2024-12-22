resource "aws_ssm_parameter" "test" {
  name  = "${var.service_name}-test-example"
  type  = "String"
  value = "I came from Parameter Store v2"
}