#!/bin/sh
# Install dbt packages, build Elementary, then host dbt docs (8080) and the Elementary report (8081).
set -e
cd /app/data_landscape

dbt deps
dbt run --select elementary
dbt test || echo "dbt test reported failures; continuing so the report is still published"
dbt docs generate --empty-catalog --static

mkdir -p edr_target
edr report --project-dir . --file-path edr_target/index.html --open-browser false

python -m http.server 8081 --bind 0.0.0.0 --directory edr_target &
exec dbt docs serve --host 0.0.0.0 --port 8080 --no-browser
