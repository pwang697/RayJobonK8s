#!/bin/bash

set -e

# Specify the namespace
KUBE_NAMESPACE=ray-job

# Download and install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm -rf get_helm.sh

# Install both CRDs and KubeRay operator v1.1.0 as user:kubernetes in the specified namespace
su - kubernetes <<EOF
helm repo add kuberay https://ray-project.github.io/kuberay-helm/
helm repo update
helm -n $KUBE_NAMESPACE install kuberay-operator kuberay/kuberay-operator --version 1.1.0
EOF
