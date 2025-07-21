resource "aws_eks_node_group" "eks-managed-node-group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-mng"
  node_role_arn   = aws_iam_role.eks-mng-role.arn
  subnet_ids = [
    var.subnet-private-1a,
    var.subnet-private-1b
  ]
  tags = var.tags

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-mng-role-attachment-worker,
    aws_iam_role_policy_attachment.eks-mng-role-attachment-ecr,
    aws_iam_role_policy_attachment.eks-mng-role-attachment-cni,
  ]
}