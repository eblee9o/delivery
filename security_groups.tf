########### EFS Security Group ###########
resource "aws_security_group" "test-sg-efs" {
  description = "Test EFS security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "2049"
    protocol    = "tcp"
    self        = "false"
    to_port     = "2049"
  }

  name   = "test-sg-efs"
  vpc_id = aws_vpc.test_eks_vpc.id
}

########### Bastion (EC2 Instance) Security Group ###########
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


###############################Secondary CIDR Route Table##########################################

# resource "aws_security_group" "test_eks_bastion_sg_pods" {
#   name        = "test-eks-bastion-sg_pods"
#   description = "test_eks_bastion_sg_pods"
#   vpc_id      = aws_vpc.test_eks_vpc.id
# 
#   ingress {
#     description = "SSH"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# 
#   egress {
#     description = "all"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "test_eks_bastion_sg_pods"
#   }
# }


