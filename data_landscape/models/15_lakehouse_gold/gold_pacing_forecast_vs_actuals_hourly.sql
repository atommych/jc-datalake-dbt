{#
    Gold pacing_forecast_vs_actuals_hourly · Iceberg table (Gold) · Domain: Data Science & AI
    Process stage: 15 · Lakehouse gold

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('silver_ml_driven_pacing_forecasts') }}  -- F114 Silver ml_driven_pacing_forecasts (Newest forecast per (key_id, ts_hour), compared per tier)
-- depends_on: {{ ref('gold_organic_clicks_hourly_by_segment') }}  -- F115 Gold organic_clicks_hourly_by_segment (Actuals collapsed over is_bot, full outer join to forecast per tier)
-- depends_on: {{ ref('gold_sponsored_clicks_hourly_by_segment') }}  -- F116 Gold sponsored_clicks_hourly_by_segment (Actuals collapsed over is_bot, full outer join to forecast per tier)

select 1 as placeholder
