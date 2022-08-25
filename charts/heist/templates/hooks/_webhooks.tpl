
{{- define "heist.webhooks.name" -}}
  {{- $name := index . 0 }}
  {{- $dot := index . 1 }}
  {{- printf "heist-%s-%s" $dot.Release.Namespace $name }}
{{- end }}

{{- define "heist.webhooks.mutating" -}}
  {{- include "heist.webhooks.name" (list "mutating" .) }}
{{- end }}

{{- define "heist.webhooks.validating" -}}
  {{- include "heist.webhooks.name" (list "validating" .) }}
{{- end }}
