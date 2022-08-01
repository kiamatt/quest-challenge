module "network_key" {
  source   = "../modules/kms_key"
  key_name = "services-vpc-logs"
}
