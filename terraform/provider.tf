terraform {
  required_providers {
    sakuracloud = {
      source  = "sacloud/sakuracloud"
      version = "2.21.0"
    }
  }
}
provider "sakuracloud" {
  token  = var.SAKURACLOUD_ACCESS_TOKEN
  secret = var.SAKURACLOUD_ACCESS_TOKEN_SECRET
  zone   = var.SAKURACLOUD_ZONE
}