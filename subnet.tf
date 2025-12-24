resource "aws_subnet" "test_eks_sb1" {
  vpc_id                  = aws_vpc.test_eks_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-2a"

  tags = merge(local.tags, {
    Name                                            = "test_eks_sb1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                        = "1"
  })
}

resource "aws_subnet" "test_eks_sb3" {
  vpc_id                  = aws_vpc.test_eks_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-2c"

  tags = merge(local.tags, {
    Name                                            = "test_eks_sb3"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                        = "1"
  })
}

