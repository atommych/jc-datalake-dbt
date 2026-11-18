{#
    Glue silver clicks_job_hit_stream · Iceberg table (Glue, Silver) · Domain: Tracking
    Process stage: 14 · Lakehouse silver

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('glue_bronze_clicks_all_platforms_stream') }}  -- F142 Glue bronze clicks_all_platforms_stream (Filtered click stream for job_hit)

select 1 as placeholder
