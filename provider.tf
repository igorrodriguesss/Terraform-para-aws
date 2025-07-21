terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.37.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.2"
    }
  }
  backend "s3" {
    bucket = "terraform-para-aws"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "kubernetes" {
  host                   = module.eks-cluster.endpoint
  cluster_ca_certificate = base64decode(module.eks-cluster.certificate-authority)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", "${var.project_name}-eks-cluster"]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes = {
    host                   = module.eks-cluster.endpoint
    cluster_ca_certificate = base64decode(module.eks-cluster.certificate-authority)
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", "${var.project_name}-eks-cluster"]
      command     = "aws"
    }
  }
}
