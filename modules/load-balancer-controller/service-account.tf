resource "kubernetes_service_account" "eks-controller-sa" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.eks-controller-role.arn
    }
  }
}
