# larning-kubeadm

## getting-started
```sh
vagrant up
```

## 確認
```sh
# masterで
kubectl --kubeconfig /etc/kubernetes/admin.conf get nodes
```

## 削除
```
kubectl drain <node name> --delete-local-data --force --ignore-daemonsets
kubectl delete node <node name>
kubeadm reset
```

## sample
```
kubectl --kubeconfig /etc/kubernetes/admin.conf create namespace sock-shop
kubectl --kubeconfig /etc/kubernetes/admin.conf apply -n sock-shop -f "https://github.com/microservices-demo/microservices-demo/blob/master/deploy/kubernetes/complete-demo.yaml?raw=true"
kubectl --kubeconfig /etc/kubernetes/admin.conf -n sock-shop get svc front-end
curl http://192.168.33.10:<port>
kubectl --kubeconfig /etc/kubernetes/admin.conf delete namespace sock-shop
```

