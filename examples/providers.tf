provider "digitalocean" {
  token = var.digitalocean_access_token
}

provider "kubernetes" {
  load_config_file       = false
  host                   = module.digitalocean_cluster.endpoint
  token                  = module.digitalocean_cluster.token
  cluster_ca_certificate = module.digitalocean_cluster.ca_certificate
}
