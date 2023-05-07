variable "projectVersion" {
  default = "202212"
}

resource "sakuracloud_disk" "DISK_1" {
  name              = "k8s-disk-1"
  source_archive_id = data.sakuracloud_archive.ubuntu.id
}

resource "sakuracloud_server" "K8S_MASTER" {
  name        = "k8s-node-${var.projectVersion}"
  disks       = [sakuracloud_disk.DISK_1.id]
  core        = 1
  memory      = 2
  description = "Microk8s"
  tags        = ["k8s=master", "stage=testing", "v${var.projectVersion}"]

  network_interface {
    upstream = "shared"
  }

  disk_edit_parameter {
    hostname        = "microk"
    password        = var.PASSWORD
    disable_pw_auth = true
    ssh_key_ids     = [var.SSH_KEY_IDS]
  }
}

