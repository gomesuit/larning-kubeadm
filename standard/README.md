# larning-kubeadm

## getting-started

```sh
git submodule update --init
vagrant up
./create-cluster.sh
```

## get config

```sh
vagrant ssh master -c 'sudo cat /etc/kubernetes/admin.conf' 2> /dev/null > ~/.kube/config
```

## 確認
```sh
# masterで
kubectl get nodes
kubectl get po -o wide --all-namespaces
kubectl get componentstatuses
kubectl get ds -n kube-system kube-proxy
kubectl get svc -n kube-system kube-dns
```

## dashboard

- https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
- https://github.com/kubernetes/dashboard

```sh
kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl proxy
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

## Podの作成

```sh
kubectl run kuard --image=gcr.io/kuar-demo/kuard-amd64:1
kubectl delete deployments/kuard
```

- メモ
  - https://kubernetes.io/docs/admin/authorization/
  - https://ishiis.net/2017/01/21/kubernetes-authentication-authorization/
  - https://qiita.com/hiyosi/items/43465d4fc501c2044d01#static-password-file
  - https://kubernetes.io/docs/admin/authentication/#authentication-strategies
  - https://github.com/kubernetes-up-and-running/kuard
