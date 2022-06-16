#!/bin/bash

#Steps to Install Kubernetes on Ubuntu Set up Docker

#Step 1: Install Docker
#Kubernetes requires an existing Docker installation. If you already have Docker installed, skip ahead to Step 2.

#If you do not have Kubernetes, install it by following these steps:

#1. Update the package list with the command:

 sudo apt-get update

#kubernetes_1.-Update-Ubuntu-dependencies
#2. Next, install Docker with the command:

#sudo apt-get install docker.io

#3. Repeat the process on each server that will act as a node.

#4. Check the installation (and version) by entering the following:

docker ––version

#Step 2: Start and Enable Docker
#1. Set Docker to launch at boot by entering the following:

sudo systemctl enable docker

#2. Verify Docker is running:

#sudo systemctl status docker

#To start Docker if it’s not running:

sudo systemctl start docker
####################################################################
#Install Kubernetes
#Add Kubernetes Signing Key
sudo apt-get install curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

#Step 4: Add Software Repositories
sudo apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"

#Step 5: Kubernetes Installation Tools
sudo apt-get install kubeadm kubelet kubectl -y
sudo apt-mark hold kubeadm kubelet kubectl 

#2. Verify the installation with:
kubeadm version

<< com
Kubernetes Deployment
Step 6: Begin Kubernetes Deployment
Start by disabling the swap memory on each server:

sudo swapoff –a

Step 7: Assign Unique Hostname for Each Server Node 
Decide which server to set as the master node. Then enter the command:

sudo hostnamectl set-hostname master-node

Next, set a worker node hostname by entering the following on the worker server:

sudo hostnamectl set-hostname worker01

If you have additional worker nodes, use this process to set a unique hostname on each.

Step 8: Initialize Kubernetes on Master Node
Switch to the master server node, and enter the following:

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

Once this command finishes, it will display a kubeadm join message at the end. Make a note of the whole entry. This will be used to join the worker nodes to the cluster.

Next, enter the following to create a directory for the cluster:

kubernetes-master:~$ mkdir -p $HOME/.kube

kubernetes-master:~$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

kubernetes-master:~$ sudo chown $(id -u):$(id -g) $HOME/.kube/config

Step 9: Deploy Pod Network to Cluster
A Pod Network is a way to allow communication between different nodes in the cluster. This tutorial uses the flannel virtual network.

Enter the following:

sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

Allow the process to complete.

Verify that everything is running and communicating:

kubectl get pods --all-namespaces

Step 10: Join Worker Node to Cluster
As indicated in Step 7, you can enter the kubeadm join command on each worker node to connect it to the cluster.

Switch to the worker01 system and enter the command you noted from Step 7:

kubeadm join --discovery-token abcdef.1234567890abcdef --discovery-token-ca-cert-hash sha256:1234..cdef 1.2.3.4:6443

Replace the alphanumeric codes with those from your master server. Repeat for each worker node on the cluster. Wait a few minutes; then you can check the status of the nodes.

Switch to the master server, and enter:

kubectl get nodes

The system should display the worker nodes that you joined to the cluster.

Conclusion

After following the steps mentioned in this article carefully, you should now have Kubernetes installed on Ubuntu.

For beginners who still have no experience of deploying multiple containers, Minikube is a great way to start. Minikube is a system for running a single node cluster locally and is excellent for learning the basics, before moving on to Kubernetes.

This network uses multiple servers to communicate back and forth. Kubernetes allows you to launch and manage Docker containers across multiple servers in the pod.

Was this article helpful?
YesNo
com