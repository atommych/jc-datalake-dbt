IMAGE ?= data-landscape
PORT  ?= 8080
VENV  ?= .venv
BIN   := $(VENV)/bin
DBT_DIR := data_landscape

.DEFAULT_GOAL := help
.PHONY: help setup parse docs serve clean docker-build docker-run docker-up docker-down docker-logs docker-shell docker-clean devcontainer-up devcontainer-serve devcontainer-shell

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

# Local environment
setup: ## Create venv and install dbt-core, dbt-duckdb, openpyxl
	python3 -m venv $(VENV)
	$(BIN)/pip install --upgrade pip
	$(BIN)/pip install dbt-core dbt-duckdb openpyxl

parse: ## Parse the dbt project locally
	cd $(DBT_DIR) && ../$(BIN)/dbt parse --profiles-dir .

docs: ## Generate static dbt docs locally
	cd $(DBT_DIR) && ../$(BIN)/dbt docs generate --empty-catalog --static --profiles-dir .

serve: ## Serve dbt docs locally on PORT
	cd $(DBT_DIR) && ../$(BIN)/dbt docs serve --port $(PORT) --profiles-dir .

clean: ## Remove local venv and dbt build artifacts
	rm -rf $(VENV) $(DBT_DIR)/target $(DBT_DIR)/logs

# Docker
docker-build: ## Build the Docker image
	docker build -t $(IMAGE) .

docker-run: docker-build ## Build and run the container in the foreground
	docker run --rm -p $(PORT):8080 --name $(IMAGE) $(IMAGE)

docker-up: ## Start with docker compose (detached, rebuilds)
	docker compose up --build -d
	@echo "Docs at http://localhost:8080"

docker-down: ## Stop docker compose services
	docker compose down

docker-logs: ## Tail docker compose logs
	docker compose logs -f

docker-shell: ## Open a shell in a fresh container
	docker run --rm -it -p $(PORT):8080 $(IMAGE) sh

docker-clean: ## Remove the Docker image and compose resources
	-docker compose down --rmi local
	-docker rmi $(IMAGE)

# Dev container (requires the Dev Containers CLI: npm i -g @devcontainers/cli)
devcontainer-up: ## Build and start the dev container
	devcontainer up --workspace-folder .

devcontainer-serve: ## Serve dbt docs inside the dev container
	devcontainer exec --workspace-folder . sh -c "cd data_landscape && dbt docs generate --empty-catalog --static && dbt docs serve --host 0.0.0.0 --port $(PORT) --no-browser"

devcontainer-shell: ## Open a shell in the dev container
	devcontainer exec --workspace-folder . bash
