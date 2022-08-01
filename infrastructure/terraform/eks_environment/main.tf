terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.23"
    }
  }

  required_version = ">= 1.1"

  backend "s3" {
    profile = "master"
    bucket  = "mattmartinez-terraform-state"
    key     = "eks_environment/terraform.tfstate"
    region  = "us-east-1"
  }
}

data "terraform_remote_state" "account" {
  backend = "s3"
  config = {
    profile = "master"
    bucket  = "mattmartinez-terraform-state"
    key     = "env:/${terraform.workspace}/account/terraform.tfstate"
    region  = "us-east-1"
  }
}

provider "aws" {
  default_tags {
    tags = {
      ManagedBy = "Terraform"
      Stack     = "Environment"
    }
  }
  region  = var.region
  profile = terraform.workspace
}
data "aws_caller_identity" "current" {}
