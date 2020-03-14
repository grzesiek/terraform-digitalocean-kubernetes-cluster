module "digitalocean_cluster" {
  source = "../"
  name = "my-test-cluster"
}

output "cluster_ip" {
  value = module.digitalocean_cluster.cluster_ip
}

output "kubeconfig" {
  sensitive = true
  value     = module.digitalocean_cluster.raw_kubeconfig
}
