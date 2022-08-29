provider "kubernetes" {
  config_path    = "~/.kube/config"

}


resource "kubernetes_namespace" "sample-app" {
  metadata {
    name = "sample-application"
  }
}

resource "kubernetes_deployment" "sample-app" {
  metadata {
    name      = "sample-app"
    namespace = kubernetes_namespace.sample-app.metadata.0.name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "sample-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "sample-app"
        }
      }
      spec {
        container {
          image = "davideden/weatherapp"
          name  = "weatherapp"
          port {
            container_port = 5000
          }
      }
    }
  }
}
}

resource "kubernetes_service" "sample-app" {
  metadata {
    name      = "sample-app-service"
    namespace = kubernetes_namespace.sample-app.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.sample-app.spec.0.template.0.metadata.0.labels.app
    }
    type = "LoadBalancer"
    port {
      port        = 80
      target_port = 5000
    }
  }
}
