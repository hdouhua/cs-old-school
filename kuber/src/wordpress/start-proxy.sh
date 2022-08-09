# forward net traffic
kubectl port-forward wp-pod 8080:80 &

# start proxy
docker run -d --rm \
  --net=host \
  -v /home/pi/kube/wordpress2/proxy.conf:/etc/nginx/conf.d/default.conf \
  nginx:alpine
