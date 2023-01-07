terraform {
  backend "kubernetes" {
    secret_suffix  = "sakura-cloud-rke"
    config_path    = "~/.kube/config_microk8s_node2"
    namespace      = "terraform"
    config_context = "microk8s-node2"
  }
  required_providers {
    sakuracloud = {
      source  = "sacloud/sakuracloud"
      version = "2.21.0"
    }
    rke = {
      source  = "rancher/rke"
      version = "1.3.4"
    }
  }
}
provider "sakuracloud" {
  token  = var.SAKURACLOUD_ACCESS_TOKEN
  secret = var.SAKURACLOUD_ACCESS_TOKEN_SECRET
  zone   = var.SAKURACLOUD_ZONE
}
provider "rke" {
  debug    = true
  log_file = "rke_debug.log"
}