# 3scale-amp-chart

This is a community project to bring 3scale API Management to a non OpenShift environment, Kubernetes.

## Project status

This project is in the very early stages and missing most of the components.

### Working Components

- [x] backend-redis
- [ ] backend-listener
- [ ] backend-worker
- [ ] backend-cron
- [x] system-redis
- [ ] system-mysql
- [ ] system-memcache
- [ ] system-app
- [ ] system-sidekiq
- [ ] system-sphinx
- [ ] apicast-staging
- [ ] apicast-production
- [ ] zync-database
- [ ] zync
- [ ] zync-que

## Installing the chart

For the time being the container images are coming from registry.redhat.io which requires a login. Please see [Registry Authentication](https://access.redhat.com/RegistryAuthentication) for details on creating a service account.

### Create the registry secret
```
kubectl create secret docker-registry threescale-registry-auth --namespace amp \
--docker-server=registry.redhat.io \
--docker-username=<username> \
--docker-password=<service_account_token>
```

### Clone the repo and install the chart
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