cd ~/k3s
chmod +x ./install.sh
chmod +x ./k3s
sudo mkdir -p /var/lib/rancher/k3s/agent/images/
# gzip -d file.gz
sudo \cp -f ./k3s-airgap-images-amd64.tar /var/lib/rancher/k3s/agent/images/
sudo \cp -f k3s /usr/local/bin/k3s

# <Tailscale网卡对应的IP>
TAILSCALE_IP=${NODE1_TAILSCALE_IP}
# <API Server额外的监听地址>
EXPOSE_IP=${NODE1_EXPOSE_IP}

# K3S_URL : API Server 的 URL，一般格式为：https://<master_ip>:6443。其中 <master_ip> 是控制节点的公网 IP。
# K3S_TOKEN : 加入集群所需的 token，可以在控制节点上查看 /var/lib/rancher/k3s/server/node-token
K3S_URL=${MY_K3S_URL}  K3S_TOKEN=${MY_K3S_TOKEN} INSTALL_K3S_SKIP_DOWNLOAD=true INSTALL_K3S_EXEC="agent --node-ip $TAILSCALE_IP --node-external-ip $TAILSCALE_IP --flannel-iface tailscale0 --kube-proxy-arg proxy-mode=ipvs masquerade-all=true metrics-bind-address=0.0.0.0" ./install.sh

# ==========================
# ======= racknerd =========
# ==========================

cd ~/k3s
chmod +x ./install.sh
chmod +x ./k3s
sudo mkdir -p /var/lib/rancher/k3s/agent/images/
# gzip -d file.gz
sudo \cp -f ./k3s-airgap-images-amd64.tar /var/lib/rancher/k3s/agent/images/
sudo \cp -f k3s /usr/local/bin/k3s

TAILSCALE_IP=${NODE2_TAILSCALE_IP}
EXPOSE_IP=${NODE2_EXPOSE_IP}
K3S_URL=${MY_K3S_URL}  K3S_TOKEN=${MY_K3S_TOKEN} INSTALL_K3S_SKIP_DOWNLOAD=true INSTALL_K3S_EXEC="agent --node-ip $TAILSCALE_IP --node-external-ip $TAILSCALE_IP --flannel-iface tailscale0 --kube-proxy-arg proxy-mode=ipvs masquerade-all=true metrics-bind-address=0.0.0.0" ./install.sh
