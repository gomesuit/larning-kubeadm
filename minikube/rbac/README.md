# readme

- 参考
  - http://qiita.com/tkusumi/items/f53f4660377bf5d848c0

```
minikube start --kubernetes-version=v1.6.0 --extra-config=apiserver.Authorization.Mode=RBAC --extra-config=apiserver.Audit.Path=/var/log/kubernetes/audit.log

# wget https://raw.githubusercontent.com/zlabjp/kubernetes-scripts/master/create-kubeconfig
# chmod +x create-kubeconfig

kubectl create sa alice
./create-kubeconfig alice > alice.cfg

# alice の接続情報を使って pod と service の参照をしてみる
KUBECONFIG=alice.cfg kubectl get pods,svc

# alice に namespae default の view ロールを付与する
kubectl create rolebinding alice-view --clusterrole=view --serviceaccount=default:alice --namespace=default

KUBECONFIG=alice.cfg kubectl get pods,svc

# 別の namespace (kube-system) なので読み取り権限がない
KUBECONFIG=alice.cfg kubectl get pods,svc -n kube-system
```
