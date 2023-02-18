resource "sakuracloud_server" "K8S_NODE" {
  name        = "k8s-node"
  disks       = [sakuracloud_disk.DISK.id]
  core        = 1
  memory      = 2
  description = "Microk8s"
  tags        = ["k8s=master-worker", "stage=testing"]

  network_interface {
    upstream = "shared"
  }

  disk_edit_parameter {
    hostname        = "microk8s"
    password        = var.PASSWORD
    disable_pw_auth = true

    ssh_key_ids     = [var.SSH_KEY_IDS]
  }
}

resource "sakuracloud_disk" "DISK" {
  name              = "k8s-disk"
  source_archive_id = data.sakuracloud_archive.ubuntu.id
}