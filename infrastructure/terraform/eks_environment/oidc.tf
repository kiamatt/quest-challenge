data "tls_certificate" "main" {
  url = module.eks_cluster.cluster_oidc_issuer
}
resource "aws_iam_openid_connect_provider" "main" {
  url = module.eks_cluster.cluster_oidc_issuer

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    data.tls_certificate.main.certificates.0.sha1_fingerprint
  ]
}
