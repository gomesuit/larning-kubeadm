```bash
$ kubectl apply -f fluentd.yaml
daemonset.extensions "fluentd" created 
$ kubectl describe ds fluentd --namespace=kube-system
Name:           fluentd
Selector:       app=fluentd
Node-Selector:  <none>
Labels:         app=fluentd
Annotations:    kubectl.kubernetes.io/last-applied-configuration={"apiVersion":"extensions/v1beta1","kind":"DaemonSet","metadata":{"annotations":{},"labels":{"app":"fluentd"},"name":"fluentd","namespace":"kube-system...
Desired Number of Nodes Scheduled: 2
Current Number of Nodes Scheduled: 2
Number of Nodes Scheduled with Up-to-date Pods: 2
Number of Nodes Scheduled with Available Pods: 0
Number of Nodes Misscheduled: 0
Pods Status:  2 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:  app=fluentd
  Containers:
   fluentd:
    Image:      fluent/fluentd:v0.14.10
    Port:       <none>
    Host Port:  <none>
    Limits:
      memory:  200Mi
    Requests:
      cpu:        100m
      memory:     200Mi
    Environment:  <none>
    Mounts:
      /var/lib/docker/containers from varlibdockercontainers (ro)
      /var/log from varlog (rw)
  Volumes:
   varlog:
    Type:          HostPath (bare host directory volume)
    Path:          /var/log
    HostPathType:
   varlibdockercontainers:
    Type:          HostPath (bare host directory volume)
    Path:          /var/lib/docker/containers
    HostPathType:
Events:
  Type    Reason            Age   From                  Message
  ----    ------            ----  ----                  -------
  Normal  SuccessfulCreate  3m    daemonset-controller  Created pod: fluentd-6kx9j
  Normal  SuccessfulCreate  3m    daemonset-controller  Created pod: fluentd-q8pc9
```

```bash
$ kubectl label nodes node1 ssd=true
node "node1" labeled
$ kubectl get nodes -l ssd=true
NAME      STATUS    ROLES     AGE       VERSION
node1     Ready     <none>    13h       v1.10.0

$ kubectl apply -f nginx-fast-storage.yaml

$ kubectl get pods -o wide
NAME                       READY     STATUS    RESTARTS   AGE       IP           NODE
nginx-fast-storage-bmq4n   1/1       Running   0          30s       10.244.1.7   node1

$ kubectl delete -f nginx-fast-storage.yaml
daemonset.extensions "nginx-fast-storage" deleted
```
