
{{- define "heist.role.manager.kind.role" -}}
  {{- if .Values.scope.global -}}
    {{- print "ClusterRole" -}}
  {{- else }}
    {{- print "Role" -}}
  {{- end }}
{{- end }}

{{- define "heist.role.manager.kind.rolebinding" -}}
  {{- if .Values.scope.global -}}
    {{- print "ClusterRoleBinding" -}}
  {{- else }}
    {{- print "RoleBinding" -}}
  {{- end }}
{{- end }}
