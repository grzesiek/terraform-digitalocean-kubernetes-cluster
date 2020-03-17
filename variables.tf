variable "name" {
  description = "The name of the kubernetes cluster"
  type        = string
  default     = "my-cluster-01"
}

variable "region" {
  description = "DigitalOcean region slug"
  type        = string
  default     = "sfo2"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.16.6-do.1"
}

variable "node_pool_name" {
  description = "Initial node pool name"
  type        = string
  default     = "small-pool"
}

variable "node_size" {
  description = "Droplet node size"
  type        = string
  default     = "s-1vcpu-2gb"
}

variable "node_count" {
  description = "Number of droplets in the initial pool"
  type        = number
  default     = 2
}
