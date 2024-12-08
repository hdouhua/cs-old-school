#!/usr/bin/env bash


# uninstall docker
sudo dpkg -r containerd.io docker-ce docker-ce-cli docker-compose-plugin
# sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

# delete all images, containers, and volumes
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
