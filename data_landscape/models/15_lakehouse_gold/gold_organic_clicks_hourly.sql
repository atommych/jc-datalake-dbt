{#
    Gold organic_clicks_hourly · Iceberg table (Gold) · Domain: Data Lakehouse
    Process stage: 15 · Lakehouse gold

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('silver_tracking_organic_clicks') }}  -- F113 Silver tracking_organic_clicks (Single-source hourly aggregation, no dimension join)

select 1 as placeholder
