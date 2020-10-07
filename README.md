# 3scale-amp-chart

This is a community project to bring 3scale API Management to a non OpenShift environment, Kubernetes.

## Project status

This project is in the very early stages and missing most of the components.

### Working Components

- [x] backend-redis
- [x] backend-listener
- [x] backend-worker
- [x] backend-cron
- [x] system-redis
- [x] system-mysql
- [x] system-memcache
- [x] system-app
- [ ] system-sidekiq
- [ ] system-sphinx
- [ ] apicast-staging
- [ ] apicast-production
- [ ] zync-database
- [ ] zync
- [ ] zync-que

## Installing the chart

```
git clone https://github.com/shannon/3scale-amp-chart
cd 3scale-amp-chart
helm install amp . --namespace amp
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