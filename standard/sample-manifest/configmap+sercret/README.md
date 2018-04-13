```
$ kubectl create configmap my-config \
--from-file=my-config.txt \
--from-literal=extra-param=extra-value \
--from-literal=another-param=another-value
configmap "my-config" created

$ kubectl get configmap my-config -o yaml
apiVersion: v1
data:
  another-param: another-value
  extra-param: extra-value
  my-config.txt: |
    parameter1 = value1
    parameter2 = value2
kind: ConfigMap
metadata:
  creationTimestamp: 2018-04-13T16:53:39Z
  name: my-config
  namespace: default
  resourceVersion: "132684"
  selfLink: /api/v1/namespaces/default/configmaps/my-config
  uid: 375a062b-3f3b-11e8-abf6-08002737f846

$ kubectl apply -f kuard-config.yaml
pod "kuard-config" created

$ kubectl port-forward kuard-config 8080
Forwarding from 127.0.0.1:8080 -> 8080
Forwarding from [::1]:8080 -> 8080

# http://localhost:8080/-/env
# http://localhost:8080/fs/config/
```

```
$ curl -o kuard.crt https;//storage.googleapis.com/kuar-demo/kuard.crt
$ curl -o kuard.key https://storage.googleapis.com/kuar-demo/kuard.key

$ kubectl create secret generic kuard-tls \
--from-file=kuard.crt \
--from-file=kuard.key

$ kubectl describe secrets kuard-tls
Name:         kuard-tls
Namespace:    default
Labels:       <none>
Annotations:  <none>

Type:  Opaque

Data
====
kuard.crt:  1050 bytes
kuard.key:  1679 bytes

$ kubectl apply -f kuard-secret.yaml
pod "kuard-tls" created

$ kubectl port-forward kuard-tls 8443:8443
Forwarding from 127.0.0.1:8443 -> 8443
Forwarding from [::1]:8443 -> 8443

# https://localhost:8443/
```

```
kubectl create secret docker-registry my-image-pull-secret \
--docker-username=<user> \
--docker-password=<password> \
--docker-email=<email>
```

