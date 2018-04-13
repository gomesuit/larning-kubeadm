```
$ kubectl run nginx --image=nginx:1.7.12
deployment.apps "nginx" created

$ kubectl get deploy nginx
NAME      DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx     1         1         1            0           13s

$ kubectl get deploy nginx -o jsonpath --template '{.spec.selector.matchLabels}'
map[run:nginx]

$ kubectl get rs -l run=nginx
NAME               DESIRED   CURRENT   READY     AGE
nginx-7d9bf79f9b   1         1         1         2m


$ kubectl scale deploy nginx --replicas=2
deployment.extensions "nginx" scaled

$ kubectl get rs -l run=nginx
NAME               DESIRED   CURRENT   READY     AGE
nginx-7d9bf79f9b   2         2         1         3m

$ kubectl scale rs nginx-7d9bf79f9b --replicas=1
replicaset.extensions "nginx-7d9bf79f9b" scaled

$ kubectl get rs -l run=nginx
NAME               DESIRED   CURRENT   READY     AGE
nginx-7d9bf79f9b   2         2         1         9m

$ kubectl get deploy nginx --export -o yaml > nginx-deployment.yaml
$ kubectl replace -f nginx-deployment.yaml --save-config
deployment.extensions "nginx" replaced

deployment $ kubectl describe deploy nginx
Name:                   nginx
Namespace:              default
CreationTimestamp:      Sat, 14 Apr 2018 02:58:02 +0900
Labels:                 run=nginx
Annotations:            deployment.kubernetes.io/revision=1
                        kubectl.kubernetes.io/last-applied-configuration={"apiVersion":"extensions/v1beta1","kind":"Deployment","metadata":{"annotations":{"deployment.kubernetes.io/revision":"1"},"creationTimestamp":null,"ge...
Selector:               run=nginx
Replicas:               2 desired | 2 updated | 2 total | 2 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  1 max unavailable, 1 max surge
Pod Template:
  Labels:  run=nginx
  Containers:
   nginx:
    Image:        nginx:1.7.12
    Port:         <none>
    Host Port:    <none>
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   nginx-7d9bf79f9b (2/2 replicas created)
Events:
  Type    Reason             Age               From                   Message
  ----    ------             ----              ----                   -------
  Normal  ScalingReplicaSet  16m               deployment-controller  Scaled up replica set nginx-7d9bf79f9b to 1
  Normal  ScalingReplicaSet  6m (x2 over 12m)  deployment-controller  Scaled up replica set nginx-7d9bf79f9b to 2


# replicas 2 -> 3
$ kubectl apply -f nginx-deployment.yaml
deployment.extensions "nginx" configured

$ kubectl get deploy nginx
NAME      DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
nginx     3         3         3            3           17m


# nginx update 1.9.10

$ kubectl apply -f nginx-deployment.yaml
deployment.extensions "nginx" configured

$ kubectl rollout status deploy nginx
deployment "nginx" successfully rolled out

$ kubectl get rs -o wide
NAME               DESIRED   CURRENT   READY     AGE       CONTAINERS   IMAGES         SELECTOR
nginx-784d96dbff   3         3         3         2m        nginx        nginx:1.9.10   pod-template-hash=3408528699,run=nginx
nginx-7d9bf79f9b   0         0         0         30m       nginx        nginx:1.7.12   pod-template-hash=3856935956,run=nginx

$ kubectl rollout pause deploy nginx
$ kubectl rollout resume deploy nginx

$ kubectl rollout history deploy nginx
deployments "nginx"
REVISION  CHANGE-CAUSE
1         <none>
2         Update nginx to 1.9.10

$ kubectl rollout history deploy nginx --revision=2
deployments "nginx" with revision #2
Pod Template:
  Labels:       pod-template-hash=3408528699
        run=nginx
  Annotations:  kubernetes.io/change-cause=Update nginx to 1.9.10
  Containers:
   nginx:
    Image:      nginx:1.9.10
    Port:       <none>
    Host Port:  <none>
    Environment:        <none>
    Mounts:     <none>
  Volumes:      <none>



# nginx 1.9.10 -> 1.10.2
$ kubectl apply -f nginx-deployment.yaml
deployment.extensions "nginx" configured

$ kubectl rollout history deploy nginx
deployments "nginx"
REVISION  CHANGE-CAUSE
1         <none>
2         Update nginx to 1.9.10
3         Update nginx to 1.10.2

$ kubectl rollout undo deploy nginx
deployment.apps "nginx"

$ kubectl get rs -o wide
NAME               DESIRED   CURRENT   READY     AGE       CONTAINERS   IMAGES         SELECTOR
nginx-5c9fb5498f   0         0         0         50s       nginx        nginx:1.10.2   pod-template-hash=1759610549,run=nginx
nginx-784d96dbff   3         3         2         10m       nginx        nginx:1.9.10   pod-template-hash=3408528699,run=nginx
nginx-7d9bf79f9b   0         0         0         37m       nginx        nginx:1.7.12   pod-template-hash=3856935956,run=nginx

$ kubectl rollout history deploy nginx
deployments "nginx"
REVISION  CHANGE-CAUSE
1         <none>
3         Update nginx to 1.10.2
4         Update nginx to 1.9.10

$ kubectl rollout undo deploy nginx --to-revision=3
deployment.apps "nginx"

$ kubectl rollout history deploy nginx
deployments "nginx"
REVISION  CHANGE-CAUSE
1         <none>
4         Update nginx to 1.9.10
5         Update nginx to 1.10.2

$ kubectl delete -f nginx-deployment.yaml
deployment.extensions "nginx" deleted
```
