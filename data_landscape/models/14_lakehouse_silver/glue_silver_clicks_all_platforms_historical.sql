{#
    Glue silver clicks_all_platforms_historical · Iceberg table (Glue, Silver) · Domain: Tracking
    Process stage: 14 · Lakehouse silver

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('glue_bronze_clicks_all_platforms_historical') }}  -- F132 Glue bronze clicks_all_platforms_historical (Historical clicks promoted to Silver)

select 1 as placeholder
