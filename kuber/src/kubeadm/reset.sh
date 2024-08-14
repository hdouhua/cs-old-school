#!/usr/bin/env bash

# drain the node first
kubectl drain <node name> --delete-emptydir-data --force --ignore-daemonsets

# 重置 kubeadm 安装
kubeadm reset

# 清除 iptables 规则
iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X

# reset IPVS table
# ipvsadm -C

# 删除节点
kubectl delete node <node name>
