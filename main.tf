# Main tf file
# Deploying Kubernetes & AWS providers
# Not deploying a kubernetes Prodiveder Otherwise will throw error
# Data variable holds the AZs
# Local variable populates the cluster name using random.

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

locals {
  cluster-name = "Terraform-EKS-LB-NGiNX-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 6
  special = false
}
