{#
    Glue silver clicks_job_hit_historical · Iceberg table (Glue, Silver) · Domain: Tracking
    Process stage: 14 · Lakehouse silver

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('glue_silver_clicks_all_platforms_historical') }}  -- F143 Glue silver clicks_all_platforms_historical (job_hit events filtered from historical clicks (assumed))

select 1 as placeholder
