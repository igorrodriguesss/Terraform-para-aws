module "eks-network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = var.tags
}

module "eks-cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  tags             = local.tags
  public-subnet-1a = module.eks-network.subnet-pub-1a
  public-subnet-1b = module.eks-network.subnet-pub-1b
}

module "eks-managed-node-group" {
  cidr_block        = var.cidr_block
  source            = "./modules/managed-node-group"
  project_name      = var.project_name
  tags              = local.tags
  cluster_name      = module.eks-cluster.cluster-name
  subnet-private-1a = module.eks-network.subnet-priv-1a
  subnet-private-1b = module.eks-network.subnet-priv-1b
}

module "eks-load-balancer-controller" {
  source       = "./modules/load-ballancer-controller"
  project_name = var.project_name
  tags         = local.tags
}