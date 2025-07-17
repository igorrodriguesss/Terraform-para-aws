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
