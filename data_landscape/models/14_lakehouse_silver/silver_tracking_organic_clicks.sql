{#
    Silver tracking_organic_clicks · Iceberg table (Silver, fact) · Domain: Data Lakehouse
    Process stage: 14 · Lakehouse silver

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('bronze_tracking_organic_clicks') }}  -- F106 Bronze tracking_organic_clicks (Latest ingested_at batch merged on event_id; snake_case rename, ObjectId normalised)

select 1 as placeholder
