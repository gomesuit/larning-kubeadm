# larning-kubeadm

## getting-started

```sh
git submodule update --init
vagrant up
vagrant ssh master -c "$(cat init-kubeadm.sh)"
token=$(vagrant ssh master -c 'sudo kubeadm token list' 2> /dev/null | grep default | awk '{print $1}')
vagrant ssh node1 -c "sudo kubeadm join 192.168.33.10:6443 --token $token --discovery-token-unsafe-skip-ca-verification"
vagrant ssh node2 -c "sudo kubeadm join 192.168.33.10:6443 --token $token --discovery-token-unsafe-skip-ca-verification"
```

## 確認
```sh
# masterで
kubectl get nodes
kubectl get po -o wide --all-namespaces
```

## 削除
```
kubectl drain <node name> --delete-local-data --force --ignore-daemonsets
kubectl delete node <node name>
kubeadm reset
```

## sample
```
kubectl create namespace sock-shop
kubectl apply -n sock-shop -f "https://github.com/microservices-demo/microservices-demo/blob/master/deploy/kubernetes/complete-demo.yaml?raw=true"
kubectl -n sock-shop get svc front-end
curl http://192.168.33.10:<port>
kubectl delete namespace sock-shop
```

- メモ
  - https://kubernetes.io/docs/admin/authorization/
  - https://ishiis.net/2017/01/21/kubernetes-authentication-authorization/
  - https://qiita.com/hiyosi/items/43465d4fc501c2044d01#static-password-file
  - https://kubernetes.io/docs/admin/authentication/#authentication-strategies
  - https://github.com/kubernetes-up-and-running/kuard
