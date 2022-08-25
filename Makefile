
all: generate lint

lint:

HELM_DOCS = $(shell pwd)/bin/helm-docs
bin/helm-docs:
	$(call go-get-tool,$(HELM_DOCS),github.com/norwoodj/helm-docs/cmd/helm-docs)

generate: bin/helm-docs
	$(HELM_DOCS) charts

test: test_heist

test_heist: kind/heist

KIND = $(shell pwd)/bin/kind
bin/kind:
	$(call go-get-tool,$(KIND),sigs.k8s.io/kind)

kind/cluster: bin/kind
	$(KIND) create cluster
	mkdir -p kind
	touch kind/cluster

kind/cert-manager: kind/cluster
	helm repo add jetstack https://charts.jetstack.io
	helm repo update
	helm upgrade cert-manager jetstack/cert-manager \
	  --kube-context kind-kind \
	  --namespace cert-manager \
	  --create-namespace \
	  --version v1.3.1 \
	  --atomic --install \
	  --set installCRDs=true
	touch kind/cert-manager

kind/vault: kind/cluster
	helm repo add hashicorp https://helm.releases.hashicorp.com
	helm repo update
	helm upgrade vault hashicorp/vault \
		--kube-context kind-kind \
		--namespace vault \
		--create-namespace \
		--install --atomic \
		--set server.dev.enabled=true \
		--set server.logLevel=trace
	touch kind/vault

HEIST = $(shell pwd)/bin/heist
bin/heist:
	$(call go-get-tool,$(HEIST),github.com/youniqx/heist)

kind/heist: kind/cluster kind/vault kind/cert-manager bin/heist
	$(HEIST) setup k8s \
		--vault-namespace vault \
		--vault-service vault \
		--vault-port 8200 \
		--vault-token root \
		--kubernetes-jwt-issuer https://kubernetes.default.svc.cluster.local
	helm upgrade heist ./charts/heist \
		--kube-context kind-kind \
	  	--namespace heist-system \
	  	--create-namespace \
	  	--install --atomic \
	  	--set vault.address=http://vault.vault.svc.cluster.local:8200 \
	  	--set vault.role=heist \
	  	--set "heist.config.syncSecretNamespaceAllowList={default}"
	touch kind/heist

kind/heist_example: kind/heist
	kubectl create ns heist-test || :
	kubectl --context kind-kind -n heist-test apply -f charts/heist/example.yaml
	touch kind/heist_example

kind: kind/heist_example

clean:
	$(KIND) delete cluster || :
	rm -rf kind
	rm -rf bin

# go-get-tool will 'go get' any package $2 and install it to $1.
PROJECT_DIR := $(shell pwd)
define go-get-tool
@[ -f $(1) ] || { \
set -e ;\
cd $(PROJECT_DIR)/hack/tools ;\
echo "Downloading $(2)" ;\
echo "GOBIN=$(PROJECT_DIR)/bin go install $(2)" ;\
GOBIN=$(PROJECT_DIR)/bin go install $(2) ;\
}
endef
