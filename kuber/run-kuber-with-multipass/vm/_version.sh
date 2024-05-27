#!/usr/bin/env bash


echo -e "\n- containerd:"
containerd -v

echo -e "\n- runc:"
runc --version

echo -e "\n- crictl:"
crictl -v

echo -e "\n- kubectl:"
kubectl version --client=true

echo -e "\n- kubelet:"
kubelet --version

echo -e "\n- kubeadm:"
kubeadm version
