############ Public Subnets ############

resource "aws_subnet" "test_public_subnet1" {

  depends_on = [
    aws_vpc.test_eks_vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.0.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "test-public-subnet1"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  tags_all = {
    Name                                     = "test-public-subnet1"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  vpc_id            = aws_vpc.test_eks_vpc.id
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "test-public-subnet3" {

  depends_on = [
    aws_vpc.test_eks_vpc
  ]

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.16.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "test-public-subnet3"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  tags_all = {
    Name                                     = "test-public-subnet3"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
    "kubernetes.io/role/elb"                 = 1
  }

  vpc_id            = aws_vpc.test_eks_vpc.id
  availability_zone = "ap-northeast-2c"
}



############ Private Subnets ############

resource "aws_subnet" "test-private-subnet1" {


  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.32.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "test-private-subnet1"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "test-private-subnet1"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  vpc_id            = aws_vpc.test_eks_vpc.id
  availability_zone = "ap-northeast-2a"
}

resource "aws_subnet" "test-private-subnet3" {

  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.48.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                                     = "test-private-subnet3"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  tags_all = {
    Name                                     = "test-private-subnet3"
    "kubernetes.io/cluster/test-eks-cluster" = "shared"
  }

  vpc_id            = aws_vpc.test_eks_vpc.id
  availability_zone = "ap-northeast-2c"
}



###################Secondary CIDR Subnet#######################

# resource "aws_subnet" "test_eks_sb1_pods" {
#   vpc_id                  = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
#   cidr_block              = "100.64.0.0/19"
#   map_public_ip_on_launch = "true"
#   availability_zone       = "ap-northeast-2a"
# 
#   tags = merge(local.tags, {
#     Name                                            = "test_eks_sb1_pods"
#     "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
#     "kubernetes.io/role/elb"                        = "1"
#   })
# }
# 
# resource "aws_subnet" "test_eks_sb3_pods" {
#   vpc_id                  = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
#   cidr_block              = "100.64.32.0/19"
#   map_public_ip_on_launch = "true"
#   availability_zone       = "ap-northeast-2c"
# 
#   tags = merge(local.tags, {
#     Name                                            = "test_eks_sb3_pods"
#     "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
#     "kubernetes.io/role/elb"                        = "1"
#   })
# }

