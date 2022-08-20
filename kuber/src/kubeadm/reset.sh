#!/usr/bin/env bash

# 重置 kubeadm 安装
kubeadm reset

# 清除 iptables 规则
iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X

# 删除节点
kubectl delete node <node name>
