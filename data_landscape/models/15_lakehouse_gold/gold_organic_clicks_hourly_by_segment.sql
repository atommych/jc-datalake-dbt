{#
    Gold organic_clicks_hourly_by_segment · Iceberg table (Gold) · Domain: Data Lakehouse
    Process stage: 15 · Lakehouse gold

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('silver_tracking_organic_clicks') }}  -- F109 Silver tracking_organic_clicks (Filter by agency, hourly aggregation, is_bot kept as grouping column)
-- depends_on: {{ ref('silver_ppp_job_ads') }}  -- F110 Silver ppp_job_ads (Broadcast left join on job_ad_id for job_category / job_city)

select 1 as placeholder
