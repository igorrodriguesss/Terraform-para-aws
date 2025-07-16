resource "aws_subnet" "eks-subnet-private-1a" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 3)
  availability_zone = "${data.aws_region.current.region}a"
  tags = merge(
    local.tags,
    {
      Name                               = "${var.project_name}-priv-subnet-1a"
      "kubernetes.io/role/internal-name" = 1
    }
  )
}

resource "aws_subnet" "eks-subnet-private-1b" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, 4)
  availability_zone = "${data.aws_region.current.region}b"
  tags = merge(
    local.tags,
    {
      Name                               = "${var.project_name}-priv-subnet-1b"
      "kubernetes.io/role/internal-name" = 1
    }
  )
}

resource "aws_route_table_association" "eks-rtb-assoc-priv-1a" {
  subnet_id      = aws_subnet.eks-subnet-private-1a.id
  route_table_id = aws_route_table.eks-private-route-table-1a.id
}

resource "aws_route_table_association" "eks-rtb-assoc-priv-1b" {
  subnet_id      = aws_subnet.eks-subnet-private-1b.id
  route_table_id = aws_route_table.eks-private-route-table-1b.id
}