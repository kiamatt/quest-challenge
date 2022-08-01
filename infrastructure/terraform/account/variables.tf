/*
  Optional
*/
variable "app_vpc_cidr" {
  type    = string
  default = "10.200.0.0/16"
  description = "CIDR that will be used to provision an AWS VPC"
}
variable "region" {
  type    = string
  default = "us-east-1"
  description = "AWS region to deploy into"
}
