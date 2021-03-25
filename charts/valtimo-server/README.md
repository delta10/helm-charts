# Valtimo server chart

The Helm chart installs Open Notificaties and by default the following dependencies using subcharts:

- [MySQL](https://github.com/bitnami/charts/tree/master/bitnami/mysql)

## Installation

First configure the Helm repository:

```bash
helm repo add delta10 https://delta10.github.io/helm-charts/
helm repo update
```

Install the Helm chart with:

```bash
helm install valtimo-server delta10/valtimo-server
```

:warning: The default settings are unsafe for production usage. Configure proper secrets, enable persistency and consider High Availability (HA) for the database and the application.

## Configuration

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `tags.mysql` | Install MySQL subchart | `true` |
| `image.repository` | The repository of the Docker image | `ritense/valtimo-server` |
| `image.tag` | The tag of the Docker image | `""` |
| `replicaCount` | The number of replicas | `1` |
| `ingress.enabled` | Expose the application through an ingress | `false` |
| `ingress.annotations` | Additional annotations on the API ingress | `{}` |
| `ingress.hosts` | Ingress hosts | `"{valtimo.gemeente.nl}"` |
| `ingress.tls` | Ingress TLS settings | `"[]"` |

Check [values.yaml](./values.yaml) for all the possible configuration options.
