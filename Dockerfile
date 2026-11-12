FROM python:3.12-slim

ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    DBT_PROFILES_DIR=/app/data_landscape

RUN pip install "dbt>=2.0" "dbt-duckdb>=1.8" openpyxl

WORKDIR /app/data_landscape
COPY data_landscape/ /app/data_landscape/

RUN dbt parse

EXPOSE 8080
# Generate docs, then serve them on all interfaces
CMD ["sh", "-c", "dbt docs generate --empty-catalog --static && dbt docs serve --host 0.0.0.0 --port 8080 --no-browser"]
