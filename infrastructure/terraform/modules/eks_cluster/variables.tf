/*
  Required
*/
variable "cluster_name" {
  type = string
}
variable "cluster_role_arn" {
  type = string
}
variable "subnets" {
  type = list(string)
}
