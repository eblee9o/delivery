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

###################Secondary CIDR Subnet#######################

resource "aws_subnet" "test_eks_sb1_pods" {
  vpc_id                  = aws_vpc.test_eks_vpc.id
  cidr_block              = "100.64.0.0/19"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-2a"

  tags = merge(local.tags, {
    Name                                            = "test_eks_sb1_pods"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                        = "1"
  })
}

resource "aws_subnet" "test_eks_sb3_pods" {
  vpc_id                  = aws_vpc.test_eks_vpc.id
  cidr_block              = "100.64.32.0/19"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-2c"

  tags = merge(local.tags, {
    Name                                            = "test_eks_sb3_pods"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
    "kubernetes.io/role/elb"                        = "1"
  })
}

