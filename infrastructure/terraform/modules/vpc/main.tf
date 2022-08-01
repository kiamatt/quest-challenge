data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = var.vpc_name
  }
}

module "log_group" {
  source         = "../log_group"
  log_group_name = "/aws/vpc/${var.vpc_name}"
  kms_key_arn    = var.kms_key_arn
}

resource "aws_flow_log" "flow_log" {
  iam_role_arn             = aws_iam_role.role.arn
  log_destination          = module.log_group.log_group_arn
  traffic_type             = "ALL"
  vpc_id                   = aws_vpc.main.id
  max_aggregation_interval = 60
}

resource "aws_iam_role" "role" {
  name = "${var.vpc_name}-loggrouprole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }
      }
    ]
  })
}

data "aws_iam_policy_document" "log_group" {
  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams"
    ]
  }
}

resource "aws_iam_role_policy" "policy" {
  name = "${var.vpc_name}-loggrouppolicy"
  role = aws_iam_role.role.id

  policy = data.aws_iam_policy_document.log_group.json
}
