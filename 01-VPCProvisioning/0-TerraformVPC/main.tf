provider "aws" {
  region  = "ap-southeast-1"
  version = "~> 2.0"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 2.5.0"

  create_vpc = local.create_vpc
  name       = local.vpc_name
  cidr       = local.vpc_cidr
  azs        = local.vpc_azs

  private_subnets = local.vpc_private_subnets
  public_subnets  = local.vpc_public_subnets

  assign_generated_ipv6_cidr_block = true

  enable_nat_gateway = local.vpc_enable_nat_gateway
  single_nat_gateway = local.vpc_single_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.vpc_tags

  igw_tags                 = local.vpc_igw_tags
  nat_eip_tags             = local.vpc_nat_eip_tags
  nat_gateway_tags         = local.vpc_nat_gateway_tags
  public_subnet_tags       = local.vpc_public_subnet_route_table_tags
  public_route_table_tags  = local.vpc_public_subnet_route_table_tags
  private_subnet_tags      = local.vpc_private_subnet_route_table_tags
  private_route_table_tags = local.vpc_private_subnet_route_table_tags
}

resource "aws_route" "ipv6-default-route" {
  route_table_id              = module.vpc.public_route_table_ids[0]
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = module.vpc.igw_id
}
