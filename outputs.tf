output "endpoint" {
  value = digitalocean_kubernetes_cluster.main_cluster.endpoint
}

output "kubeconfig" {
  sensitive = true
  value     = digitalocean_kubernetes_cluster.main_cluster.kube_config[0]
}

output "raw_kubeconfig" {
  sensitive = true
  value     = digitalocean_kubernetes_cluster.main_cluster.kube_config[0].raw_config
}

output "token" {
  sensitive = true
  value     = digitalocean_kubernetes_cluster.main_cluster.kube_config[0].token
}

output "ca_certificate" {
  sensitive = true
  value     = base64decode(digitalocean_kubernetes_cluster.main_cluster.kube_config[0].cluster_ca_certificate)
}

output "cluster_ip" {
  value = module.load_balancer_service.ip
}
