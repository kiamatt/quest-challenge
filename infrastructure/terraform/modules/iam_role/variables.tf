/*
  Required
*/
variable "assume_role_policy" {
  type = string
}
variable "role_name" {
  type = string
}

/*
  Required
*/
variable "managed_policy_arns" {
  type    = list(string)
  default = []
}
