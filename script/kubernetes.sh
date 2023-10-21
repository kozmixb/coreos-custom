#!/bin/sh

# Run on master node
sudo rpm-ostree install kubelet kubeadm kubectl cri-o
sudo systemctl reboot
sudo systemctl enable --now crio kubelet

# Run this on slaves
# sudo rpm-ostree install kubelet kubeadm cri-o


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


kubectl apply -f \
https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml
