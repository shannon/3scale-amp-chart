{{/*
Expand the name of the chart.
*/}}
{{- define "3scale-amp-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "3scale-amp-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "3scale-amp-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "3scale-amp-chart.labels" -}}
helm.sh/chart: {{ include "3scale-amp-chart.chart" . }}
{{ include "3scale-amp-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app: {{ .Values.appLabel }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "3scale-amp-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "3scale-amp-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "3scale-amp-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "3scale-amp-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* 
Merges .Values.secret data with existing secret data if found. This helps avoid regenerating secrets if they are already set.
Specified name is kebabcased when performing lookup on secret resource. The values in .Values.secrets will be processed as templates.
Include in each template that needs the secrets, it will only process once.
*/}}
{{- define "3scale-amp-chart.mergeSecretsFromValues" -}}
{{- if hasKey $ "secretsProcessed" -}}
{{- else }}
  {{- range $name, $values := .Values.secrets }}
    {{- $existing := (lookup "v1" "Secret" $.Release.Namespace ($name | kebabcase)) }}
    {{- if $existing }}
      {{- range $key, $value := $existing.data }}
        {{- $_ := set $values $key ($value | b64dec) }}
      {{- end }}
    {{- end }}
    {{- range $key, $value := $values }}
      {{- $_ := set $values $key (tpl $value (mergeOverwrite (dict) $ $values)) }}
    {{- end }}
  {{- end }}
  {{- $_ := set $ "secretsProcessed" "true" }}
{{- end }}
{{- end }}
