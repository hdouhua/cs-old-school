#!/usr/bin/env bash

# install from binary
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl"
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl.sha256"
# echo "$(cat kubectl.sha256)  kubectl" | shasum -a 256 --check
# chmod +x ./kubectl
# sudo mv ./kubectl /usr/local/bin/kubectl
# sudo chown root: /usr/local/bin/kubectl


# instlal via brew
brew install kubectl
export KUBECONFIG=~/workspace/lab/cs-old-school/kuber/run-kuber-with-multipass/.kube/config
