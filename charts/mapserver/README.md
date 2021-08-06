# Mapserver Helm chart

This Helm chart can be used to install [Mapserver](https://www.mapserver.org/).

## Configuration

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `image.repository` | The repository of the Docker image | `pdok/mapserver` |
| `image.tag` | The tag of the Docker image | `latest` |
| `replicaCount` | The number of replicas | `1` |
| `settings.mapFile` | The location of the mapFile | `/storage/main.map` |
| `persistence.enabled` | Enable persistence | `true` |
| `persistence.size` | Specify the size of the PVC | `1Gi` |
| `persistence.existingClaim` | Name of an existing PVC to use | `null` |
| `persistence.accessModes` | The accessModes of the PVC | `{ ReadWriteOnce }` |
| `ingress.enabled` | Expose through an ingress | `true` |
| `ingress.annotations` | Additional annotations on the ingress | `{}` |
| `ingress.hosts` | The hosts of the ingress | `{ mapserver.local }` |

Check [values.yaml](./values.yaml) for all the possible configuration options. For some example data see [./example-data](./example-data).
