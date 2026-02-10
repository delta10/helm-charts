# Signalen Helm Chart

A Helm chart for deploying Signalen - a platform that helps cities manage and prioritize nuisance reports.

## Install dependent services

```bash
helm upgrade --install postgresql oci://registry-1.docker.io/bitnamicharts/postgresql \
  --set auth.username=signalen \
  --set auth.password=signalen \
  --set auth.database=signalen \
  --set image.repository=postgis/postgis \
  --set image.tag=15-3.4 \
  --set primary.initdb.scripts."00-postgis\.sql"="\\c signalen; CREATE EXTENSION IF NOT EXISTS postgis;"

helm upgrade --install rabbitmq oci://registry-1.docker.io/bitnamicharts/rabbitmq \
  --set auth.username=signalen \
  --set auth.password=signalen \
  --set global.security.allowInsecureImages=true \
  --set image.repository=bitnamilegacy/rabbitmq

helm upgrade --install elasticsearch oci://registry-1.docker.io/bitnamicharts/elasticsearch \
  --version 21.6.3 \
  --set master.replicaCount=1 \
  --set data.replicaCount=0 \
  --set coordinating.replicaCount=0 \
  --set ingest.replicaCount=0 \
  --set security.enabled=false \
  --set global.security.allowInsecureImages=true \
  --set image.repository=bitnamilegacy/elasticsearch \
  --set sysctlImage.repository=bitnamilegacy/os-shell
```

## Install Signalen Chart

```bash
helm upgrade --install signalen .
```
