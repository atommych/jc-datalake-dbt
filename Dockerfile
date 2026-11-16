FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    DBT_PROFILES_DIR=/app/data_landscape \
    DUCKDB_PATH=/app/data_landscape/data_landscape.duckdb

RUN apt-get update && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*
RUN pip install dbt-core dbt-duckdb "elementary-data[duckdb]" openpyxl

WORKDIR /app/data_landscape
COPY data_landscape/ /app/data_landscape/
COPY docker/entrypoint.sh /usr/local/bin/entrypoint.sh

# Pre-install packages and validate the project at build time
RUN dbt deps && dbt parse

EXPOSE 8080 8081
# Builds Elementary, then serves dbt docs (8080) and the Elementary report (8081)
CMD ["entrypoint.sh"]
