output "ip" {
  value = kubernetes_service.load_balancer.load_balancer_ingress[0].ip
}
