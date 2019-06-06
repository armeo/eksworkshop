provider "aws" {
  region  = "ap-southeast-1"
  version = "~> 2.0"
}

module "eks-cluster" {
  source = "./modules/terraform-aws-eks"

  cluster_name    = local.eks_cluster_name
  cluster_version = var.eks_cluster_version
  subnets         = local.vpc.private_subnets
  vpc_id          = local.vpc.vpc_id

  worker_groups = [
    {
      name                = "workers-group-a"
      instance_type       = "t3.medium"
      asg_max_size        = 3
      autoscaling_enabled = true
    },
  ]

  workers_group_defaults = {
    "pre_userdata" = data.template_file.aws_ssm_setup.rendered
  }

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "eks_worker_ec2_role_for_ssm" {
  role       = module.eks-cluster.worker_iam_role_name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
