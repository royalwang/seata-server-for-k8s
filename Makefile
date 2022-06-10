#!/usr/bin/make
SHELL=/bin/bash

.DEFAULT_GOAL := help
.PHONY: help

help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-14s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

repo: ## Docker image build multi-platform
	helm package -d ./charts charts/seata
	helm repo index --url https://royalwang.github.io/seata-server-for-k8s/ ./
