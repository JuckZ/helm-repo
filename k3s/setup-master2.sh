# Common
#MYSQL_HOST=rm-wz98ij1425986ryymro.mysql.rds.aliyuncs.com
MYSQL_HOST=175.178.124.12
#MYSQL_USER=zodance
MYSQL_USER=root
MYSQL_PASS=Zc1998zc@

ALIYUN_REGISTER_USER=187809992520
ALIYUN_REGISTER_PASS=zc1998zc


# K3S masternode

MASTER_TAILSCALE_IP=100.64.0.1
MASTER_EXPOSE_IP="175.178.124.12 k3s.ihave.cool"


# K3S - worknode
NODE1_TAILSCALE_IP=100.64.0.2
NODE1_EXPOSE_IP=121.43.169.117

MY_K3S_URL="https://175.178.124.12:6443"
# cat /var/lib/rancher/k3s/server/node-token
MY_K3S_TOKEN="K106e5d867e073580f6efce5a453f09866a008701b9b971f07bdbffb419d5db939b::server:f47713b42b0dfbba4a0322439fba080b"

NODE2_TAILSCALE_IP=100.64.0.3
NODE2_EXPOSE_IP=107.174.247.243

cd ~/k3s
chmod +x ./install.sh
chmod +x ./k3s
sudo mkdir -p /var/lib/rancher/k3s/agent/images/
# gzip -dk file.gz
sudo mkdir -p /etc/rancher/k3s/
#sudo \cp -f registries.yaml /etc/rancher/k3s/registries.yaml
sudo \cp -f ./k3s-airgap-images-amd64.tar /var/lib/rancher/k3s/agent/images/
sudo \cp -f k3s /usr/local/bin/k3s

# <Tailscale网卡对应的IP>
TAILSCALE_IP=${MASTER_TAILSCALE_IP}
# <API Server额外的监听地址>
EXPOSE_IP=${MASTER_EXPOSE_IP}
# 这里指定了POD CIDR和 Service CIDR，可以不配置，仅需要保证和内网网段不冲突且互相不冲突即可 --cluster-cidr 10.42.0.0/16 --service-cidr 10.43.0.0/16
#K3S_TOKEN=${MY_K3S_TOKEN} 
INSTALL_K3S_SKIP_DOWNLOAD=true INSTALL_K3S_EXEC="server --disable servicelb,traefik,local-storage --datastore-endpoint=mysql://${MYSQL_USER}:${MYSQL_PASS}@tcp(${MYSQL_HOST}:3306)/k3s_tx --node-ip $TAILSCALE_IP --advertise-address $TAILSCALE_IP --node-external-ip $TAILSCALE_IP --tls-san $EXPOSE_IP --flannel-iface tailscale0 --kubelet-arg kube-reserved=cpu=100m,memory=100Mi system-reserved=cpu=200m,memory=200Mi --kube-proxy-arg proxy-mode=ipvs masquerade-all=true metrics-bind-address=0.0.0.0" ./install.sh
echo "export KUBECONFIG=/etc/rancher/k3s/k3s.yaml" >> /etc/profile
source /etc/profile

