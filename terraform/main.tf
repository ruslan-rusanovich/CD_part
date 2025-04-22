provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "ruslan-backend-bucket"
    key    = "ruslan_project_infrastructure.tfstate"
    region = "us-east-1"
    #dynamodb_table = "table_name"
    use_lockfile = true 
  }
}

module "eks_network" {
  source = "./modules/eks_network"
  eks_vpc_cidr_block = var.eks_vpc_cidr_block
  eks_subnet1_cidr_block = var.eks_subnet1_cidr_block
  eks_subnet2_cidr_block = var.eks_subnet2_cidr_block
  global_tag = var.global_tag
}

module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "19.15.3"
    cluster_name = var.eks_cluster_name
    cluster_version = "1.32"
    vpc_id = module.eks_network.eks_vpc.id
    subnet_ids = [module.eks_network.eks_subnet_1.id, module.eks_network.eks_subnet_2.id]
    cluster_endpoint_public_access = true
    eks_managed_node_group_defaults = {
        ami_type = var.node_group_ami_type
    }
    eks_managed_node_groups = {
        one = {
            name = "${var.eks_cluster_name}"
            instance_types = [var.node_groups_instance_types]
            min_size     = var.node_group_min_size
            max_size     = var.node_group_max_size
            desired_size = var.node_group_desired_size
        }
    }
}