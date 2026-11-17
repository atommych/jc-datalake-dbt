{#
    Silver ml_driven_pacing_forecasts · Iceberg table (Silver) · Domain: Data Science & AI
    Process stage: 14 · Lakehouse silver

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('bronze_ml_driven_pacing') }}  -- F108 Bronze ml_driven_pacing (Explode weights to one row per (forecast_doc_id, key_id, ts_hour))

select 1 as placeholder
