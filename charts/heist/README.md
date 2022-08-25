# heist

![Version: 0.1.37](https://img.shields.io/badge/Version-0.1.37-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.7.1](https://img.shields.io/badge/AppVersion-0.7.1-informational?style=flat-square)

Provisioning and generation of secrets in HashiCorp Vault using Kubernetes resources

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| youniqx | office@youniqx.com |  |

## Source Code

* <https://github.com/youniqx/helm-charts/tree/main/charts/heist>
* <https://github.com/youniqx/heist>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinities applied to the Heist operator deployment |
| certmanager.enabled | bool | `true` |  |
| fullnameOverride | string | `""` |  |
| heist.config.syncSecretNamespaceAllowList | list | `[]` | List of namespaces to which secrets can be synced from anywhere |
| heist.healthProbePort | int | `8081` | Port the health probes listen on (readiness & liveness) |
| heist.image.pullPolicy | string | `"IfNotPresent"` | Image Pull Policy for the Heist image |
| heist.image.repository | string | `"quay.io/youniqx/heist"` | Image repository for the Heist image |
| heist.image.tag | string | chart.appVersion | Tag of the Heist image to use |
| heist.metricsPort | int | `8080` | Port the metrics endpoint listens on |
| heist.resources.requests.cpu | string | `"100m"` | CPU requests for the Heist container |
| heist.resources.requests.memory | string | `"20Mi"` | Memory requests for the Heist container |
| heist.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| heist.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| heist.securityContext.runAsNonRoot | bool | `true` |  |
| imagePullSecrets | list | `[]` | List of image pull secrets used by the Heist operator pods |
| manager.enabled | bool | `true` |  |
| managerRoles.enabled | bool | `true` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | Node selector applied to the Heist operator deployment |
| podAnnotations | object | `{}` | Additional annotations added to Heist operator pods |
| podLabels | object | `{}` | Additional labels added to Heist operator pods |
| podSecurityContext | object | `{}` | Security Context set on the pod level for Heist operator pods |
| replicaCount | int | `1` | Number of Replicas of the Heist Operator |
| scope.global | bool | `true` |  |
| scope.watchedNamespaces | list | `[]` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. -- If not set and create is true, a name is generated using the fullname template |
| services.webhook.port | int | `443` | Port of the Webhook service |
| services.webhook.targetPort | int | `9443` | Port of the webhook endpoint on Heist pods |
| services.webhook.type | string | `"ClusterIP"` | Type of the Webhook service |
| tolerations | list | `[]` | Tolerations applied to the Heist operator deployment |
| userRoles.enabled | bool | `true` |  |
| vault.address | string | `"https://vault.example.com"` | Address of the Vault instance |
| vault.ca.key | string | `"ca.crt"` |  |
| vault.ca.secret | string | `""` |  |
| vault.role | string | `"heist"` | Role used to authenticate in Vault |
| webhooks.caBundle | string | `""` |  |
| webhooks.enabled | bool | `true` |  |

