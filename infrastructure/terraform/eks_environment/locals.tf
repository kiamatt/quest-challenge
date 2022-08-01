locals {
  public_subnet_ids = data.terraform_remote_state.account.outputs.public_subnet_ids
  environment       = terraform.workspace
}
