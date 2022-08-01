module "services_shared_vpc" {
  source         = "../modules/vpc"
  vpc_cidr_block = var.app_vpc_cidr
  kms_key_arn    = module.network_key.key_arn
  vpc_name       = "services"
}
