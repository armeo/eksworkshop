locals {
  name             = "eksworkshop"
  vpc_name         = local.name
  eks_cluster_name = local.name

  create_vpc = true
  vpc_cidr   = "172.29.0.0/21"
  vpc_azs    = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]

  vpc_subnet_numbers = [0, 1, 2]
  vpc_private_subnets = [
    for netnum in local.vpc_subnet_numbers :
    cidrsubnet(local.vpc_cidr, 3, netnum)
  ]

  vpc_public_subnets = [
    for netnum in local.vpc_subnet_numbers :
    cidrsubnet(local.vpc_cidr, 3, length(local.vpc_subnet_numbers) + netnum)
  ]

  vpc_enable_nat_gateway = true
  vpc_single_nat_gateway = true

  tags = {
    Project = "EKS Workshop"
  }

  vpc_tags = merge(local.tags,
    map("kubernetes.io/cluster/${local.eks_cluster_name}", "shared")
  )

  vpc_name_tags = {
    Name = local.vpc_name
  }

  vpc_igw_tags         = local.vpc_name_tags
  vpc_nat_eip_tags     = local.vpc_name_tags
  vpc_nat_gateway_tags = local.vpc_name_tags

  vpc_public_subnet_route_table_tags = {
    SubnetType = "public"

    "kubernetes.io/role/elb" = 1
  }

  vpc_private_subnet_route_table_tags = {
    SubnetType = "private"

    "kubernetes.io/role/internal-elb" = 1
  }
}
