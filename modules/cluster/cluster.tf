resource "aws_eks_cluster" "eks-cluster" {
  name = "${var.project_name}-eks-cluster"

  access_config {
    authentication_mode = "API"
  }

  role_arn = aws_iam_role.eks-cluster-role.arn
  version  = "1.31"

  vpc_config {
    subnet_ids = [
      var.public-subnet-1a,
      var.public-subnet-1b,
    ]
    endpoint_private_access = true
    endpoint_public_access  = true
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-role-attachment
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-cluster"
    }
  )
}