resource "rke_cluster" "cluster" {
  cluster_name          = "oci-rke-cluster"
  kubernetes_version    = "v1.24.4-rancher1-1"
  enable_cri_dockerd    = true
  ignore_docker_version = true
  disable_port_check    = true
  delay_on_creation     = 120
  addon_job_timeout     = 60
  nodes {
    address           = sakuracloud_server.K8S_NODE.ip_address
    user              = "ubuntu"
    ssh_key           = file(var.PRIVATE_KEY_INSTANCE_PATH)
    role              = ["controlplane", "worker", "etcd"]
    node_name         = sakuracloud_server.K8S_NODE.name
    hostname_override = sakuracloud_server.K8S_NODE.name
  }
  network {
    plugin = "flannel"
  }
  ingress {
    provider = "none"
  }
  monitoring {
    provider = "none"
  }
  upgrade_strategy {
    drain                        = true
    max_unavailable_worker       = "20%"
    max_unavailable_controlplane = "1"
  }
}


resource "local_file" "kube_cluster_yaml" {
  filename = "${path.root}/kube_config_cluster.yml"
  content  = rke_cluster.cluster.kube_config_yaml
}

resource "local_file" "rke_cluster_yaml" {
  filename = "${path.root}/cluster.yml"
  content  = rke_cluster.cluster.rke_cluster_yaml
}

resource "local_file" "rke_state" {
  filename = "${path.root}/cluster.rkestate"
  content  = rke_cluster.cluster.rke_state
}