module "iam_policy" {
  source = "./iam_policy"

  eks_cluster_name = var.eks_cluster_name
  tags             = local.tags

}
