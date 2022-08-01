output "eks_cluster_oidc_issuer" {
  value = module.eks_cluster.cluster_oidc_issuer
}
output "eks_cluster_oidc_provider_url" {
  value = aws_iam_openid_connect_provider.main.url
}
output "eks_cluster_oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.main.arn
}
output "alb_controller_role_arn" {
  value = module.eks_alb_controller_role.role_arn
}
