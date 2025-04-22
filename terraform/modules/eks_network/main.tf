data "aws_availability_zones" "available" {
    state = "available"
}

locals {
    zone1 = data.aws_availability_zones.available.names[0]
    zone2 = data.aws_availability_zones.available.names[1]
}

resource "aws_vpc" "eks_vpc" {
    cidr_block = var.eks_vpc_cidr_block
    tags = {
        Name = var.global_tag
    }
}

resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = var.global_tag
  }
}

resource "aws_default_route_table" "eks_rt" {
  default_route_table_id = aws_vpc.eks_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = {
    Name = var.global_tag
  }
}

resource "aws_subnet" "eks_subnet_1" {
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = var.eks_subnet1_cidr_block
    availability_zone = local.zone1
    map_public_ip_on_launch = true
    tags = {
        Name = var.global_tag
    }
}

resource "aws_subnet" "eks_subnet_2" {
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = var.eks_subnet2_cidr_block
    availability_zone = local.zone2
    map_public_ip_on_launch = true
    tags = {
        Name = var.global_tag
    }
}