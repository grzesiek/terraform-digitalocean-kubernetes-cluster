resource "digitalocean_kubernetes_cluster" "main_cluster" {
  name    = var.name
  region  = var.region
  version = var.kubernetes_version
  tags    = ["k8s"]

  node_pool {
    name       = var.node_pool_name
    size       = var.node_size
    node_count = var.node_count
  }
}

module "load_balancer_service" {
  source = "./modules/load_balancer"

  cluster_endpoint = digitalocean_kubernetes_cluster.main_cluster.endpoint
  cluster_token    = digitalocean_kubernetes_cluster.main_cluster.kube_config[0].token
  cluster_ca_cert  = base64decode(digitalocean_kubernetes_cluster.main_cluster.kube_config[0].cluster_ca_certificate)
  app_selector     = "my-app"
}
