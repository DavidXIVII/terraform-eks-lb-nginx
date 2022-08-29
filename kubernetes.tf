### Kubernetes Deployment Of NGiNX ###

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}


resource "kubernetes_namespace" "NGiNX" {
  metadata {
    name = "nginx-ns"
  }
}
resource "kubernetes_deployment" "NGiNX" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.NGiNX.metadata.0.name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          image = "nginx"
          name  = "nginx-container"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "NGiNX" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.NGiNX.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.NGiNX.spec.0.template.0.metadata.0.labels.app
    }
    type = "LoadBalancer"
    port {
      port        = 80
      target_port = 80
    }
  }
}
