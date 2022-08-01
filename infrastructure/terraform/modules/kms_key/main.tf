data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_kms_key" "key" {
  deletion_window_in_days = 10
  enable_key_rotation     = true
  policy                  = data.aws_iam_policy_document.network_logs.json
}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.key_name}"
  target_key_id = aws_kms_key.key.key_id
}

data "aws_iam_policy_document" "network_logs" {
  statement {
    effect = "Allow"
    actions = [
      "kms:*"
    ]

    resources = [
      "*"
    ]

    principals {
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      ]
      type = "AWS"
    }
  }

  statement {
    effect = "Allow"
    actions = [
      "kms:Encrypt*",
      "kms:Decrypt*",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:Describe*"
    ]

    resources = [
      "*"
    ]

    principals {
      identifiers = ["logs.${data.aws_region.current.name}.amazonaws.com"]
      type        = "Service"
    }
  }
}
