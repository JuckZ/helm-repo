#!/bin/bash

image_list="
  airdock/oraclejdk:1.8
  alpine:3.14
  antidebug/csi-attacher:v3.3.0
  antidebug/csi-provisioner:v3.0.0
  antidebug/csi-resizer:v1.3.0
  antidebug/csi-snapshotter:v4.2.0
  csiplugin/snapshot-controller:v3.0.3
  docker:19.03
  istio/pilot:1.6.10
  istio/proxyv2:1.6.10
  jaegertracing/jaeger-agent:1.17
  jaegertracing/jaeger-collector:1.17
  jaegertracing/jaeger-es-index-cleaner:1.17
  jaegertracing/jaeger-operator:1.17.1
  jaegertracing/jaeger-query:1.17
  jenkins/jnlp-slave:3.27-1
  jimmidyson/configmap-reload:v0.3.0
  kubesphere/builder-base:v3.1.0
  kubesphere/builder-maven:v3.1.0
  kubesphere/elasticsearch-curator:v5.7.6
  kubesphere/elasticsearch-oss:6.7.0-1
  kubesphere/fluent-bit:v1.6.9
  kubesphere/fluentbit-operator:v0.5.0
  kubesphere/java-8-centos7:v2.1.0
  kubesphere/java-8-runtime:v2.1.0
  kubesphere/kiali-operator:v1.26.1
  kubesphere/kiali:v1.26.1
  kubesphere/ks-apiserver:v3.1.1
  kubesphere/ks-console:v3.1.1
  kubesphere/ks-controller-manager:v3.1.1
  kubesphere/ks-installer:v3.1.1
  kubesphere/ks-jenkins:2.249.1
  kubesphere/kube-rbac-proxy:v0.8.0
  kubesphere/kube-state-metrics:v1.9.7
  kubesphere/kubectl:v1.20.0
  kubesphere/log-sidecar-injector:1.1
  kubesphere/notification-manager-operator:v1.0.04 
  kubesphere/notification-manager:v1.0.0
  kubesphere/prometheus-config-reloader:v0.42.1
  kubesphere/prometheus-operator:v0.42.1
  kubesphere/s2ioperator:v3.1.0
  kubesphere/s2irun:v2.1.1
  longhornio/csi-node-driver-registrar:v2.3.0
  minio/mc:RELEASE.2019-08-07T23-14-43Z
  minio/minio:RELEASE.2019-08-07T01-59-21Z
  mirrorgooglecontainers/defaultbackend-amd64:1.4
  nginx:1.15.0
  osixia/openldap:1.3.0
  prom/alertmanager:v0.21.0
  prom/node-exporter:v0.18.1
  prom/prometheus:v2.26.0
  quay.io/ceph/ceph:v16.2.6
  quay.io/cephcsi/cephcsi:v3.4.0
  quay.io/coreos/flannel:v0.15.0
  quay.io/jetstack/cert-manager-cainjector:v1.6.0
  quay.io/jetstack/cert-manager-controller:v1.6.0
  quay.io/jetstack/cert-manager-webhook:v1.6.0
  quay.io/metallb/controller:v0.11.0
  quay.io/metallb/speaker:v0.11.0
  rancher/mirrored-flannelcni-flannel-cni-plugin:v1.2
  registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:v1.8.0
  registry.cn-hangzhou.aliyuncs.com/google_containers/etcd:3.4.13-0
  registry.cn-hangzhou.aliyuncs.com/google_containers/kube-apiserver:v1.21.6
  registry.cn-hangzhou.aliyuncs.com/google_containers/kube-controller-manager:v1.21.6
  registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy:v1.21.6
  registry.cn-hangzhou.aliyuncs.com/google_containers/kube-scheduler:v1.21.6
  registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.4.1
  registry.cn-shenzhen.aliyuncs.com/zodance/builder-nodejs:latest
  rook/ceph:v1.7.7
  siriuszg/nginx-ingress-controller:v1.0.4
  thanosio/thanos:v0.18.0
  wangshun1024/kube-webhook-certgen:v1.1.1
"

echo "$image_list" | xargs -I{} -n 1 -P 10 docker pull {}

# k8s.gcr.io/sig-storage/csi-attacher:v3.3.0
# k8s.gcr.io/sig-storage/csi-node-driver-registrar:v2.3.0
# k8s.gcr.io/sig-storage/csi-provisioner:v3.0.0
# k8s.gcr.io/sig-storage/csi-resizer:v1.3.0
# k8s.gcr.io/sig-storage/csi-snapshotter:v4.2.0

docker tag antidebug/csi-attacher:v3.3.0 k8s.gcr.io/sig-storage/csi-attacher:v3.3.0
docker tag antidebug/csi-provisioner:v3.0.0 k8s.gcr.io/sig-storage/csi-provisioner:v3.0.0
docker tag antidebug/csi-resizer:v1.3.0 k8s.gcr.io/sig-storage/csi-resizer:v1.3.0
docker tag antidebug/csi-snapshotter:v4.2.0 k8s.gcr.io/sig-storage/csi-snapshotter:v4.2.0
docker tag longhornio/csi-node-driver-registrar:v2.3.0 k8s.gcr.io/sig-storage/csi-node-driver-registrar:v2.3.0
