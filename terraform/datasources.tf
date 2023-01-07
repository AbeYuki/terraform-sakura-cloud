data "sakuracloud_archive" "ubuntu" {
  os_type = "ubuntu2004"
}

data "template_file" "CLOUD_CONFIG_NODE" {
  template = <<YAML
#cloud-config
timezone: Asia/Tokyo
locale: en_US.utf8
hostname = "k8s-node"
ssh_pwauth: false
chpasswd: { expire: False }
ssh_authorized_keys:
  - "${file(var.SSH_PUBLIC_KEY_PATH)}"
runcmd:
- sudo -u ubuntu curl https://releases.rancher.com/install-docker/20.10.sh | sh
- usermod -a -G docker ubuntu
- apt-get install -y dnsutils jq open-iscsi nfs-common
YAML
}