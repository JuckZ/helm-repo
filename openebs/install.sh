helm uninstall openebs -n openebs

helm install openebs -n openebs --create-namespace --set cstor.enabled=true --debug .


k8s.gcr.io/sig-storage/csi-node-driver-registrar:v2.3.0
k8s.gcr.io/sig-storage/csi-node-driver-registrar
