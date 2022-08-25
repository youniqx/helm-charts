
{{- define "heist.role.name" -}}
  {{- $name := index . 0 }}
  {{- $type := index . 1 }}
  {{- $dot := index . 2 }}
  {{- printf "heist:%s:%s" $name $type }}
{{- end }}

{{- define "heist.role.manager.leaderelection" -}}
  {{ include "heist.role.name" (list "manager" "leader-election" .) }}
{{- end }}

{{- define "heist.role.manager.operator" -}}
  {{ include "heist.role.name" (list "manager" "operator" .) }}
{{- end }}

{{- define "heist.role.user.authority.editor" -}}
  {{ include "heist.role.name" (list "authority" "editor" .) }}
{{- end }}

{{- define "heist.role.user.authority.viewer" -}}
  {{ include "heist.role.name" (list "authority" "viewer" .) }}
{{- end }}

{{- define "heist.role.user.binding.editor" -}}
  {{ include "heist.role.name" (list "binding" "editor" .) }}
{{- end }}

{{- define "heist.role.user.binding.viewer" -}}
  {{ include "heist.role.name" (list "binding" "viewer" .) }}
{{- end }}

{{- define "heist.role.user.certificate.editor" -}}
  {{ include "heist.role.name" (list "certificate" "editor" .) }}
{{- end }}

{{- define "heist.role.user.certificate.viewer" -}}
  {{ include "heist.role.name" (list "certificate" "viewer" .) }}
{{- end }}

{{- define "heist.role.user.kvengine.editor" -}}
  {{ include "heist.role.name" (list "kvengine" "editor" .) }}
{{- end }}

{{- define "heist.role.user.kvengine.viewer" -}}
  {{ include "heist.role.name" (list "kvengine" "viewer" .) }}
{{- end }}

{{- define "heist.role.user.kvsecret.editor" -}}
  {{ include "heist.role.name" (list "kvsecret" "editor" .) }}
{{- end }}

{{- define "heist.role.user.kvsecret.viewer" -}}
  {{ include "heist.role.name" (list "kvsecret" "viewer" .) }}
{{- end }}

{{- define "heist.role.user.syncsecret.editor" -}}
  {{ include "heist.role.name" (list "syncsecret" "editor" .) }}
{{- end }}

{{- define "heist.role.user.syncsecret.viewer" -}}
  {{ include "heist.role.name" (list "syncsecret" "viewer" .) }}
{{- end }}

{{- define "heist.role.user.transitengine.editor" -}}
  {{ include "heist.role.name" (list "transitengine" "editor" .) }}
{{- end }}

{{- define "heist.role.user.transitengine.viewer" -}}
  {{ include "heist.role.name" (list "transitengine" "viewer" .) }}
{{- end }}

{{- define "heist.role.user.transitkey.editor" -}}
  {{ include "heist.role.name" (list "transitkey" "editor" .) }}
{{- end }}

{{- define "heist.role.user.transitkey.viewer" -}}
  {{ include "heist.role.name" (list "transitkey" "viewer" .) }}
{{- end }}
