
{{- define "heist.watch.namespaces" -}}
  {{- if .Values.scope.global -}}
    {{- print "" -}}
  {{- else }}
    {{- if not .Values.scope.watchedNamespaces }}
      {{- fail "At least one namespace has to be set for a scoped deployment" }}
    {{- end }}
    {{- .Values.scope.watchedNamespaces | join "," -}}
  {{- end }}
{{- end }}

