```bash
kubectl run -i oneshot \
--image=gcr.io/kuar-demo/kuard-amd64:1 \
--restart=OnFailure \
-- --keygen-enable \
   --keygen-exit-on-complete \
   --keygen-num-to-gen 10

If you don't see a command prompt, try pressing enter.
2018/04/12 19:59:11 (ID 0 1/10) Item done: SHA256:sflvBTBMFX0jfeikXiY8t/fQSzIYCzADxJSXWKGx9rQ
2018/04/12 19:59:13 (ID 0 2/10) Item done: SHA256:3+I7I+lgMFk/Br7MpGZQsmSQlZqdtJs3axKRQZh3qRc
2018/04/12 19:59:14 (ID 0 3/10) Item done: SHA256:KYRRLn44tbeXYzVPvXjatX+aYP/6aJ+Fg9Ax+/jezho
2018/04/12 19:59:22 (ID 0 4/10) Item done: SHA256:H+iGXs9rtzVKw788r2cOH3V9jmFRzMkiMrnHdoNsnXw
2018/04/12 19:59:25 (ID 0 5/10) Item done: SHA256:kvrU3GIg0jECV327PWlTXG/bo0KESGQWhgwlJ6UjZyM
2018/04/12 19:59:28 (ID 0 6/10) Item done: SHA256:NxVs8HEG8xcd7RKuIDEnzJn+n1XxBujAcZselX6qpiQ
2018/04/12 19:59:33 (ID 0 7/10) Item done: SHA256:48aGFs9FN8OIELdMmIy0npeGmJP/J0wSaM6Hq8GPyPA
2018/04/12 19:59:35 (ID 0 8/10) Item done: SHA256:RyyJQFq04Cpo2d+JObJaCKfBN4OIUSBMOsDEzbFstTU
2018/04/12 19:59:39 (ID 0 9/10) Item done: SHA256:BwgHbTG514OOgHQdrNTjPPPYvbgU1Hcc29slc5vimEQ
2018/04/12 19:59:46 (ID 0 10/10) Item done: SHA256:nQLQY2XkbGMOosjWLLJeN87XKFep13bch9kSjqa8peQ
2018/04/12 19:59:46 (ID 0) Workload exiting

$ kubectl get pods
NAME            READY     STATUS      RESTARTS   AGE
oneshot-np6f4   0/1       Completed   0          12h

$ kubectl delete jobs oneshot
job.batch "oneshot" deleted
$ kubectl get pods
No resources found.
```

```
$ kubectl apply -f job-oneshot.yaml
job.batch "oneshot" created
$ kubectl describe jobs oneshot
Name:           oneshot
Namespace:      default
Selector:       controller-uid=3f1190ea-3ef6-11e8-abf6-08002737f846
Labels:         chapter=jobs
Annotations:    kubectl.kubernetes.io/last-applied-configuration={"apiVersion":"batch/v1","kind":"Job","metadata":{"annotations":{},"labels":{"chapter":"jobs"},"name":"oneshot","namespace":"default"},"spec":{"templat...
Parallelism:    1
Completions:    1
Start Time:     Fri, 13 Apr 2018 17:39:57 +0900
Pods Statuses:  1 Running / 0 Succeeded / 0 Failed
Pod Template:
  Labels:  chapter=jobs
           controller-uid=3f1190ea-3ef6-11e8-abf6-08002737f846
           job-name=oneshot
  Containers:
   kuard:
    Image:      gcr.io/kuar-demo/kuard-amd64:1
    Port:       <none>
    Host Port:  <none>
    Args:
      --keygen-enable
      --keygen-exit-on-complete
      --keygen-num-to-gen=10
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Events:
  Type    Reason            Age   From            Message
  ----    ------            ----  ----            -------
  Normal  SuccessfulCreate  14s   job-controller  Created pod: oneshot-8gh7q

$ kubectl logs oneshot-8gh7q
2018/04/13 08:40:09 Starting kuard version: v0.7.2-1
2018/04/13 08:40:09 **********************************************************************
2018/04/13 08:40:09 * WARNING: This server may expose sensitive
2018/04/13 08:40:09 * and secret information. Be careful.
2018/04/13 08:40:09 **********************************************************************
2018/04/13 08:40:09 Config:
{
  "address": ":8080",
  "debug": false,
  "debug-sitedata-dir": "./sitedata",
  "keygen": {
    "enable": true,
    "exit-code": 0,
    "exit-on-complete": true,
    "memq-queue": "",
    "memq-server": "",
    "num-to-gen": 10,
    "time-to-run": 0
  },
  "liveness": {
    "fail-next": 0
  },
  "readiness": {
    "fail-next": 0
  },
  "tls-address": ":8443",
  "tls-dir": "/tls"
}
2018/04/13 08:40:09 Could not find certificates to serve TLS
2018/04/13 08:40:09 Serving on HTTP on :8080
2018/04/13 08:40:09 (ID 0) Workload starting
2018/04/13 08:40:15 (ID 0 1/10) Item done: SHA256:lynsILEWiZte7/eVwBdyy2NmPRr61cvNd3yJYmfEezE
2018/04/13 08:40:18 (ID 0 2/10) Item done: SHA256:6wPcxkWcXxbSy5pr4UzoYyHWOtF+XacnuEAffHzrSM0
2018/04/13 08:40:21 (ID 0 3/10) Item done: SHA256:AzeU6ybIlbjd8C73qYt80mNHFRjr9VyQLmM7imxSiqY
2018/04/13 08:40:25 (ID 0 4/10) Item done: SHA256:jaSqnEDuUp2q26HIg0bcaI04i56QoDhVXh9JBbT6cVU
2018/04/13 08:40:27 (ID 0 5/10) Item done: SHA256:mm/W+VVzan29PK4bRUoibNCPfHeKl50BR6l4SVUxecU
2018/04/13 08:40:28 (ID 0 6/10) Item done: SHA256:bqRqzZAiYQDD/z9B3so9VYKyvUg/y4o40yazSVikGb8
2018/04/13 08:40:29 (ID 0 7/10) Item done: SHA256:Veqa8uxyH1i894v+kodtekfp7kevWdJBwU8duooYsc0
2018/04/13 08:40:30 (ID 0 8/10) Item done: SHA256:wD6xJwNx8Xi4CdGnWGSv3OBt1b/LLREbGNqVqm2H7Ns
2018/04/13 08:40:35 (ID 0 9/10) Item done: SHA256:Z3t0hsD1vk3ADII5gynGfJpHPNpNb70avmnIefQvUaQ
2018/04/13 08:40:36 (ID 0 10/10) Item done: SHA256:c+uq6Z1bIzlfGb5JSIfsh9FrM2+Z2UsecxMe8E3Dp3Y
2018/04/13 08:40:36 (ID 0) Workload exiting
```

```
$ kubectl apply -f job-oneshot-failure.yaml
job.batch "oneshot" created
$ kubectl get pods -a -l job-name=oneshot
Flag --show-all has been deprecated, will be removed in an upcoming release
NAME            READY     STATUS             RESTARTS   AGE
oneshot-zghn8   0/1       CrashLoopBackOff   3          2m
```

```
```
