output "eks_task_role_arn" {
  value = module.eks_task_role.role_arn
}

output "acm_certificate_arn" {
  value = aws_acm_certificate.main.arn
}
