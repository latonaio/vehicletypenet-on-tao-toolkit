# Self-Documented Makefile
# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

tao-docker-run: ## TAO用コンテナを建てる
	docker-compose -f docker-compose.yaml up -d

tao-docker-build: ## TAO用コンテナをビルド
	docker-compose -f docker-compose.yaml build

tao-convert:
	docker exec -it vehicletypenet-tao-toolkit tao-converter -k tlt_encode -t fp16 -d 3,224,224 -e /app/src/vehicletypenet.engine /app/src/resnet18_vehicletypenet_pruned.etlt

tao-docker-login: ## TAO用コンテナにログイン
	docker exec -it vehicletypenet-tao-toolkit bash

