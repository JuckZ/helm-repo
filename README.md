# Helm chart repository - in main

## Reference 

[helm-release-demo](https://github.com/helm/charts-repo-actions-demo)
[chart-releaser-action](https://github.com/helm/chart-releaser-action)

I took [technosophos/tscharts](https://github.com/technosophos/tscharts) as reference 
to host the charts I developed via GitHub pages.

> :warning: If you need your own helm chart repo, **do not use this repository as an example**.
Use [this](https://github.com/helm/chart-releaser-action) instead.  
(I have to migrate this one some time)

## How to use the repository

Simply run:
```bash
$ helm repo add utkuozdemir https://utkuozdemir.org/helm-charts
```
and start browsing and installing them:
```bash
$ helm search repo utkuozdemir
NAME                             	CHART VERSION	APP VERSION	DESCRIPTION
utkuozdemir/transmission-exporter	0.1.0        	0.3.0      	Transmission Exporter
...
$ helm install transmission-exporter utkuozdemir/transmission-exporter --version 0.1.0
NAME: transmission-exporter
LAST DEPLOYED: Tue Apr 21 00:47:10 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
...
```

## How to add a chart

In the project root

1. Package the chart
```bash
$ helm package transmission-exporter
```

2. Put the packaged chart under `docs/`.
```bash
mv transmission-exporter-0.1.0.tgz docs
```

3. Re-index the charts in the `docs/` directory
```bash
$ helm repo index docs --url https://utkuozdemir.org/helm-charts
```

4. Add both files, commit, push:
```bash
$ git add --all
$ git commit -m "Release transmission-exporter v0.1.0"
$ git push
```


## TODO

1. **rook**
2. ceph-dashboard
3. ceph-toolbox
4. wordpress
5. rsshub
6. clash
7. trojan
8. wireguard
9. netmaker
10. notion-feeder
11. metallb
12. kubesphere
13. es-ik-pinyin
14. nacos
15. prometheus
16. rabbitmq
17. sentinel
18. zipkin
19. devops
20. istio
21. network(flannel、and so on)

## 基础设施

1. 系统、内核
2. 网络
3. 安装包
4. docker镜像
5. 镜像源

## TODO

1. 重新梳理结构
2. 提供多种选择方案（如网络插件的选择、存储方式的选择等）
