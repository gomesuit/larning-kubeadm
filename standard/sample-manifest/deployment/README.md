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

```
