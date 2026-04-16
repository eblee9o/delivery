##eks 
locals {
  public_subnets_csv = join(",", [
    aws_subnet.test_public_subnet1.id,
    aws_subnet.test-public-subnet3.id
  ])
}

resource "aws_instance" "test_eks_bastion" {
  ami                    = "ami-0a71e3eb8b23101ed"
  instance_type          = "t3.small"
  subnet_id              = aws_subnet.test_public_subnet1.id
  vpc_security_group_ids = [aws_security_group.test_eks_bastion_sg.id]
  key_name               = var.key_name
  #   iam_instance_profile        = aws_iam_instance_profile.bastion_profile.name #eks 설치위하여
  iam_instance_profile        = module.iam_policy.bastion_instance_profile_name
  associate_public_ip_address = true

  # 템플릿에 변수 전달
  user_data = templatefile("${path.module}/user_data.sh.tftpl", {
    region       = var.region
    cluster_name = aws_eks_cluster.this.name

  })
  user_data_replace_on_change = true

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  depends_on = [module.iam_policy]

  tags = {
    Name = "test_eks_bastion"
  }
}


