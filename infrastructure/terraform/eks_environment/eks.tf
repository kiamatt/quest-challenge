module "eks_cluster" {
  source           = "../modules/eks_cluster"
  cluster_role_arn = module.eks_cluster_role.role_arn
  subnets          = local.public_subnet_ids
  cluster_name     = "services"

  depends_on = [
    module.eks_cluster_role
  ]
}

module "eks_node_group" {
  source       = "../modules/eks_node_group"
  role_arn     = module.eks_node_group_role.role_arn
  subnets      = local.public_subnet_ids
  cluster_name = "services"

  depends_on = [
    module.eks_cluster, module.eks_node_group_role
  ]
}
