##eks 
locals {
  public_subnets_csv = join(",", [
    aws_subnet.test_eks_sb1.id,
    aws_subnet.test_eks_sb3.id
  ])
}

resource "aws_instance" "test_eks_bastion" {
  ami                         = "ami-0a71e3eb8b23101ed"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.test_eks_sb1.id
  vpc_security_group_ids      = [aws_security_group.test_eks_bastion_sg.id]
  key_name                    = var.key_name
  iam_instance_profile        = aws_iam_instance_profile.bastion_profile.name #eks 설치위하여
  associate_public_ip_address = true

  # 템플릿에 변수 전달
  user_data = templatefile("${path.module}/user_data.sh.tftpl", {
    region       = var.region
    cluster_name = aws_eks_cluster.this.name
  })

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "test_eks_bastion"
  }
}


