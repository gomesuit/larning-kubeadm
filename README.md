# larning-kubeadm

## getting-started
```sh
vagrant up
kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f https://git.io/weave-kube-1.6
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
