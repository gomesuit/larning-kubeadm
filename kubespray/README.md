- Software-Design-2018年3月
- https://github.com/kubernetes-incubator/kubespray


```
git clone https://github.com/kubernetes-incubator/kubespray

cd kubespray

# kubeconfig_localhost: true
vim inventory/group_vars/k8s-cluster.yml

# flannel_interface: eth1
vim roles/network_plugin/flannel/defaults/main.yml

vagrant up
```
