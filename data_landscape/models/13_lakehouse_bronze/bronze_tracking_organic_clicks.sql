{#
    Bronze tracking_organic_clicks · Parquet table (Bronze, 7-day retention) · Domain: Data Lakehouse
    Process stage: 13 · Lakehouse bronze

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('lakehouse_sources', 'mongo_tracking_organic_clicks') }}  -- F102 MongoDB organic clicks collection (Watermark incremental: max(event_timestamp) minus 3 days up to end of yesterday; 21-field allowlist applied server-side (ip excluded))

select 1 as placeholder
