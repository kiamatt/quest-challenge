<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.23.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_alb_controller_role"></a> [eks\_alb\_controller\_role](#module\_eks\_alb\_controller\_role) | ../modules/iam_role | n/a |
| <a name="module_eks_alb_policy"></a> [eks\_alb\_policy](#module\_eks\_alb\_policy) | ../modules/iam_policy | n/a |
| <a name="module_eks_alb_role_policy_attachment"></a> [eks\_alb\_role\_policy\_attachment](#module\_eks\_alb\_role\_policy\_attachment) | ../modules/iam_role_policy_attachment | n/a |
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ../modules/eks_cluster | n/a |
| <a name="module_eks_cluster_role"></a> [eks\_cluster\_role](#module\_eks\_cluster\_role) | ../modules/iam_role | n/a |
| <a name="module_eks_node_group"></a> [eks\_node\_group](#module\_eks\_node\_group) | ../modules/eks_node_group | n/a |
| <a name="module_eks_node_group_role"></a> [eks\_node\_group\_role](#module\_eks\_node\_group\_role) | ../modules/iam_role | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.eks_alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [terraform_remote_state.account](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [tls_certificate.main](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | AWS region to use | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_controller_role_arn"></a> [alb\_controller\_role\_arn](#output\_alb\_controller\_role\_arn) | n/a |
| <a name="output_eks_cluster_oidc_issuer"></a> [eks\_cluster\_oidc\_issuer](#output\_eks\_cluster\_oidc\_issuer) | n/a |
| <a name="output_eks_cluster_oidc_provider_arn"></a> [eks\_cluster\_oidc\_provider\_arn](#output\_eks\_cluster\_oidc\_provider\_arn) | n/a |
| <a name="output_eks_cluster_oidc_provider_url"></a> [eks\_cluster\_oidc\_provider\_url](#output\_eks\_cluster\_oidc\_provider\_url) | n/a |
<!-- END_TF_DOCS -->