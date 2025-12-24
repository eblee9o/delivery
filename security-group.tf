resource "aws_security_group" "test_eks_bastion_sg" {
  name        = "test-eks-bastion-sg"
  description = "test_eks_bastion_sg"
  vpc_id      = aws_vpc.test_eks_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "test_eks_bastion_sg"
  }
}


