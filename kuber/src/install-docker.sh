sudo apt install iptables

wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/containerd.io_1.6.7-1_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce-cli_20.10.17~3-0~ubuntu-jammy_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-ce_20.10.17~3-0~ubuntu-jammy_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/amd64/docker-compose-plugin_2.6.0~ubuntu-jammy_amd64.deb

sudo dpkg -i containerd.io_1.6.7-1_amd64.deb
sudo dpkg -i docker-ce-cli_20.10.17~3-0~ubuntu-jammy_amd64.deb
sudo dpkg -i docker-ce_20.10.17~3-0~ubuntu-jammy_amd64.deb
sudo dpkg -i docker-compose-plugin_2.6.0~ubuntu-jammy_amd64.deb

sudo service docker start
sudo usermod -aG docker ${USER}
