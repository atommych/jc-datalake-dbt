{#
    Glue silver clicks_all_platforms_stream_and_historical · Iceberg table (Glue, Silver) · Domain: Tracking
    Process stage: 14 · Lakehouse silver

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('glue_bronze_clicks_all_platforms_stream') }}  -- F133 Glue bronze clicks_all_platforms_stream (Streaming clicks unioned with history (stream table not catalogued in Glue; assumed read from Bronze))
-- depends_on: {{ ref('glue_silver_clicks_all_platforms_historical') }}  -- F146 Glue silver clicks_all_platforms_historical (Historical part of the combined view)

select 1 as placeholder
