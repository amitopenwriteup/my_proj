dm reset
	iptables -F && iptables -t nat -F && iptables -t mangle -F && iptables -X
	systemctl disable firewalld
	systemctl stop firewalld
	swapoff -a
	kubeadm init --pod-network-cidr 10.244.0.0/16
	mkdir -p $HOME/.kube
	sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
		sudo chown $(id -u):$(id -g) $HOME/.kube/config
		cp /etc/kubernetes/admin.conf /root/.kube/config
kubectl apply -f https://github.com/coreos/flannel/raw/master/Documentation/kube-flannel.yml

