- Software-Design-2018年3月
- https://github.com/kubernetes-incubator/kubespray

```
pyenv install 3.6.5
pip install ansible
pip install netaddr
```

```
git clone https://github.com/kubernetes-incubator/kubespray

cd kubespray
git checkout v2.5.0

# kubeconfig_localhost: true
vim inventory/group_vars/k8s-cluster.yml

# flannel_interface: eth1
vim roles/network_plugin/flannel/defaults/main.yml

vagrant up
```
