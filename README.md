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
- Split IaC | Deployment [v] - Done
- Add an application deployment [v] - Done

- Add details about AWS CLI Configuration
- Add details about the EKS infrastructure []
- Generic Deployments using variables []

## Prerequisites:
- [AWS Account](https://aws.amazon.com)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) version ~> 2
  - [AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- [Terraform](https://hashicorp.com)


## Usage:

```sh
git clone https://github.com/DavidXIVII/terraform-eks-lb-nginx
```

For each folder your would want to initilize it, plan it & apply it.
You will begin doing so on the main folder in order to initilize the creation for your EKS

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
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
```

After that was done you are ready to deploy k8s pods in your network using LoadBalancer.

Navigiate to the Application/Nginx folder and run:

```sh
terraform init
```


```sh
terraform plan
```


```sh
terraform apply
```

Notice that now we didn't run the aws eks command because it was initiated once and the parameters are set.
