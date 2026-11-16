IMAGE ?= data-landscape
PORT  ?= 8080
ELEMENTARY_PORT ?= 8081
VENV  ?= .venv
BIN   := $(VENV)/bin
DBT_DIR := data_landscape
# edr runs dbt from a temp dir, so the DuckDB file needs an absolute path
export DUCKDB_PATH := $(abspath $(DBT_DIR))/data_landscape.duckdb

.DEFAULT_GOAL := help
.PHONY: help setup deps parse docs serve elementary-build elementary-report elementary-serve serve-all clean docker-build docker-run docker-up docker-down docker-logs docker-shell docker-dev docker-clean devcontainer-up devcontainer-serve devcontainer-shell

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

# Local environment
setup: ## Create venv and install dbt-core, dbt-duckdb, elementary-data, openpyxl
	python3 -m venv $(VENV)
	$(BIN)/pip install --upgrade pip
	$(BIN)/pip install dbt-core dbt-duckdb "elementary-data[duckdb]" openpyxl

deps: ## Install dbt packages (elementary)
	cd $(DBT_DIR) && ../$(BIN)/dbt deps --profiles-dir .

parse: deps ## Parse the dbt project locally
	cd $(DBT_DIR) && ../$(BIN)/dbt parse --profiles-dir .

docs: deps ## Generate static dbt docs locally
	cd $(DBT_DIR) && ../$(BIN)/dbt docs generate --empty-catalog --static --profiles-dir .

serve: ## Serve dbt docs locally on PORT
	cd $(DBT_DIR) && ../$(BIN)/dbt docs serve --port $(PORT) --profiles-dir .

elementary-build: deps ## Create Elementary models and run dbt tests so results are stored
	cd $(DBT_DIR) && ../$(BIN)/dbt run --select elementary --profiles-dir .
	cd $(DBT_DIR) && ../$(BIN)/dbt test --profiles-dir .

elementary-report: ## Generate the Elementary report (data_landscape/edr_target/index.html)
	cd $(DBT_DIR) && ../$(BIN)/edr report --profiles-dir . --project-dir . --file-path edr_target/index.html --open-browser false

elementary-serve: ## Serve the Elementary report on ELEMENTARY_PORT
	cd $(DBT_DIR)/edr_target && ../../$(BIN)/python -m http.server $(ELEMENTARY_PORT)

serve-all: docs elementary-report ## Serve dbt docs (PORT) and Elementary report (ELEMENTARY_PORT) together
	@echo "dbt docs: http://localhost:$(PORT)  Elementary: http://localhost:$(ELEMENTARY_PORT)"
	@trap "kill 0" INT TERM EXIT; $(MAKE) serve & $(MAKE) elementary-serve & wait

clean: ## Remove local venv and dbt build artifacts
	rm -rf $(VENV) $(DBT_DIR)/target $(DBT_DIR)/logs $(DBT_DIR)/dbt_packages $(DBT_DIR)/edr_target $(DBT_DIR)/*.duckdb*

# Docker
docker-build: ## Build the Docker image
	docker build -t $(IMAGE) .

docker-run: docker-build ## Build and run the container in the foreground
	docker run --rm -p $(PORT):8080 -p $(ELEMENTARY_PORT):8081 --name $(IMAGE) $(IMAGE)

docker-up: ## Start with docker compose (detached, rebuilds)
	docker compose up --build -d
	@echo "Docs at http://localhost:8080, Elementary at http://localhost:8081"

docker-down: ## Stop docker compose services
	docker compose down

docker-logs: ## Tail docker compose logs
	docker compose logs -f

docker-shell: ## Open a shell in a fresh container
	docker run --rm -it -p $(PORT):8080 $(IMAGE) sh

docker-dev: docker-build ## Shell in a container with the repo mounted at /workspace (run the generator, dbt)
	docker run --rm -it -p $(PORT):8080 -v "$(CURDIR)":/workspace -w /workspace --entrypoint bash $(IMAGE)

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
