locals {
  eks_cluster_oidc_issuer       = data.terraform_remote_state.eks_environment.outputs.eks_cluster_oidc_issuer
  environment                   = terraform.workspace
  eks_cluster_oidc_provider_url = data.terraform_remote_state.eks_environment.outputs.eks_cluster_oidc_provider_url
  eks_cluster_oidc_provider_arn = data.terraform_remote_state.eks_environment.outputs.eks_cluster_oidc_provider_arn
}
