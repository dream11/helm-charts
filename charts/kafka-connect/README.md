<!--- app-name: Kafka connect -->

## Prerequisites
* Kubernetes 1.9.2+
* Helm 2.8.2+
* A healthy and accessible Kafka Cluster

## Installing the Chart

To install the chart with the release name `my-release`:

```console
helm repo add dream11 https://dream11.github.io/helm-charts
helm install my-release dream11/kafka-connect
```

These commands deploy kafka-connect on the Kubernetes cluster in the default configuration. The [Parameters](#Parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` release:

```console
helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.


## Parameters

### Global parameters

| Name                                                       | Description                                                                   | Value                                                              |
| ---------------------------------------------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| `global.imageRegistry`                                     | Global Docker image registry                                                  | `""`                                                               |
| `global.imagePullSecrets`                                  | Global Docker registry secret names as an array                               | `[]`                                                               |
| `global.storageClass`                                      | Global StorageClass for Persistent Volume(s)                                  | `""`                                                               |
| `image.registry`                                           | Kafka connect image registry                                                  | `docker.io`                                                        |
| `image.repository`                                         | Kafka connect image repository                                                | `confluentinc/cp-kafka-connect`                                    |
| `image.tag`                                                | Kafka connect image tag (immutable tags are recommended)                      | `6.1.0`                                                            |
| `image.pullPolicy`                                         | image pull policy                                                             | `IfNotPresent`                                                     |
| `image.pullSecrets`                                        | Kafka connect image pull secrets                                              | `[]`                                                               |
| `nameOverride`                                             | String to partially override common.names.fullname                            | `""`                                                               |
| `fullnameOverride`                                         | String to fully override common.names.fullname                                | `""`                                                               |
| `commonLabels`                                             | Labels to add to all deployed objects (sub-charts are not considered)         | `{}`                                                               |
| `commonAnnotations`                                        | Annotations to add to all deployed objects                                    | `{}`                                                               |
| `replicaCount`                                             | to decide the number of kafka connect pod replicas                            | `1`                                                                |
| `extraEnvVars`                                             | Extra environment variables to be set on kafka connect container              | `[]`                                                               |
| `service.type`                                             | Kafka connect service type                                                    | `ClusterIP`                                                        |
| `service.ports.kafkaConnect`                               | Kafka connect service Port                                                    | `8083`                                                             |
| `service.ports.jmx`                                        | jmx Port                                                                      | `5556`                                                             |
| `service.extraPorts`                                       | Extra ports to expose in the service (normally used with the `sidecar` value) | `[]`                                                               |
| `service.loadBalancerIP`                                   | LoadBalancerIP if service type is `LoadBalancer`                              | `""`                                                               |
| `service.loadBalancerSourceRanges`                         | Service Load Balancer sources                                                 | `[]`                                                               |
| `service.clusterIP`                                        | Service Cluster IP                                                            | `""`                                                               |
| `service.externalTrafficPolicy`                            | Service external traffic policy                                               | `Cluster`                                                          |
| `service.annotations`                                      | Provide any additional annotations which may be required.                     | `{}`                                                               |
| `service.sessionAffinity`                                  | Session Affinity for Kubernetes service, can be "None" or "ClientIP"          | `None`                                                             |
| `service.sessionAffinityConfig`                            | Additional settings for the sessionAffinity                                   | `{}`                                                               |
| `configurationOverrides.plugin.path`                       | the plugin path in the file system                                            | `/usr/share/java,/usr/share/confluent-hub-components`              |
| `configurationOverrides.key.converter`                     | the serializer for keys                                                       | `io.confluent.connect.avro.AvroConverter`                          |
| `configurationOverrides.value.converter`                   | the serializer for values                                                     | `io.confluent.connect.avro.AvroConverter`                          |
| `configurationOverrides.key.converter.schemas.enable`      | enable schemas for key converter                                              | `undefined`                                                        |
| `configurationOverrides.value.converter.schemas.enable`    | enable schemas for value converter                                            | `undefined`                                                        |
| `configurationOverrides.internal.key.converter`            | internal key converter                                                        | `org.apache.kafka.connect.json.JsonConverter`                      |
| `configurationOverrides.internal.value.converter`          | internal value converter                                                      | `org.apache.kafka.connect.json.JsonConverter`                      |
| `configurationOverrides.config.storage.replication.factor` | config storage replication factor                                             | `3`                                                                |
| `configurationOverrides.offset.storage.replication.factor` | offset storage replication factor                                             | `3`                                                                |
| `configurationOverrides.status.storage.replication.factor` | status storage replication factor                                             | `3`                                                                |
| `heapOptions`                                              | Kafka Connect JVM Heap Option                                                 | `-Xms512M -Xmx512M`                                                |
| `customEnv`                                                | Additional env variables                                                      | `{}`                                                               |
| `resources`                                                | The limits and requests for kafka connect containers                          | `{}`                                                               |
| `podAnnotations`                                           | Custom pod annotations                                                        | `{}`                                                               |
| `nodeSelector`                                             | Node labels for pod assignment                                                | `{}`                                                               |
| `tolerations`                                              | Taints to tolerate on node assignment:                                        | `[]`                                                               |
| `affinity`                                                 | Pod scheduling constraints                                                    | `{}`                                                               |
| `jmx.port`                                                 | Kafka Connect JMX Settings for Monitoring                                     | `5555`                                                             |
| `prometheus.jmx.enabled`                                   | JMX Exporter                                                                  | `true`                                                             |
| `prometheus.jmx.image.registry`                            | JMX Exporter image registry                                                   | `docker.io`                                                        |
| `prometheus.jmx.image.repository`                          | JMX Exporter image repository                                                 | `solsson/kafka-prometheus-jmx-exporter@sha256`                     |
| `prometheus.jmx.image.tag`                                 | JMX Exporter image tag                                                        | `6f82e2b0464f50da8104acd7363fb9b995001ddff77d248379f8788e78946143` |
| `prometheus.jmx.image.pullPolicy`                          | JMX Exporter image pull policy                                                | `IfNotPresent`                                                     |
| `prometheus.jmx.image.pullSecrets`                         | JMX Exporter image pull secrets                                               | `[]`                                                               |
| `prometheus.jmx.resources`                                 | JMX Exporter resources                                                        | `{}`                                                               |
| `kafka.bootstrapServers`                                   | list of the kafka brokers ex."PLAINTEXT://dozing-prawn-kafka-headless:9092"   | `""`                                                               |
| `schema-registry.url`                                      | schema-registry url                                                           | `""`                                                               |
| `volumeMounts`                                             | List of volumeMounts for connect server container                             | `nil`                                                              |
| `volumes`                                                  | List of volumeMounts for connect server container                             | `nil`                                                              |
| `secrets`                                                  | Secret with multiple keys to serve the purpose of multiple secrets            | `nil`                                                              |
| `livenessProbe`                                            | the livenessProbe for the kafka connect pods                                  | `nil`                                                              |
| `serviceAccount.create`                                    | Enable the creation of a ServiceAccount for Kafka connect pods                | `true`                                                             |
| `serviceAccount.name`                                      | The name of the ServiceAccount to use.                                        | `""`                                                               |
| `serviceAccount.annotations`                               | Annotations for Kafka connect Service Account                                 | `{}`                                                               |
| `serviceAccount.automountServiceAccountToken`              | Automount API credentials for a service account.                              | `true`                                                             |
