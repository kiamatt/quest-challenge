resource "aws_eks_node_group" "main" {
  cluster_name    = var.cluster_name
  node_group_name = var.cluster_name
  node_role_arn   = var.role_arn
  subnet_ids      = var.subnets
  instance_types  = var.instance_types

  scaling_config {
    desired_size = var.desired_nodes
    max_size     = var.max_nodes
    min_size     = var.min_nodes
  }
}
