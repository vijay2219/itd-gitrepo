{{- define "test.labels" -}}
app: nginx-{{- randNumeric 4 -}}
{{- end }}

{{- define "container.details" -}}
image:nginx
ports:8080
{{- end}}
