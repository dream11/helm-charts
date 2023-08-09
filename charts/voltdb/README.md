<!--- app-name: Voltdb -->

# Voltdb Helm Chart

VoltDB is a commercial in-memory DBMS that is scalable and ACID-compliant.

[Overview of Voltdb](https://www.voltactivedata.com/)

## Introduction

This chart bootstraps an [Voltdb](https://hub.docker.com/r/voltdb/voltdb-community) deployment on a [Kubernetes](https://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm repo add dream11 https://dream11.github.io/helm-charts
helm install my-release dream11/voltdb
```

These commands deploy one node with Voltdb on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

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

### Voltdb parameters

| Name                                                      | Description                                                                     | Value                     |
| --------------------------------------------------------- | ------------------------------------------------------------------------------- | ------------------------- |
| `image.registry`                                          | Voltdb image registry                                                           | `docker.io`               |
| `image.repository`                                        | Voltdb image repository                                                         | `voltdb/voltdb-community` |
| `image.tag`                                               | Voltdb image tag (immutable tags are recommended)                               | `9.2.1`                   |
| `image.pullPolicy`                                        | image pull policy                                                               | `IfNotPresent`            |
| `image.pullSecrets`                                       | Voltdb image pull secrets                                                       | `[]`                      |
| `voltdb.directorySpec`                                    | Path to directory where voltdb will be initialised                              | `/var/voltdb`             |
| `voltdb.importers`                                        | Importer configuration for voltdb                                               | `[]`                      |
| `voltdb.exporters`                                        | Exporter configuration for voltdb                                               | `[]`                      |
| `voltdb.sitePerHost`                                      | Number of unique VoltDB sites that are created on each physical database server | `1`                       |
| `voltdb.kfactor`                                          | Number of times partitions will be replicated                                   | `0`                       |
| `voltdb.snapshots.enabled`                                | Enable automated snapshots?                                                     | `false`                   |
| `voltdb.snapshots.frequency`                              | Frequency for automated snapshots                                               | `24h`                     |
| `voltdb.snapshots.prefix`                                 | Prefix for snapshots                                                            | `AUTO`                    |
| `voltdb.snapshots.retentionPeriod`                        | Retention period for snapshots in days                                          | `2`                       |
| `voltdb.commandLog.enabled`                               | Enable command logging?                                                         | `false`                   |
| `voltdb.commandLog.synchronous`                           | Should the logging be synchronous?                                              | `false`                   |
| `voltdb.commandLog.logSize`                               | Disk space pre allocated for storing the logs on disk in MBs                    | `1024`                    |
| `voltdb.commandLog.frequency.time`                        | Write logs after every <time> milliseconds                                      | `200`                     |
| `voltdb.commandLog.frequency.transactions`                | Write logs after every <transactions> transactions                              | `1000`                    |
| `voltdb.heartbeat.timeout`                                | Heartbeat timeout between nodes                                                 | `90`                      |
| `voltdb.systemSettings.tempTables.maxSize`                | Max size of temporary tables in MBs                                             | `100`                     |
| `voltdb.systemSettings.snapshot.priority`                 | Snapshot priority                                                               | `6`                       |
| `voltdb.systemSettings.elastic.duration`                  | Time each rebalance transaction will take, in milliseconds                      | `50`                      |
| `voltdb.systemSettings.elastic.throughput`                | Number of MBs per second that will be processed by the rebalance transactions   | `2`                       |
| `voltdb.systemSettings.query.timeout`                     | Query timeout in milliseconds                                                   | `10000`                   |
| `voltdb.systemSettings.procedure.logInfo`                 | Log info whenever a task runs for more than specified time in milliseconds      | `10000`                   |
| `voltdb.systemSettings.resourceMonitor.frequency`         | Frequency at which resource limits are checked                                  | `60`                      |
| `voltdb.systemSettings.resourceMonitor.memoryLimit.size`  | Maximum allowable resident set size                                             | `80%`                     |
| `voltdb.systemSettings.resourceMonitor.memoryLimit.alert` | Alert thresold                                                                  | `70%`                     |
| `voltdb.security.enabled`                                 | Enable security?                                                                | `false`                   |
| `voltdb.security.provider`                                | Security provider                                                               | `hash`                    |
| `voltdb.license`                                          | Voltdb license                                                                  | `nil`                     |
| `extraEnvVars`                                            | Extra environment variables to be set on voltdb container                       | `[]`                      |

### Statefulset parameters

| Name                                 | Description                                   | Value           |
| ------------------------------------ | --------------------------------------------- | --------------- |
| `replicaCount`                       | Number of Voltdb replicas                     | `1`             |
| `affinity`                           | Affinity for pod assignment                   | `{}`            |
| `nodeSelector`                       | Node labels for pod assignment                | `{}`            |
| `updateStrategy.type`                | updateStrategy for Voltdb statefulset         | `RollingUpdate` |
| `podManagementPolicy`                | StatefulSet pod management policy             | `Parallel`      |
| `podAnnotations`                     | Additional pod annotations                    | `{}`            |
| `podLabels`                          | Additional pod labels                         | `{}`            |
| `resources.limits`                   | The resources limits for Voltdb containers    | `{}`            |
| `resources.requests`                 | The requested resources for Voltdb containers | `{}`            |
| `livenessProbe.enabled`              | Enable livenessProbe                          | `true`          |
| `livenessProbe.initialDelaySeconds`  | Initial delay seconds for livenessProbe       | `30`            |
| `livenessProbe.periodSeconds`        | Period seconds for livenessProbe              | `30`            |
| `livenessProbe.timeoutSeconds`       | Timeout seconds for livenessProbe             | `5`             |
| `livenessProbe.failureThreshold`     | Failure threshold for livenessProbe           | `5`             |
| `livenessProbe.successThreshold`     | Success threshold for livenessProbe           | `1`             |
| `readinessProbe.enabled`             | Enable readinessProbe                         | `true`          |
| `readinessProbe.initialDelaySeconds` | Initial delay seconds for readinessProbe      | `30`            |
| `readinessProbe.periodSeconds`       | Period seconds for readinessProbe             | `10`            |
| `readinessProbe.timeoutSeconds`      | Timeout seconds for readinessProbe            | `5`             |
| `readinessProbe.failureThreshold`    | Failure threshold for readinessProbe          | `5`             |
| `readinessProbe.successThreshold`    | Success threshold for readinessProbe          | `1`             |
| `startupProbe.enabled`               | Enable startupProbe                           | `false`         |
| `startupProbe.initialDelaySeconds`   | Initial delay seconds for startupProbe        | `0`             |
| `startupProbe.periodSeconds`         | Period seconds for startupProbe               | `10`            |
| `startupProbe.timeoutSeconds`        | Timeout seconds for startupProbe              | `5`             |
| `startupProbe.failureThreshold`      | Failure threshold for startupProbe            | `60`            |
| `startupProbe.successThreshold`      | Success threshold for startupProbe            | `1`             |

### RBAC parameters

| Name                                          | Description                                             | Value  |
| --------------------------------------------- | ------------------------------------------------------- | ------ |
| `serviceAccount.create`                       | Enable the creation of a ServiceAccount for Voltdb pods | `true` |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                  | `""`   |
| `serviceAccount.annotations`                  | Annotations for Voltdb Service Account                  | `{}`   |
| `serviceAccount.automountServiceAccountToken` | Automount API credentials for a service account.        | `true` |

### Traffic Exposure Parameters

| Name                               | Description                                                                   | Value       |
| ---------------------------------- | ----------------------------------------------------------------------------- | ----------- |
| `service.type`                     | Voltdb service type                                                           | `ClusterIP` |
| `service.ports.client`             | Voltdb service client Port                                                    | `21212`     |
| `service.nodePorts.client`         | Node port for client                                                          | `""`        |
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

| Name                       | Description                                | Value               |
| -------------------------- | ------------------------------------------ | ------------------- |
| `persistence.annotations`  | Persistent Volume Claim annotations        | `{}`                |
| `persistence.storageClass` | PVC Storage Class for Voltdb data volume   | `""`                |
| `persistence.size`         | PVC Storage Request for Voltdb data volume | `8Gi`               |
| `persistence.accessModes`  | Persistent Volume Access Mode              | `["ReadWriteOnce"]` |
