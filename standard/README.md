# larning-kubeadm

## getting-started ```sh
git submodule update --init
vagrant up
./create-cluster.sh
```

## get config

```sh
vagrant ssh master -c 'sudo cat /etc/kubernetes/admin.conf' 2> /dev/null > ~/.kube/config
```

- メモ
  - https://kubernetes.io/docs/admin/authorization/
  - https://ishiis.net/2017/01/21/kubernetes-authentication-authorization/
  - https://qiita.com/hiyosi/items/43465d4fc501c2044d01#static-password-file
  - https://kubernetes.io/docs/admin/authentication/#authentication-strategies
  - https://github.com/kubernetes-up-and-running/kuard
  - https://github.com/kubernetes-up-and-running/examples
