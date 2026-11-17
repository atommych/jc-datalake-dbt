{#
    Bronze ml_driven_pacing · Parquet table (Bronze, 7-day retention) · Domain: Data Science & AI
    Process stage: 13 · Lakehouse bronze

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('lakehouse_sources_mongodb', 'mongo_ml_driven_pacing') }}  -- F104 MongoDB ml-driven-pacing collection (Daily snapshot of the forecast collection)

select 1 as placeholder
