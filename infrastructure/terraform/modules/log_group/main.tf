resource "aws_cloudwatch_log_group" "log_group" {
  name       = var.log_group_name
  kms_key_id = var.kms_key_arn
}
