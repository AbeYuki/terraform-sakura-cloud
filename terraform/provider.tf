terraform {
  backend "s3" {
    bucket  = "aimhighergg-tfstate"
    region  = "ap-northeast-1"
    key     = "sakura-cloud.tfstate"
    encrypt = true
  }
  required_providers {
    sakuracloud = {
      source  = "sacloud/sakuracloud"
      version = "2.21.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}
provider "sakuracloud" {
  token  = var.SAKURACLOUD_ACCESS_TOKEN
  secret = var.SAKURACLOUD_ACCESS_TOKEN_SECRET
  zone   = var.SAKURACLOUD_ZONE
}
provider "aws" {
  profile = "default"
  region  = "ap-northeast-1"
}