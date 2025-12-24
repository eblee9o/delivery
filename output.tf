output "bastion_public_ip" {
  description = "Bastion EC2 public IPv4"
  value       = aws_instance.test_eks_bastion.public_ip
}

output "public_subnet_ids" {
  description = "Public subnet IDs for EKS"
  value = [
    aws_subnet.test_eks_sb1.id,
    aws_subnet.test_eks_sb3.id
  ]
}

output "public_subnets_csv" {
  description = "Comma-separated public subnet IDs for eksctl"
  value       = join(",", [aws_subnet.test_eks_sb1.id, aws_subnet.test_eks_sb3.id])
}

output "bastion_ssh" {
  value = "ssh -i ./demo-key.ppk ubuntu@${aws_instance.test_eks_bastion.public_ip}"
}

output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "update_kubeconfig_cmd" {
  value = "aws eks update-kubeconfig --region ${var.region} --name ${aws_eks_cluster.this.name}"
}
