output "eks_cluster_name" {
  value = local.eks_cluster_name
}

output "vpc" {
  value = module.vpc
}
