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

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_network_key"></a> [network\_key](#module\_network\_key) | ../modules/kms_key | n/a |
| <a name="module_services_shared_vpc"></a> [services\_shared\_vpc](#module\_services\_shared\_vpc) | ../modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_vpc_cidr"></a> [app\_vpc\_cidr](#input\_app\_vpc\_cidr) | CIDR that will be used to provision an AWS VPC | `string` | `"10.200.0.0/16"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region to deploy into | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | n/a |
<!-- END_TF_DOCS -->