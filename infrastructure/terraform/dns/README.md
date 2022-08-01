<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.24.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_quest_route53_record"></a> [quest\_route53\_record](#module\_quest\_route53\_record) | ../modules/route53_record | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_lb.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lb) | data source |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | Name of an AWS Application Load Balancer to point DNS traffic to | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region used | `string` | `"us-east-1"` | no |
| <a name="input_root_domain_name"></a> [root\_domain\_name](#input\_root\_domain\_name) | domain name that should correspond to a Route 53 hosted zone. One or more subdomains are deployed to this domain. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->