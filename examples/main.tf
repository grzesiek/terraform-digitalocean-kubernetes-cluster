module "digitalocean_cluster" {
  source = "../"
  name   = "my-test-cluster"
}

resource "kubernetes_cluster_role_binding" "hello-pods" {
  metadata {
    name = "hello-pods-role-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "view"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "default"
  }
}

resource "kubernetes_deployment" "hello-pods" {
  depends_on = [kubernetes_cluster_role_binding.hello-pods]

  metadata {
    name = "hello-pods"
    labels = {
      app = "my-app"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "my-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-app"
        }
      }

      spec {
        automount_service_account_token = true

        container {
          image = "registry.gitlab.com/grzesiek/hello-pods:latest"
          name  = "hello-pods"
        }
      }
    }
  }
}

