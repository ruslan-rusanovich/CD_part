output "eks_vpc" {
  value = aws_vpc.eks_vpc
  description = "The VPC created for EKS cluster"
}

output "eks_subnet_1" {
  value = aws_subnet.eks_subnet_1
  description = "First subnet created for EKS cluster"
}

output "eks_subnet_2" {
  value = aws_subnet.eks_subnet_2
  description = "Second subnet created for EKS cluster"
}