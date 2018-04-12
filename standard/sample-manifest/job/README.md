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
```
