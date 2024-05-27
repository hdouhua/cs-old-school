# run Kubernets on Mac (Intel/Apple Silicon) with Multipass and kubeadm

1. install Multipass

   ```shell
   brew install --cask multipass
   ```

1. install

   - create VMs

     ```shell
     ./install-vm.sh
     ```

   - setup control-panel node

     ```shell
     multipass transfer -r vm vm1:/home/ubuntu/
     multipass shell vm1
     cd vm
     ./install.sh
     ./init_control_panel.sh
     ```

     example of output

     ```text
     Your Kubernetes control-plane has initialized successfully!
     
     To start using your cluster, you need to run the following as a regular user:
     
       mkdir -p $HOME/.kube
       sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
       sudo chown $(id -u):$(id -g) $HOME/.kube/config
     
     Alternatively, if you are the root user, you can run:
     
       export KUBECONFIG=/etc/kubernetes/admin.conf
     
     You should now deploy a pod network to the cluster.
     Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
       https://kubernetes.io/docs/concepts/cluster-administration/addons/
     
     Then you can join any number of worker nodes by running the following on each as root:
     
     kubeadm join 192.168.64.2:6443 --token e5sq6j.s2rwdcn4zdeksbj3 \
     	--discovery-token-ca-cert-hash sha256:403b38b0f62342a345ac5c40c36458d0021f9d76537de1adba5b0749abcdc3f9
     ```

   - setup worker node

      ```shell
      multipass transfer -r vm1:/home/ubuntu/vm vm2:/home/ubuntu/
      multipass shell vm2
      cd vm
      ./install.sh
      ./_3b_worker.sh
      ```

1. verify cluster

   ```shell
   kubectl cluster-info
   kubectl get pods -A
   ```

1. install kubectl on Mac

   ```shell
   brew install kubectl
   multipass transfer vm1:/home/ubuntu/.kube/config .kubeadm
   export KUBECONFIG=~/workspace/lab/cs-old-school/kuber/run-kuber-with-multipass/.kubeadm
   ```

1. run nginx service

   ```shell
   kubectl run ngx --image=nginx:alpine
   kubectl get pod -o wide
   kubectl expose pod ngx --type=NodePort --port=80 --name=nginx-service
   
   kubectl get svc
   NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
   kubernetes      ClusterIP   10.96.0.1       <none>        443/TCP        176m
   nginx-service   NodePort    10.111.142.89   <none>        80:31461/TCP   12s
   
   curl http://192.168.64.2:31461/
   curl http://192.168.64.3:31461/
   ```

1. cleanup

```shell
./destroy.sh
```

## reference

- [Kubernetes on Apple Silicon Mac with kubeadm and multipass](https://yuki-nakamura.com/2023/05/27/kubernetes-on-apple-silicon-mac-with-kubeadm-and-multipass/)
- [Kubernetes Cluster Made Easy by using Multipass!](https://github.com/yujunliang/multipass-kubernetes/blob/master/README.md)
