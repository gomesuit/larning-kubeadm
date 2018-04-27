
```
kubectl run alpaca-prod \
--image=gcr.io/kuar-demo/kuard-amd64:1 \
--replicas=2 \
--labels="ver=1,app=alpaca,env=prod"

kubectl run alpaca-test \
--image=gcr.io/kuar-demo/kuard-amd64:2 \
--replicas=1 \
--labels="ver=2,app=alpaca,env=test"

kubectl run bandicoot-prod \
--image=gcr.io/kuar-demo/kuard-amd64:2 \
--replicas=2 \
--labels="ver=2,app=bandicoot,env=prod"

kubectl run bandicoot-staging \
--image=gcr.io/kuar-demo/kuard-amd64:2 \
--replicas=1 \
--labels="ver=2,app=bandicoot,env=staging"

kubectl get deploy --show-labels

kubectl label deploy alpaca-test "canary=true"

kubectl label deploy alpaca-test "canary-"
```

```
$ kubectl get deploy -L canary
NAME                DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE       CANARY
alpaca-prod         2         2         2            2           11m
alpaca-test         1         1         1            1           7m        true
bandicoot-prod      2         2         2            2           5m
bandicoot-staging   1         1         1            1           5m
```

```
$ kubectl get pod --show-labels
NAME                                 READY     STATUS    RESTARTS   AGE       LABELS
alpaca-prod-65587bf567-bcmvg         1/1       Running   0          15m       app=alpaca,env=prod,pod-template-hash=2114369123,ver=1
alpaca-prod-65587bf567-nrx65         1/1       Running   0          15m       app=alpaca,env=prod,pod-template-hash=2114369123,ver=1
alpaca-test-6658d779cc-sb9bt         1/1       Running   0          11m       app=alpaca,env=test,pod-template-hash=2214833577,ver=2
bandicoot-prod-7bddc557cc-92l59      1/1       Running   0          9m        app=bandicoot,env=prod,pod-template-hash=3688711377,ver=2
bandicoot-prod-7bddc557cc-ljpvh      1/1       Running   0          9m        app=bandicoot,env=prod,pod-template-hash=3688711377,ver=2
bandicoot-staging-7f4788b6df-hvqgn   1/1       Running   0          9m        app=bandicoot,env=staging,pod-template-hash=3903446289,ver=2

$ kubectl get pods --selector="ver=2"
NAME                                 READY     STATUS    RESTARTS   AGE
alpaca-test-6658d779cc-sb9bt         1/1       Running   0          13m
bandicoot-prod-7bddc557cc-92l59      1/1       Running   0          11m
bandicoot-prod-7bddc557cc-ljpvh      1/1       Running   0          11m
bandicoot-staging-7f4788b6df-hvqgn   1/1       Running   0          10m

$ kubectl get pods --selector="app=bandicoot,ver=2"
NAME                                 READY     STATUS    RESTARTS   AGE
bandicoot-prod-7bddc557cc-92l59      1/1       Running   0          12m
bandicoot-prod-7bddc557cc-ljpvh      1/1       Running   0          12m
bandicoot-staging-7f4788b6df-hvqgn   1/1       Running   0          11m

$ kubectl get pods --selector="app in (alpaca,bandicoot)"
NAME                                 READY     STATUS    RESTARTS   AGE
alpaca-prod-65587bf567-bcmvg         1/1       Running   0          26m
alpaca-prod-65587bf567-nrx65         1/1       Running   0          26m
alpaca-test-6658d779cc-sb9bt         1/1       Running   0          22m
bandicoot-prod-7bddc557cc-92l59      1/1       Running   0          20m
bandicoot-prod-7bddc557cc-ljpvh      1/1       Running   0          20m
bandicoot-staging-7f4788b6df-hvqgn   1/1       Running   0          20m

$ kubectl get deploy --selector="canary"
NAME          DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
alpaca-test   1         1         1            1           25m

$ kubectl delete deploy --all
```
