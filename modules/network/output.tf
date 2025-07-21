output "subnet-pub-1a" {
  value = aws_subnet.eks-subnet-public-1a.id
}

output "subnet-pub-1b" {
  value = aws_subnet.eks-subnet-public-1b.id
}

output "subnet-priv-1a" {
  value = aws_subnet.eks-subnet-private-1a.id
}
output "subnet-priv-1b" {
  value = aws_subnet.eks-subnet-private-1b.id
}
output "vpc-id" {
  value = aws_vpc.eks_vpc.id
}
