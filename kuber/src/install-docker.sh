#!/usr/bin/env bash

# # upgrade debian
# # https://wiki.debian.org/DebianUpgrade

# sudo mkdir -p /sys/fs/cgroup/systemd
# sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd

# echo "GRUB_CMDLINE_LINUX=systemd.unified_cgroup_hierarchy=false" | sudo tee /etc/default/grub.d/cgroup.cfg
# sudo update-grub

sudo apt install iptables

curl -sL https://download.docker.com/linux/debian/dists/bullseye/pool/stable/amd64/containerd.io_1.6.24-1_amd64.deb -o containerd.io.deb
curl -sL https://download.docker.com/linux/debian/dists/bullseye/pool/stable/amd64/docker-ce-cli_24.0.6-1~debian.11~bullseye_amd64.deb -o docker-ce-cli.deb
curl -sL https://download.docker.com/linux/debian/dists/bullseye/pool/stable/amd64/docker-ce_24.0.6-1~debian.11~bullseye_amd64.deb -o docker-ce.deb
curl -sL https://download.docker.com/linux/debian/dists/bullseye/pool/stable/amd64/docker-compose-plugin_2.21.0-1~debian.11~bullseye_amd64.deb -o docker-compose-plugin.deb
# curl -sL https://download.docker.com/linux/debian/dists/bullseye/pool/stable/amd64/docker-buildx-plugin_0.11.2-1~debian.11~bullseye_amd64.deb -o docker-buildx-plugin.deb
# curl -sL https://download.docker.com/linux/debian/dists/bullseye/pool/stable/amd64/docker-scan-plugin_0.23.0~debian-bullseye_amd64.deb -o docker-scan-plugin.deb 
# curl -sL https://download.docker.com/linux/debian/dists/bullseye/pool/stable/amd64/docker-ce-rootless-extras_24.0.6-1~debian.11~bullseye_amd64.deb -o docker-ce-rootless-extras.deb

sudo dpkg -i containerd.io.deb
sudo dpkg -i docker-ce-cli.deb
sudo dpkg -i docker-ce.deb
sudo dpkg -i docker-compose-plugin.deb

sudo service docker start
sudo usermod -aG docker ${USER}
