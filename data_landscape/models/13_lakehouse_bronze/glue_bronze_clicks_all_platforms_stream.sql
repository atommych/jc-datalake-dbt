{#
    Glue bronze clicks_all_platforms_stream · Iceberg table (Glue, Bronze) · Domain: Tracking
    Process stage: 13 · Lakehouse bronze

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('event_click') }}  -- F126 event.click (Kafka (AVRO) services cluster: jobs, jobup and jobscout24 click topics)

select 1 as placeholder
