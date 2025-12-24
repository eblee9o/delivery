locals {
  tags = {
    Project = var.name
  }
  admin_principal = var.admin_principal_arn != "" ? var.admin_principal_arn : aws_iam_role.bastion_role.arn
}

