resource "sakuracloud_disk" "DISK" {
  name              = "k8s-disk"
  size              = 20
  source_archive_id = data.sakuracloud_archive.ubuntu.id
}

resource "sakuracloud_note" "K8S_INIT" {
    name = "k8s-init-shell"
    content = "${file("./provisioning/install.sh")}"
}


resource "sakuracloud_server" "K8S_NODE" {
  name        = "k8s-node"
  disks       = [sakuracloud_disk.DISK.id]
  core        = 1
  memory      = 1
  description = "RKE"
  tags        = ["k8s=master-worker", "stage=testing"]
  network_interface {
    upstream = "shared"
  }
  disk_edit_parameter {
    disable_pw_auth = true
    ssh_keys        = ["${file(var.SSH_PUBLIC_KEY_PATH)}"]
    note_ids = ["${sakuracloud_note.K8S_INIT.id}"]
  }
}

