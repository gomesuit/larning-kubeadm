#/bin/bash -ex

vagrant ssh master -c "$(cat init-kubeadm.sh)"
token=$(vagrant ssh master -c 'sudo kubeadm token list' 2> /dev/null | grep default | awk '{print $1}')
vagrant ssh node1 -c "sudo kubeadm join 192.168.33.10:6443 --token $token --discovery-token-unsafe-skip-ca-verification"
vagrant ssh node2 -c "sudo kubeadm join 192.168.33.10:6443 --token $token --discovery-token-unsafe-skip-ca-verification"
