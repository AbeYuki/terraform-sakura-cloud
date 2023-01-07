#!/bin/bash

kubectl_version="v1.24.0"
tf_version="1.3.6"

# install docker 
curl https://releases.rancher.com/install-docker/20.10.sh | sh


# install kubectl
if [ $(uname -i) = aarch64 ]; then
    curl -LO https://storage.googleapis.com/kubernetes-release/release/${kubectl_version}/bin/linux/arm64/kubectl
elif [ $(uname -i) = x86_64 ]; then
    curl -LO https://storage.googleapis.com/kubernetes-release/release/${kubectl_version}/bin/linux/amd64/kubectl
fi
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl


# install terraform
if [ $(uname -i) = aarch64 ]; then
    curl -LO https://releases.hashicorp.com/terraform/${tf_version}/terraform_${tf_version}_linux_arm64.zip
    echo y | unzip terraform_${tf_version}_linux_arm64.zip && rm terraform_${tf_version}_linux_arm64.zip
elif [ $(uname -i) = x86_64 ]; then
    curl -LO https://releases.hashicorp.com/terraform/${tf_version}/terraform_${tf_version}_linux_amd64.zip
    echo y | unzip terraform_${tf_version}_linux_amd64.zip && rm terraform_${tf_version}_linux_amd64.zip
fi
sudo mv ./terraform /usr/local/bin/terraform
