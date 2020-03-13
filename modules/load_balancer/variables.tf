variable "cluster_endpoint" {
  description = "Kubernetes cluster endpoint address"
  type        = string
}

variable "cluster_token" {
  description = "Kubernetes cluster token"
  type        = string
}

variable "cluster_ca_cert" {
  description = "Kubernetes cluster CA certificate"
  type        = string
}

variable "load_balancer_name" {
  description = "LoadBalancer service name"
  type        = string
  default     = "load-balancer-svc"
}

variable "load_balancer_annotations" {
  description = "LoadBalancer service annotations"
  type        = map
  default     = {}
}

variable "app_selector" {
  description = "Application name selector"
  type        = string
}
