# Signalen frontend Helm chart

This Helm chart contains the Signalen web frontend + the new WCAG Frontend .

## Configuration

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `image.repository` | The repository of the Docker image | `signalen/frontend` |
| `image.tag` | The tag of the Docker image | `latest` |
| `image.serviceName` | The name of the service | `signalen-frontend` |
| `frontend-wcag.enabled` | To toggle the wcag frontend | `true` |
| `frontend-wcag.image.tag` | The tag of the Docker image for the wcag frontend | `0.1.0` |
| `frontend-wcag.image.repository` | The repository of the Docker image for the wcag frontend | `ghcr.io/delta10/signalen-frontend-wcag` |
| `frontend-wcag.image.port` | The port for the wcag frontend | `3000` |
| `frontend-wcag.image.serviceName` | The name of the service | `signalen-frontend-wcag` |
| `replicaCount` | The number of API replicas | `1` |
| `config` | The configuration of the signalen frontend. For all options see [app.json](https://github.com/Signalen/frontend/blob/develop/app.base.json) | `{}` |
| `configWcag` | The configuration of the signalen wcag frontend. For all options see [app.json](https://github.com/delta10/signalen-frontend-wcag/blob/main/config.json) | `{}` |
| `theme` | The css styling for the wcag frontend. For options see [theme.css](https://github.com/delta10/signalen-frontend-wcag/blob/main/public/assets/theme.css) | `` | 
| `ingress.enabled` | Expose the API through an ingress | `true` |
| `ingress.annotations` | Additional annotations on the API ingress | `{}` |
| `ingress.hosts` | The hosts of the ingress | `{}` |
| `ingress.tls` | The TLS settings of the ingress | `{}` |
| `extraVolumes` | Ability to add exta volumes | `[]` |
| `extraVolumeMounts` | Ability to add exta volume mounts | `[]` |
| `initContainers` | Ability to add initContainers | `[]` |
| `command` | Override default startup command of the main container | |
| `arguments` | Override default startup arguments of the main container | |

Check [values.yaml](./values.yaml) for all the possible configuration options.
