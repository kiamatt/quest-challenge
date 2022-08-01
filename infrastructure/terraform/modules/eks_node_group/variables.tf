/*
  Required
*/
variable "cluster_name" {
  type = string
}
variable "role_arn" {
  type = string
}
variable "subnets" {
  type = list(string)
}

/*
  Optional
*/
variable "instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}
variable "min_nodes" {
  type    = number
  default = 1
}
variable "max_nodes" {
  type    = number
  default = 1
}
variable "desired_nodes" {
  type    = number
  default = 1
}
