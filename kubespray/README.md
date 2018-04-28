- Software-Design-2018年3月
- https://github.com/kubernetes-incubator/kubespray

```
pyenv install 3.6.5
pip install ansible
pip install netaddr
```

```
wget https://github.com/kubernetes-incubator/kubespray/archive/v2.5.0.zip
unzip v2.5.0.zip

cd kubespray
cp -rfp inventory/sample inventory/mycluster

# kubeconfig_localhost: true
vim inventory/mycluster/group_vars/k8s-cluster.yml

# flannel_interface: eth1
vim roles/network_plugin/flannel/defaults/main.yml

vagrant up
```
