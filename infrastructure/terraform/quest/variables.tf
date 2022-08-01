/*
  Required
*/
variable "root_domain_name" {
  type    = string
  description = "domain name that should correspond to a Route 53 hosted zone. Used for ACM certificate validation."
}

/*
  Optional
*/
variable "region" {
  type    = string
  default = "us-east-1"
  description = "AWS region to use"
}
