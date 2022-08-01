/*
  Required
*/
variable "vpc_cidr_block" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "kms_key_arn" {
  type = string
}

/*
  Optional
*/
variable "public_nacl_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr        = string
    rule_number = number
  }))

  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr        = "0.0.0.0/0"
      rule_number = 10
    }
  ]
}

variable "public_nacl_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr        = string
    rule_number = number
  }))

  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr        = "0.0.0.0/0"
      rule_number = 10
    }
  ]
}

variable "private_nacl_ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr        = string
    rule_number = number
  }))

  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr        = "0.0.0.0/0"
      rule_number = 10
    }
  ]
}

variable "private_nacl_egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr        = string
    rule_number = number
  }))

  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr        = "0.0.0.0/0"
      rule_number = 10
    }
  ]
}
