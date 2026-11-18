{#
    Glue silver clicks_job_application_sent_stream_and_historical · Iceberg table (Glue, Silver) · Domain: Tracking
    Process stage: 14 · Lakehouse silver

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('glue_silver_clicks_job_application_sent_historical') }}  -- F136 Glue silver clicks_job_application_sent_historical (Historical part of the combined view)
-- depends_on: {{ ref('glue_silver_clicks_job_application_sent_stream') }}  -- F137 Glue silver clicks_job_application_sent_stream (Stream part of the combined view)

select 1 as placeholder
