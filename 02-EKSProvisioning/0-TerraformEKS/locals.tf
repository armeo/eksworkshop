locals {
  eks_cluster_name = data.terraform_remote_state.vpc.outputs.eks_cluster_name
  vpc              = data.terraform_remote_state.vpc.outputs.vpc

  tags = {
    Project = "EKS Workshop"
  }
}
