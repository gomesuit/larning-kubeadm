```bash
$ kubectl apply -f kuard-rs.yaml
replicaset.extensions "kuard" created
$ kubectl get po
NAME          READY     STATUS    RESTARTS   AGE
kuard-2fsnr   1/1       Running   0          20s

$ kubectl describe rs kuard
Name:         kuard
Namespace:    default
Selector:     app=kind,version=2
Labels:       app=kind
              version=2
Annotations:  kubectl.kubernetes.io/last-applied-configuration={"apiVersion":"extensions/v1beta1","kind":"ReplicaSet","metadata":{"annotations":{},"name":"kuard","namespace":"default"},"spec":{"replicas":1,"templat...
Replicas:     1 current / 1 desired
Pods Status:  1 Running / 0 Waiting / 0 Succeeded / 0 Failed
Pod Template:
  Labels:  app=kind
           version=2
  Containers:
   kuard:
    Image:        gcr.io/kuar-demo/kuard-amd64:2
    Port:         <none>
    Host Port:    <none>
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Events:
  Type    Reason            Age   From                   Message
  ----    ------            ----  ----                   -------
  Normal  SuccessfulCreate  1m    replicaset-controller  Created pod: kuard-2fsnr

$ kubectl scale rs kuard --replicas=4
$ kubectl get pods --show-labels
NAME          READY     STATUS    RESTARTS   AGE       LABELS
kuard-4jwgk   1/1       Running   0          21s       app=kuard,version=2
kuard-69869   1/1       Running   0          21s       app=kuard,version=2
kuard-knn48   1/1       Running   0          58s       app=kuard,version=2
kuard-nrwh6   1/1       Running   0          21s       app=kuard,version=2

$ kubectl autoscale rs kuard --min=2 --max=5 --cpu-percent=80
replicaset.apps "kuard" autoscaled
$ kubectl get hpa
NAME      REFERENCE          TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
kuard     ReplicaSet/kuard   <unknown>/80%   2         5         4          13s

$ kubectl delete rs kuard
```
