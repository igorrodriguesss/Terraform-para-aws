output "cluster-name" {
  value = aws_eks_cluster.eks-cluster.id
}

output "oidc" {
  value = aws_eks_cluster.eks-cluster.identity[0].oidc[0].issuer
}

output "certificate-authority" {
  value = aws_eks_cluster.eks-cluster.certificate_authority[0].data
}

output "endpoint" {
  value = aws_eks_cluster.eks-cluster.endpoint
}
