#!/usr/bin/env bash


# 0) configure prerequisites 
# Ref: https://kubernetes.io/docs/setup/production-environment/container-runtimes/#install-and-configure-prerequisites

# # check port
# nc 127.0.0.1 6443 -v

# # identify the cgroup version
# # - for cgroup v2, the output is cgroup2fs.
# # - for cgroup v1, the output is tmpfs.
# stat -fc %T /sys/fs/cgroup/


cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

# to load the br_netfilter Module temporarily 
sudo modprobe overlay
sudo modprobe br_netfilter
# # to verify the module
# lsmod | grep br_netfilter
# lsmod | grep overlay

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

# to apply the sysctl Parameters without rebooting
sudo sysctl --system
