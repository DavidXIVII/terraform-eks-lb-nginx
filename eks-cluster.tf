# EKS module
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.29.0"

  cluster_name    = local.cluster-name
  cluster_version = "1.22"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    one = {
      name = "lemonade"

      instance_type = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 2

      vpc_security_group_ids = [aws_security_group.group_one.id]
    }

    two = {
      name = "chocolate"

      instance_type = ["t3.small"]

      min_size     = 1
      max_size     = 3
      desired_size = 1

      vpc_security_group_ids = [aws_security_group.group_two.id]
    }
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
