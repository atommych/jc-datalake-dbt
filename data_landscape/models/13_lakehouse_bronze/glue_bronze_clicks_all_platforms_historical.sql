{#
    Glue bronze clicks_all_platforms_historical · Iceberg table (Glue, Bronze) · Domain: Tracking
    Process stage: 13 · Lakehouse bronze

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('lakehouse_sources', 'event_history_s3') }}  -- F125 S3 event history (deng-services-event-prod-history) (Historical click events loaded from S3 into Bronze)

select 1 as placeholder
