variable "global_tag" {
    type = string
    default = "ruslan_devops_project"
}

# For eks_network module
variable "eks_vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "eks_subnet1_cidr_block" {
  type = string
  default = "10.0.1.0/24"
}

variable "eks_subnet2_cidr_block" {
  type = string
  default = "10.0.2.0/24"
}

# For eks module
variable "eks_cluster_name" {
  type = string
  default = "ruslan-eks-cluster"
}

variable "node_group_ami_type" {
  type = string
  default = "AL2_x86_64"
}

variable "node_groups_instance_types" {
  type = string
  default = "t3.medium"
}

variable "node_group_min_size" {
  type = number
  default = 2
}

variable "node_group_max_size" {
  type = number
  default = 2
}

variable "node_group_desired_size" {
  type = number
  default = 2
}




