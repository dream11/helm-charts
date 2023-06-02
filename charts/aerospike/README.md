<!--- app-name: Aerospike -->

# Aerospike Helm Chart

Aerospike Database is a flash memory and in-memory open source distributed key value NoSQL database management system.

[Overview of Aerospike](https://aerospike.com/)

## Introduction

This chart bootstraps an [Aerospike](https://hub.docker.com/r/aerospike/aerospike-server-enterprise) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm repo add dream11 https://dream11.github.io/helm-charts
helm install my-release dream11/aerospike
```

These commands deploy one node with Aerospike on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` release:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Global parameters

| Name                      | Description                                     | Value |
| ------------------------- | ----------------------------------------------- | ----- |
| `global.imageRegistry`    | Global Docker image registry                    | `""`  |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`  |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`  |

### Common parameters

| Name                | Description                                                           | Value           |
| ------------------- | --------------------------------------------------------------------- | --------------- |
| `nameOverride`      | String to partially override common.names.fullname                    | `""`            |
| `fullnameOverride`  | String to fully override common.names.fullname                        | `""`            |
| `commonLabels`      | Labels to add to all deployed objects (sub-charts are not considered) | `{}`            |
| `commonAnnotations` | Annotations to add to all deployed objects                            | `{}`            |
| `clusterDomain`     | Kubernetes cluster domain name                                        | `cluster.local` |
| `extraDeploy`       | Array of extra objects to deploy with the release                     | `[]`            |

### Aerospike parameters

| Name                         | Description                                                      | Value          |
| ---------------------------- | ---------------------------------------------------------------- | -------------- |
| `image.registry`             | Aerospike image registry                                         | `docker.io`    |
| `image.repository`           | Aerospike image repository                                       | `aerospike`    |
| `image.tag`                  | Aerospike image tag (immutable tags are recommended)             | `ce-6.3.0.4`   |
| `image.pullPolicy`           | image pull policy                                                | `IfNotPresent` |
| `image.pullSecrets`          | Aerospike image pull secrets                                     | `[]`           |
| `aerospike.namespaces`       | Aerospike namespaces configuration                               | `[]`           |
| `aerospike.xdr.enabled`      | Enable aerospike cross datacenter replication                    | `false`        |
| `aerospike.xdr.dcs`          | Aerospike cross datacenter replication datacenters configuration | `[]`           |
| `aerospike.features.content` | Aerospike licence content                                        | `nil`          |
| `extraEnvVars`               | Extra environment variables to be set on aerospike container     | `[]`           |

### Statefulset parameters

| Name                                 | Description                                      | Value           |
| ------------------------------------ | ------------------------------------------------ | --------------- |
| `replicaCount`                       | Number of Aerospike replicas                     | `1`             |
| `nodeSelector`                       | Node labels for pod assignment                   | `{}`            |
| `updateStrategy.type`                | updateStrategy for Aerospike statefulset         | `RollingUpdate` |
| `podManagementPolicy`                | StatefulSet pod management policy                | `OrderedReady`  |
| `podAnnotations`                     | Additional pod annotations                       | `{}`            |
| `podLabels`                          | Additional pod labels                            | `{}`            |
| `resources.limits`                   | The resources limits for Aerospike containers    | `{}`            |
| `resources.requests`                 | The requested resources for Aerospike containers | `{}`            |
| `livenessProbe.enabled`              | Enable livenessProbe                             | `true`          |
| `livenessProbe.initialDelaySeconds`  | Initial delay seconds for livenessProbe          | `30`            |
| `livenessProbe.periodSeconds`        | Period seconds for livenessProbe                 | `30`            |
| `livenessProbe.timeoutSeconds`       | Timeout seconds for livenessProbe                | `5`             |
| `livenessProbe.failureThreshold`     | Failure threshold for livenessProbe              | `5`             |
| `livenessProbe.successThreshold`     | Success threshold for livenessProbe              | `1`             |
| `readinessProbe.enabled`             | Enable readinessProbe                            | `true`          |
| `readinessProbe.initialDelaySeconds` | Initial delay seconds for readinessProbe         | `30`            |
| `readinessProbe.periodSeconds`       | Period seconds for readinessProbe                | `10`            |
| `readinessProbe.timeoutSeconds`      | Timeout seconds for readinessProbe               | `5`             |
| `readinessProbe.failureThreshold`    | Failure threshold for readinessProbe             | `5`             |
| `readinessProbe.successThreshold`    | Success threshold for readinessProbe             | `1`             |
| `startupProbe.enabled`               | Enable startupProbe                              | `false`         |
| `startupProbe.initialDelaySeconds`   | Initial delay seconds for startupProbe           | `0`             |
| `startupProbe.periodSeconds`         | Period seconds for startupProbe                  | `10`            |
| `startupProbe.timeoutSeconds`        | Timeout seconds for startupProbe                 | `5`             |
| `startupProbe.failureThreshold`      | Failure threshold for startupProbe               | `60`            |
| `startupProbe.successThreshold`      | Success threshold for startupProbe               | `1`             |

### RBAC parameters

| Name                                          | Description                                                | Value  |
| --------------------------------------------- | ---------------------------------------------------------- | ------ |
| `serviceAccount.create`                       | Enable the creation of a ServiceAccount for Aerospike pods | `true` |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                     | `""`   |
| `serviceAccount.annotations`                  | Annotations for Aerospike Service Account                  | `{}`   |
| `serviceAccount.automountServiceAccountToken` | Automount API credentials for a service account.           | `true` |

### Traffic Exposure Parameters

| Name                               | Description                                                                   | Value       |
| ---------------------------------- | ----------------------------------------------------------------------------- | ----------- |
| `service.type`                     | Aerospike service type                                                        | `ClusterIP` |
| `service.ports.aql`                | Aerospike service aql Port                                                    | `3000`      |
| `service.nodePorts.aql`            | Node port for aql                                                             | `""`        |
| `service.extraPorts`               | Extra ports to expose in the service (normally used with the `sidecar` value) | `[]`        |
| `service.loadBalancerIP`           | LoadBalancerIP if service type is `LoadBalancer`                              | `""`        |
| `service.loadBalancerSourceRanges` | Service Load Balancer sources                                                 | `[]`        |
| `service.clusterIP`                | Service Cluster IP                                                            | `""`        |
| `service.externalTrafficPolicy`    | Service external traffic policy                                               | `Cluster`   |
| `service.annotations`              | Provide any additional annotations which may be required.                     | `{}`        |
| `service.sessionAffinity`          | Session Affinity for Kubernetes service, can be "None" or "ClientIP"          | `None`      |
| `service.sessionAffinityConfig`    | Additional settings for the sessionAffinity                                   | `{}`        |
| `service.headless.annotations`     | Annotations for the headless service.                                         | `{}`        |

### Persistence parameters

| Name                       | Description                                   | Value               |
| -------------------------- | --------------------------------------------- | ------------------- |
| `persistence.annotations`  | Persistent Volume Claim annotations           | `{}`                |
| `persistence.storageClass` | PVC Storage Class for Aerospike data volume   | `""`                |
| `persistence.size`         | PVC Storage Request for Aerospike data volume | `8Gi`               |
| `persistence.accessModes`  | Persistent Volume Access Mode                 | `["ReadWriteOnce"]` |
