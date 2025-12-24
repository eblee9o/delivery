resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.nodegroup_name
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = [aws_subnet.test_eks_sb1.id, aws_subnet.test_eks_sb3.id]

  instance_types = [var.node_instance_type]
  disk_size      = var.node_disk_size

  scaling_config {
    desired_size = var.node_desired_size
    min_size     = var.node_min_size
    max_size     = var.node_max_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_worker_policy,
    aws_iam_role_policy_attachment.node_ecr_readonly,
    aws_iam_role_policy_attachment.node_cni,
  ]

  tags = merge(local.tags, {
    Name = "${var.eks_cluster_name}-${var.nodegroup_name}"
  })
}

