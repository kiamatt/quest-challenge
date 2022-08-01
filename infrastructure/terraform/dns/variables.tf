/*
  Required
*/
variable "root_domain_name" {
  type = string
  description = "domain name that should correspond to a Route 53 hosted zone. One or more subdomains are deployed to this domain."
}
variable "alb_name" {
  type = string
  description = "Name of an AWS Application Load Balancer to point DNS traffic to"
}

/*
  Optional
*/
variable "region" {
  type    = string
  default = "us-east-1"
  description = "AWS Region used"
}
