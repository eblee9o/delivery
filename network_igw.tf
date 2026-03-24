resource "aws_internet_gateway" "test_eks_igw" {
  vpc_id = aws_vpc.test_eks_vpc.id

  tags = {
    Name = "test_eks_igw"
  }
}

