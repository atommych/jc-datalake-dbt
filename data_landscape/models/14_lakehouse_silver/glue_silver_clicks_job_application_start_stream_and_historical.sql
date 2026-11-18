{#
    Glue silver clicks_job_application_start_stream_and_historical · Iceberg table (Glue, Silver) · Domain: Tracking
    Process stage: 14 · Lakehouse silver

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('glue_silver_clicks_job_application_start_historical') }}  -- F140 Glue silver clicks_job_application_start_historical (Historical part of the combined view)
-- depends_on: {{ ref('glue_silver_clicks_job_application_start_stream') }}  -- F141 Glue silver clicks_job_application_start_stream (Stream part of the combined view)

select 1 as placeholder
