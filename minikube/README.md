# readme

- install
  - https://github.com/kubernetes/minikube/releases

```
# start
minikube start

# sample
kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
kubectl expose deployment hello-minikube --type=NodePort
kubectl get pod
curl $(minikube service hello-minikube --url)

# stop
minikube stop

# delete
minikube delete
```

- 参考
  - https://kubernetes.io/docs/getting-started-guides/minikube/
