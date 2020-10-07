{{- define "3scale-amp-chart.backendRedisEnvironment" -}}
- name: CONFIG_REDIS_PROXY
  valueFrom:
    secretKeyRef:
      key: storageURL
      name: backend-redis
- name: CONFIG_REDIS_SENTINEL_HOSTS
  valueFrom:
    secretKeyRef:
      key: storageSentinelHosts
      name: backend-redis
- name: CONFIG_REDIS_SENTINEL_ROLE
  valueFrom:
    secretKeyRef:
      key: storageSentinelRole
      name: backend-redis
- name: CONFIG_QUEUES_MASTER_NAME
  valueFrom:
    secretKeyRef:
      key: queuesURL
      name: backend-redis
- name: CONFIG_QUEUES_SENTINEL_HOSTS
  valueFrom:
    secretKeyRef:
      key: queuesSentinelHosts
      name: backend-redis
- name: CONFIG_QUEUES_SENTINEL_ROLE
  valueFrom:
    secretKeyRef:
      key: queuesSentinelRole
      name: backend-redis
{{- end }}

{{- define "3scale-amp-chart.systemEnvironment" -}}
- name: AMP_RELEASE
  valueFrom:
    configMapKeyRef:
      key: AMP_RELEASE
      name: system-environment
- name: APICAST_REGISTRY_URL
  valueFrom:
    configMapKeyRef:
      key: APICAST_REGISTRY_URL
      name: system-environment
- name: FORCE_SSL
  valueFrom:
    configMapKeyRef:
      key: FORCE_SSL
      name: system-environment
- name: PROVIDER_PLAN
  valueFrom:
    configMapKeyRef:
      key: PROVIDER_PLAN
      name: system-environment
- name: RAILS_ENV
  valueFrom:
    configMapKeyRef:
      key: RAILS_ENV
      name: system-environment
- name: RAILS_LOG_LEVEL
  valueFrom:
    configMapKeyRef:
      key: RAILS_LOG_LEVEL
      name: system-environment
- name: RAILS_LOG_TO_STDOUT
  valueFrom:
    configMapKeyRef:
      key: RAILS_LOG_TO_STDOUT
      name: system-environment
- name: SSL_CERT_DIR
  valueFrom:
    configMapKeyRef:
      key: SSL_CERT_DIR
      name: system-environment
- name: THINKING_SPHINX_PORT
  valueFrom:
    configMapKeyRef:
      key: THINKING_SPHINX_PORT
      name: system-environment
- name: THREESCALE_SANDBOX_PROXY_OPENSSL_VERIFY_MODE
  valueFrom:
    configMapKeyRef:
      key: THREESCALE_SANDBOX_PROXY_OPENSSL_VERIFY_MODE
      name: system-environment
- name: THREESCALE_SUPERDOMAIN
  valueFrom:
    configMapKeyRef:
      key: THREESCALE_SUPERDOMAIN
      name: system-environment
- name: DATABASE_URL
  valueFrom:
    secretKeyRef:
      key: url
      name: system-database
- name: MASTER_ACCESS_TOKEN
  valueFrom:
    secretKeyRef:
      key: masterAccessToken
      name: system-seed
- name: MASTER_DOMAIN
  valueFrom:
    secretKeyRef:
      key: masterDomain
      name: system-seed
- name: MASTER_USER
  valueFrom:
    secretKeyRef:
      key: masterUsername
      name: system-seed
- name: MASTER_PASSWORD
  valueFrom:
    secretKeyRef:
      key: masterPassword
      name: system-seed
- name: ADMIN_ACCESS_TOKEN
  valueFrom:
    secretKeyRef:
      key: adminAccessToken
      name: system-seed
- name: USER_LOGIN
  valueFrom:
    secretKeyRef:
      key: adminUsername
      name: system-seed
- name: USER_PASSWORD
  valueFrom:
    secretKeyRef:
      key: adminPassword
      name: system-seed
- name: USER_EMAIL
  valueFrom:
    secretKeyRef:
      key: adminEmail
      name: system-seed
- name: TENANT_NAME
  valueFrom:
    secretKeyRef:
      key: tenantName
      name: system-seed
- name: THINKING_SPHINX_ADDRESS
  value: system-sphinx
- name: THINKING_SPHINX_CONFIGURATION_FILE
  value: /tmp/sphinx.conf
- name: EVENTS_SHARED_SECRET
  valueFrom:
    secretKeyRef:
      key: password
      name: system-events-hook
- name: RECAPTCHA_PUBLIC_KEY
  valueFrom:
    secretKeyRef:
      key: publicKey
      name: system-recaptcha
- name: RECAPTCHA_PRIVATE_KEY
  valueFrom:
    secretKeyRef:
      key: privateKey
      name: system-recaptcha
- name: SECRET_KEY_BASE
  valueFrom:
    secretKeyRef:
      key: secretKeyBase
      name: system-app
- name: MEMCACHE_SERVERS
  valueFrom:
    secretKeyRef:
      key: SERVERS
      name: system-memcache
- name: BACKEND_REDIS_URL
  valueFrom:
    secretKeyRef:
      key: storageURL
      name: backend-redis
- name: BACKEND_REDIS_SENTINEL_HOSTS
  valueFrom:
    secretKeyRef:
      key: storageSentinelHosts
      name: backend-redis
- name: BACKEND_REDIS_SENTINEL_ROLE
  valueFrom:
    secretKeyRef:
      key: storageSentinelRole
      name: backend-redis
- name: APICAST_BACKEND_ROOT_ENDPOINT
  valueFrom:
    secretKeyRef:
      key: route_endpoint
      name: backend-listener
- name: BACKEND_ROUTE
  valueFrom:
    secretKeyRef:
      key: route_endpoint
      name: backend-listener
- name: SMTP_ADDRESS
  valueFrom:
    secretKeyRef:
      key: address
      name: system-smtp
- name: SMTP_USER_NAME
  valueFrom:
    secretKeyRef:
      key: username
      name: system-smtp
- name: SMTP_PASSWORD
  valueFrom:
    secretKeyRef:
      key: password
      name: system-smtp
- name: SMTP_DOMAIN
  valueFrom:
    secretKeyRef:
      key: domain
      name: system-smtp
- name: SMTP_PORT
  valueFrom:
    secretKeyRef:
      key: port
      name: system-smtp
- name: SMTP_AUTHENTICATION
  valueFrom:
    secretKeyRef:
      key: authentication
      name: system-smtp
- name: SMTP_OPENSSL_VERIFY_MODE
  valueFrom:
    secretKeyRef:
      key: openssl.verify.mode
      name: system-smtp
- name: APICAST_ACCESS_TOKEN
  valueFrom:
    secretKeyRef:
      key: accessToken
      name: system-master-apicast
- name: ZYNC_AUTHENTICATION_TOKEN
  valueFrom:
    secretKeyRef:
      key: authenticationToken
      name: zync
- name: CONFIG_INTERNAL_API_USER
  valueFrom:
    secretKeyRef:
      key: username
      name: backend-internal-api
- name: CONFIG_INTERNAL_API_PASSWORD
  valueFrom:
    secretKeyRef:
      key: password
      name: backend-internal-api
{{- end }}

{{- define "3scale-amp-chart.systemRedisEnvironment" -}}
- name: REDIS_URL
  valueFrom:
    secretKeyRef:
      key: url
      name: system-redis
- name: MESSAGE_BUS_REDIS_URL
  valueFrom:
    secretKeyRef:
      key: messageBusURL
      name: system-redis
- name: REDIS_NAMESPACE
  valueFrom:
    secretKeyRef:
      key: namespace
      name: system-redis
- name: MESSAGE_BUS_REDIS_NAMESPACE
  valueFrom:
    secretKeyRef:
      key: messageBusNamespace
      name: system-redis
- name: REDIS_SENTINEL_HOSTS
  valueFrom:
    secretKeyRef:
      key: sentinelHosts
      name: system-redis
- name: REDIS_SENTINEL_ROLE
  valueFrom:
    secretKeyRef:
      key: sentinelRole
      name: system-redis
- name: MESSAGE_BUS_REDIS_SENTINEL_HOSTS
  valueFrom:
    secretKeyRef:
      key: messageBusSentinelHosts
      name: system-redis
- name: MESSAGE_BUS_REDIS_SENTINEL_ROLE
  valueFrom:
    secretKeyRef:
      key: messageBusSentinelRole
      name: system-redis
{{- end }}