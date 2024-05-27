#!/usr/bin/env bash


# init cluster
sudo kubeadm init \
  --pod-network-cidr=10.10.0.0/16 \
  --apiserver-advertise-address=192.168.64.2

# copy config file of kubeadm
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# download network plugin
wget https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
sed -i 's/"Network": "10.244.0.0\/16"/"Network": "10.10.0.0\/16"/' kube-flannel.yml
# deploy a pod network
kubectl apply -f kube-flannel.yml

kubeadm token create --print-join-command > init_worker.sh
