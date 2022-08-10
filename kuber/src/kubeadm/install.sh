sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# 指定安装的版本，这个版本是为了使用 docker 作为容器运行时 CRI
sudo apt-get update
sudo apt install -y kubeadm=1.23.9-00 kubelet=1.23.9-00 kubectl=1.23.9-00

# 锁定这三个软件的版本，避免意外升级导致版本错误
sudo apt-mark hold kubeadm kubelet kubectl
# sudo apt-mark unhold kubeadm kubelet kubectl
