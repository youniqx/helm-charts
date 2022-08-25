/*
Package tools is used to track binary dependencies with go modules
https://github.com/golang/go/wiki/Modules#how-can-i-track-tool-dependencies-for-a-module
*/
package tools

// +build tools

import (
 _ "github.com/norwoodj/helm-docs/cmd/helm-docs"
 _ "sigs.k8s.io/kind"
 _ "github.com/youniqx/heist"
)
