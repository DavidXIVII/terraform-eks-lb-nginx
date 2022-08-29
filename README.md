# terraform-eks-lb-nginx
<h1 align="center">Terraform + AWS EKS + LB + NGiNX</h1>

<br />
<div align="center">
<img alt="GitHub release (latest SemVer)" src="https://img.shields.io/github/v/release/davidxivii/terraform-eks-lb-nginx">
</div>
<br />

terrafrom-eks-lb-nginx is my own version and usage of Terraform with AWS eks, LoadBalancer & nginx.

This was made using two guides, [Terraform EKS Deployment](https://learn.hashicorp.com/tutorials/terraform/eks?in=terraform/kubernetes) & [Clickittech](https://www.clickittech.com/devops/terraform-kubernetes-deployment/).


## Current Goal:
- Add an application deployment [V] - Done

## Prerequisites:
- AWS Account
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) version ~> 2
- [Terraform](hashicorp.com)


## Usage:

```sh
git clone https://github.com/DavidXIVII/terraform-eks-lb-nginx
```


```sh
terraform init
```


```sh
terraform plan
```


```sh
terraform apply
```


```sh
aws eks --region $(terraform output -raw region) update-kubeconfig \
    --name $(terraform output -raw cluster_name)
```
