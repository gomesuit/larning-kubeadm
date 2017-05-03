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
