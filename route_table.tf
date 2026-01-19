########## Public Subnet Route Tables ##########
#route_table1
resource "aws_route_table" "test_eks_public_rt1" {
  vpc_id = aws_vpc.test_eks_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_eks_igw.id
  }
  tags = {
    Name = "test_eks_public_rt1"
  }
}

## route associations public
resource "aws_route_table_association" "test_eks_public_rt1" {
  subnet_id      = aws_subnet.test_public_subnet1.id
  route_table_id = aws_route_table.test_eks_public_rt1.id
}

#route_table3
resource "aws_route_table" "test_eks_public_rt3" {
  vpc_id = aws_vpc.test_eks_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test_eks_igw.id
  }
  tags = {
    Name = "test_eks_public_rt3"
  }
}

## route associations public
resource "aws_route_table_association" "test_eks_public_rt3" {
  subnet_id      = aws_subnet.test-public-subnet3.id
  route_table_id = aws_route_table.test_eks_public_rt3.id
}

########## Private Subnet Route Tables ##########

#route_table1
resource "aws_route_table" "test_eks_private_rt1" {
  vpc_id = aws_vpc.test_eks_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.test-nat-gateway.id
  }
  tags = {
    Name = "test_eks_private_rt1"
  }
}

## route associations public
resource "aws_route_table_association" "test_eks_private_rt1" {
  subnet_id      = aws_subnet.test-private-subnet1.id
  route_table_id = aws_route_table.test_eks_private_rt1.id
}

#route_table3
resource "aws_route_table" "test_eks_private_rt3" {
  vpc_id = aws_vpc.test_eks_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.test-nat-gateway.id
  }
  tags = {
    Name = "test_eks_private_rt3"
  }
}

## route associations public
resource "aws_route_table_association" "test_eks_private_rt3" {
  subnet_id      = aws_subnet.test-private-subnet3.id
  route_table_id = aws_route_table.test_eks_private_rt3.id
}








# #########################Secondary CIDR Route Table#############################################
# #route_table1
# resource "aws_route_table" "test_eks_rt1_pods" {
#   vpc_id = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.test_eks_igw.id
#   }
#   tags = {
#     Name = "test_eks_rt1_pods"
#   }
# }
# 
# ## route associations public
# resource "aws_route_table_association" "test_eks_rt1_pods" {
#   subnet_id      = aws_subnet.test_eks_sb1_pods.id
#   route_table_id = aws_route_table.test_eks_rt1_pods.id
# }
# 
# #route_table3
# resource "aws_route_table" "test_eks_rt3_pods" {
#   vpc_id = aws_vpc_ipv4_cidr_block_association.secondary_cidr.vpc_id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.test_eks_igw.id
#   }
#   tags = {
#     Name = "test_eks_rt3_pods"
#   }
# }
# 
# ## route associations public
# resource "aws_route_table_association" "test_eks_rt3_pods" {
#   subnet_id      = aws_subnet.test_eks_sb3_pods.id
#   route_table_id = aws_route_table.test_eks_rt3_pods.id
# }

