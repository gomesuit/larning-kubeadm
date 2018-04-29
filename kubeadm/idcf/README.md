
ansible
```
vim hosts.ini
ansible all --private-key <key> -u <user> -m ping
ansible-playbook --private-key <key> -u <user> playbook.yml
```


master
```
# https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/

kubeadm init --skip-preflight-checks --pod-network-cidr 10.244.0.0/16

mkdir -p $HOME/.kube
cp /etc/kubernetes/admin.conf $HOME/.kube/config

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/v0.9.1/Documentation/kube-flannel.yml
```

node
join command

