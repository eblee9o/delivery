###VPC
variable "region" {
  type    = string
  default = "ap-northeast-2"
}
variable "allowed_ssh_cidr" {
  type = string
  # 테스트용. 운영이면 본인 공인IP/32로 바꿔.
  default = "0.0.0.0/0"
}
variable "key_name" {
  type    = string
  default = "demo-key"
}

###instance
variable "bastion_ami" {
  type    = string
  default = "ami-0a71e3eb8b23101ed"
}

variable "bastion_instance_type" {
  type    = string
  default = "t3.micro"
}

###node-group
variable "nodegroup_name" {
  type    = string
  default = "test-ng"
}

variable "node_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "node_disk_size" {
  type    = number
  default = 20
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "node_min_size" {
  type    = number
  default = 1
}

variable "node_max_size" {
  type    = number
  default = 2
}

### cluster
variable "eks_cluster_name" {
  type    = string
  default = "test-eks-cluster"
}
variable "eks_region" {
  type    = string
  default = "ap-northeast-2"
}

# EKS API 접근 권한(클러스터 관리자)을 줄 principal ARN
# 기본은 "바스천 role"에 관리자 권한을 부여하도록 구성(가장 간단/안전)
variable "admin_principal_arn" {
  type    = string
  default = ""
}

############
variable "name" {
  type    = string
  default = "ddddemo-key"
}

