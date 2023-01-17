kubectl create deployment pingtest --image=busybox --replicas=3 -- sleep infinity
kubectl get pods --selector=app=pingtest --output=wide
kubectl exec -ti pingtest-b4b6f8cf-b5z78 -- sh
ip route get 192.168.38.128
