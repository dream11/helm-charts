{{/* vim: set filetype=mustache: */}}

{{/*
Return the proper voltdb image name
*/}}
{{- define "voltdb.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "voltdb.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return the voltdb configuration configmap
*/}}
{{- define "voltdb.configmapName" -}}
{{- printf "%s-configuration" (include "common.names.fullname" .) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "voltdb.imagePullSecrets" -}}
{{ include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) }}
{{- end -}}

{{/*
Return the list of voltdb hosts
*/}}
{{- define "voltdb.hosts" -}}
{{- $hosts := list }}
{{- $fullname := include "common.names.fullname" . }}
{{- $releaseNamespace := .Release.Namespace }}
{{- $clusterDomain := .Values.clusterDomain }}
{{- $hostCount := .Values.replicaCount | int }}
{{- range $e, $i := until $hostCount }}
{{- $hosts = append $hosts (printf "%s-%d.%s-headless.%s.svc.%s" $fullname $i $fullname $releaseNamespace $clusterDomain) }}
{{- end }}
{{- join "," $hosts }}
{{- end -}}

{{/*
Return path to deployment.xml
*/}}
{{- define "voltdb.configPath" -}}
{{- printf "%s/deployment.xml" .Values.voltdb.directorySpec -}}
{{- end -}}

{{/*
Return path to license.xml
*/}}
{{- define "voltdb.licensePath" -}}
{{- printf "%s/license.xml" .Values.voltdb.directorySpec -}}
{{- end -}}

{{/*
Return path to voltdbroot
*/}}
{{- define "voltdb.rootPath" -}}
{{- printf "%s/voltdbroot" .Values.voltdb.directorySpec -}}
{{- end -}}

{{/*
Return terminal paths in a dictionary
Usage: {{ include "util.terminalPaths" dict }}
*/}}
{{- define "util.terminalPaths" -}}
{{- $terminalPaths := list }}
{{- range $k, $v := . }}
    {{- if not (or (kindIs "map" $v) (kindIs "slice" $v)) -}}
    {{- $terminalPaths = append $terminalPaths (printf "%s=\"%v\"" $k $v) }}
    {{- end }}
{{- end }}
{{- join " " $terminalPaths }}
{{- end -}}


{{/*
Return voltdb configuration
*/}}
{{- define "voltdb.configuration" -}}
    {{- range $k, $v := .object }}
        {{- if or (eq "import" $k) (eq "export" $k) -}}
        {{- else if kindIs "map" $v -}}
            {{- indent (int $.indentation) (printf "<%s %s>\n" $k (include "util.terminalPaths" $v )) }}
            {{- printf "%s" (include "voltdb.configuration" (dict "object" $v "indentation" (add .indent 2))) }}
            {{- printf "</%s>\n" $k -}}
        {{- else if kindIs "slice" $v -}}
            {{- range $dict := $v }}
                {{- printf "%s" (include "voltdb.configuration" (dict "object" (dict $k $dict) "indentation" (add .indent 2))) }}
            {{- end }}
        {{- else -}}
        {{- end -}}
    {{- end }}
{{- end -}}


