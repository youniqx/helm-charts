
{{- define "heist.cert.secretName" -}}
  {{- printf "%s-tls" (include "heist.fullname" .) }}
{{- end }}

{{- define "heist.cert.name" -}}
  {{- include "heist.fullname" . }}
{{- end }}

{{- define "heist.cert.issuer" -}}
  {{- include "heist.fullname" . }}
{{- end }}

{{- define "heist.services.webhook" -}}
{{- printf "%s-webhook" (include "heist.fullname" .) }}
{{- end }}
