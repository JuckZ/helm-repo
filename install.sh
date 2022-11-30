# ingress-nginx 安装

helm upgrade --install \
  ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx \
  --create-namespace \
  --values=my-values.yaml

# ingress-nginx 以目录的方式安装
helm install ingress-nginx -n ingress-nginx --create-namespace -f ./ingress-nginx/my-values.yaml ./ingress-nginx

# cert-manager 安装（方式1）

helm upgrade --install \
  cert-manager cert-manager \
  --repo https://charts.jetstack.io \
  --namespace cert-manager \
  --create-namespace \
  --version v1.6.1 \
  --set installCRDs=true
  # --set prometheus.enabled=false \  # Example: disabling prometheus using a Helm parameter
  # --set webhook.timeoutSeconds=4   # Example: changing the wehbook timeout using a Helm parameter

# cert-manager 以目录的方式安装
helm install cert-manager -n cert-manager --create-namespace --set installCRDs=true ./cert-manager

# cert-manager 安装（方式3）
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.6.1 \
  --set installCRDs=true
  # --set prometheus.enabled=false \  # Example: disabling prometheus using a Helm parameter
  # --set webhook.timeoutSeconds=4   # Example: changing the wehbook timeout using a Helm parameter

# clash 安装

# 

# =========================
# ingress-nginx卸载
helm uninstall -n ingress-nginx ingress-nginx
