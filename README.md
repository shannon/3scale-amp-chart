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
helm install amp . --namespace amp --set wildcardDomain=example.com --create-namespace
```

Output:

```
NAME: amp
LAST DEPLOYED: Wed Oct 14 08:54:15 2020
NAMESPACE: amp
STATUS: deployed
REVISION: 1
NOTES:
Please wait a few minutes for all the components to start and the appropriate ingresses to be created.
Once running, you can vist the admin portal at https://3scale-admin.example.com.
Use the credentials below to login.
username: admin
password: GkzkE6jo
```