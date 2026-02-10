{{/*
Expand the name of the chart.
*/}}
{{- define "signalen.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "signalen.fullname" -}}
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
{{- define "signalen.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "signalen.labels" -}}
helm.sh/chart: {{ include "signalen.chart" . }}
{{ include "signalen.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "signalen.selectorLabels" -}}
app.kubernetes.io/name: {{ include "signalen.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "signalen.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "signalen.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Frontend Legacy fullname
*/}}
{{- define "signalen.frontend-legacy.fullname" -}}
{{- printf "%s-frontend-legacy" (include "signalen.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Frontend Legacy labels
*/}}
{{- define "signalen.frontend-legacy.labels" -}}
helm.sh/chart: {{ include "signalen.chart" . }}
{{ include "signalen.frontend-legacy.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: frontend-legacy
{{- end }}

{{/*
Frontend Legacy selector labels
*/}}
{{- define "signalen.frontend-legacy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "signalen.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: frontend-legacy
{{- end }}

{{/*
Frontend WCAG fullname
*/}}
{{- define "signalen.frontend-wcag.fullname" -}}
{{- printf "%s-frontend-wcag" (include "signalen.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Frontend WCAG labels
*/}}
{{- define "signalen.frontend-wcag.labels" -}}
helm.sh/chart: {{ include "signalen.chart" . }}
{{ include "signalen.frontend-wcag.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: frontend-wcag
{{- end }}

{{/*
Frontend WCAG selector labels
*/}}
{{- define "signalen.frontend-wcag.selectorLabels" -}}
app.kubernetes.io/name: {{ include "signalen.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: frontend-wcag
{{- end }}

{{/*
Backend fullname
*/}}
{{- define "signalen.backend.fullname" -}}
{{- printf "%s-backend" (include "signalen.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Backend labels
*/}}
{{- define "signalen.backend.labels" -}}
helm.sh/chart: {{ include "signalen.chart" . }}
{{ include "signalen.backend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: backend
{{- end }}

{{/*
Backend selector labels
*/}}
{{- define "signalen.backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "signalen.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: backend
{{- end }}

{{/*
Celery Beat fullname
*/}}
{{- define "signalen.backend-celery-beat.fullname" -}}
{{- printf "%s-backend-celery-beat" (include "signalen.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Celery Beat labels
*/}}
{{- define "signalen.backend-celery-beat.labels" -}}
helm.sh/chart: {{ include "signalen.chart" . }}
{{ include "signalen.backend-celery-beat.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: backend-celery-beat
{{- end }}

{{/*
Celery Beat selector labels
*/}}
{{- define "signalen.backend-celery-beat.selectorLabels" -}}
app.kubernetes.io/name: {{ include "signalen.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: backend-celery-beat
{{- end }}

{{/*
Celery Worker fullname
*/}}
{{- define "signalen.backend-celery-worker.fullname" -}}
{{- printf "%s-backend-celery-worker" (include "signalen.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Celery Worker labels
*/}}
{{- define "signalen.backend-celery-worker.labels" -}}
helm.sh/chart: {{ include "signalen.chart" . }}
{{ include "signalen.backend-celery-worker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: backend-celery-worker
{{- end }}

{{/*
Celery Worker selector labels
*/}}
{{- define "signalen.backend-celery-worker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "signalen.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: backend-celery-worker
{{- end }}
