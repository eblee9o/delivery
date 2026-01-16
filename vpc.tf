resource "aws_vpc" "test_eks_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "test_eks_vpc"
  }
}

########################Secondary CIDR######################################
resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = aws_vpc.test_eks_vpc.id
  cidr_block = "100.64.0.0/16"
}

