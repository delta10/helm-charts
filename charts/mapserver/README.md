# Mapserver Helm chart

This Helm charts installs a Mapserver based on the [PDOK Mapserver Docker image](https://github.com/PDOK/mapserver-docker).

## Configuration

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `image.repository` | The repository of the Docker image | `pdok/mapserver` |
| `image.tag` | Override the tag of the Docker image | `""` |
| `replicaCount` | The number of API replicas | `1` |
| `extraVolumes` | Ability to add exta volumes | `[]` |
| `extraVolumeMounts` | Ability to add exta volume mounts | `[]` |
| `envFrom` | Additional environment variables mounted from [secrets](https://kubernetes.io/docs/concepts/configuration/secret/#using-secrets-as-environment-variables) or [config maps](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#configure-all-key-value-pairs-in-a-configmap-as-container-environment-variables). | `[]` |
| `env` | Additional environment variables passed directly to containers. | `{}` |
| `envVars` | Similar to env but with support for all possible configurations. | `[]` |
| `config` | Configuration that is mounted as ConfigMap into /config with a filename as key and contents as value | `{}` |
| `ingress.enabled` | Expose the API through an ingress | `true` |
| `ingress.annotations` | Additional annotations on the API ingress | `{}` |
| `ingress.hosts` | The hosts of the ingress | `{}` |
| `ingress.tls` | The TLS settings of the ingress | `{}` |

Check [values.yaml](./values.yaml) for all the possible configuration options.
