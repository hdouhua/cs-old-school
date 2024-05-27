#!/usr/bin/env bash


kubeadm join 192.168.64.2:6443 --token e5sq6j.s2rwdcn4zdeksbj3 \
  --discovery-token-ca-cert-hash sha256:403b38b0f62342a345ac5c40c36458d0021f9d76537de1adba5b0749abcdc3f9
