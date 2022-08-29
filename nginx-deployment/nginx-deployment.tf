### Kubernetes Deployment Of NGiNX ###

provider "kubernetes" {
  config_path    = "~/.kube/config"

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
