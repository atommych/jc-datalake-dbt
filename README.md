# jc-datalake-dbt

A documentation-only dbt project that maps a company's data and systems
landscape as a lineage graph. There is no database and no transformation
logic: the project is generated from a workbook and rendered with
`dbt docs`. Details of the dbt project itself are in
[`data_landscape/README.md`](data_landscape/README.md).

## Repository layout

| Path | Purpose |
|---|---|
| `data_landscape/` | The dbt project (models, sources, exposures, docs blocks, profile) |
| `data_landscape/dbt_project.yml` | Project config; node colours per process stage |
| `data_landscape/profiles.yml` | DuckDB `:memory:` profile, so nothing is written to disk |
| `data_landscape/models/` | Stub models per process stage (`03_…` to `10_…`), plus `sources.yml`, `exposures.yml` and `docs/` |
| `data_landscape/scripts/generate_project.py` | Regenerates `dbt_project.yml` and `models/` from the workbook |
| `data_landscape/dbt_docs.html` | Pre-built static docs; open in a browser, no install needed |
| `miro_data_sources_catalog.xlsx` | Source catalog workbook |
| `Dockerfile`, `docker-compose.yml`, `.dockerignore` | Container setup |
| `.devcontainer/devcontainer.json` | VS Code / Codespaces dev container |
| `Makefile` | Shortcuts for local, Docker and dev container workflows |

## How the landscape maps to dbt

- **Sources**: systems that send data but receive none.
- **Models**: systems that receive and pass data on (one-line stub SQL; edges are `ref()`/`source()` comments).
- **Exposures**: systems that only receive data (dashboards, end points).
- **Docs blocks**: notes, entities, metrics and aliases per system (`models/docs/systems.md`).

## Quick look (no install)

Open `data_landscape/dbt_docs.html` in a browser.

## Run with Docker

Requires Docker with Compose.

```bash
docker compose up --build
```

Then open http://localhost:8080.

The image installs `dbt-core` and `dbt-duckdb`, runs `dbt parse` at build
time, and on start generates the docs (`dbt docs generate --empty-catalog
--static`) and serves them on port 8080. `./data_landscape` is mounted into
the container, so edits are picked up on the next `docker compose up`.

Without Compose:

```bash
docker build -t data-landscape .
docker run --rm -p 8080:8080 data-landscape
```

## Run with a dev container

Open the folder in VS Code and choose **Dev Containers: Reopen in Container**
(or use GitHub Codespaces). `.devcontainer/devcontainer.json` uses a Python 3.12
image, installs `dbt-core`, `dbt-duckdb` and `openpyxl`, runs `dbt parse`, sets
`DBT_PROFILES_DIR` to `data_landscape/`, and forwards port 8080.

Inside the container:

```bash
cd data_landscape
dbt docs generate --empty-catalog --static
dbt docs serve --host 0.0.0.0 --no-browser   # http://localhost:8080
```

From a host terminal, with the [Dev Containers CLI](https://github.com/devcontainers/cli)
(`npm i -g @devcontainers/cli`): `make devcontainer-up`, then
`make devcontainer-serve` or `make devcontainer-shell`.

## Makefile shortcuts

Run `make help` for the full list.

| Command | Action |
|---|---|
| `make setup` | Create `.venv` and install dependencies |
| `make parse` / `docs` / `serve` | Parse, generate and serve docs locally |
| `make docker-run` | Build the image and run the container in the foreground |
| `make docker-up` / `docker-down` | Start/stop with Docker Compose |
| `make docker-logs` / `docker-shell` | Tail logs / open a shell |
| `make docker-dev` | Shell with the repo mounted at `/workspace`, for running the generator |
| `make docker-clean` | Remove the image and Compose resources |
| `make devcontainer-up` / `devcontainer-serve` / `devcontainer-shell` | Dev container via the CLI |
| `make clean` | Remove `.venv` and dbt artifacts |

Override variables with e.g. `make docker-run PORT=9000`.

## Run locally (no Docker)

```bash
python -m venv .venv && source .venv/bin/activate
pip install dbt-core dbt-duckdb
cd data_landscape
dbt parse --profiles-dir .
dbt docs generate --empty-catalog --static --profiles-dir .
dbt docs serve --profiles-dir .
```

## Updating the landscape

Edit the workbook, then regenerate (this replaces `dbt_project.yml` and
everything under `models/`):

```bash
pip install openpyxl
python data_landscape/scripts/generate_project.py path/to/data_sources_standardized.xlsx
```

Systems that only receive data take their stage from `SINK_STAGES` in the
script; add new end-point systems there.

## Troubleshooting

- **Port 8080 in use**: change the left side of the port mapping in `docker-compose.yml`.
- **`docker: command not found`**: install Docker Desktop first.
