# Valtimo console chart

The Helm chart installs Valtimo console.

## Installation

First configure the Helm repository:

```bash
helm repo add delta10 https://delta10.github.io/helm-charts/
helm repo update
```

Install the Helm chart with:

```bash
helm install valtimo-console delta10/valtimo-console
```

:warning: The default settings are unsafe for production usage. Configure proper secrets, enable persistency and consider High Availability (HA) for the database and the application.

## Configuration

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `image.repository` | The repository of the Docker image | `ritense/valtimo-console` |
| `image.tag` | The tag of the Docker image | `""` |
| `replicaCount` | The number of replicas | `1` |
| `ingress.enabled` | Expose the application through an ingress | `false` |
| `ingress.annotations` | Additional annotations on the API ingress | `{}` |
| `ingress.hosts` | Ingress hosts | `"{valtimo.gemeente.nl}"` |
| `ingress.tls` | Ingress TLS settings | `[]` |
| `config` | The Valtimo console configuration | `{}` |

Check [values.yaml](./values.yaml) for all the possible configuration options.
