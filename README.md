# 3scale-amp-chart

This is a community project to bring 3scale API Management to a non OpenShift environment, Kubernetes.

## Project status

This project is in the very early stages.

### Working Components

- [x] backend-redis
- [x] backend-listener
- [x] backend-worker
- [x] backend-cron
- [x] system-redis
- [x] system-mysql
- [x] system-memcache
- [x] system-app
- [x] system-sidekiq
- [x] system-sphinx
- [x] apicast-staging
- [x] apicast-production
- [x] zync-database
- [x] zync*
- [x] zync-que*

\* Zync is using a patched image to add support for automatic Kubernetes route creation. See 3scale/zync#394.

## Installing the chart

```
git clone https://github.com/shannon/3scale-amp-chart
cd 3scale-amp-chart
helm install amp . --namespace amp --set wildcardDomain=example.com
```

Output:

```
NAME: amp
LAST DEPLOYED: Mon Oct  5 15:12:18 2020
NAMESPACE: amp
STATUS: deployed
REVISION: 1
NOTES:
```