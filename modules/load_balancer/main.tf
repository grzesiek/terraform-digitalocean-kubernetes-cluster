resource "kubernetes_service" "load_balancer" {
  metadata {
    name        = var.load_balancer_name
    annotations = var.load_balancer_annotations
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = var.app_selector
    }
    port {
      name        = "http"
      port        = 80
      target_port = 8080
    }
  }
}
