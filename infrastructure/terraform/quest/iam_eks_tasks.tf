module "eks_task_role" {
  source    = "../modules/iam_role"
  role_name = "quest-eks-tasks"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Principal = {
          Federated = local.eks_cluster_oidc_provider_arn
        }
        Condition = {
          StringEquals = {
            "${local.eks_cluster_oidc_provider_url}:sub" = "system:serviceaccount:${local.environment}:quest",
            "${local.eks_cluster_oidc_provider_url}:aud" = "sts.amazonaws.com"
          }
        }
      }
    ]
  })
}

module "eks_task_policy" {
  source      = "../modules/iam_policy"
  policy_name = "quest-eks-tasks"
  policy      = data.aws_iam_policy_document.eks_task.json
}

module "eks_alb_role_policy_attachment" {
  source     = "../modules/iam_role_policy_attachment"
  role_name  = module.eks_task_role.role_name
  policy_arn = module.eks_task_policy.policy_arn
}

data "aws_iam_policy_document" "eks_task" {
  statement {
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["*"]
  }
}
