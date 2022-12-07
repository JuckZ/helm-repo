

helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=rancher.ihave.cool \
  --set replicas=1
