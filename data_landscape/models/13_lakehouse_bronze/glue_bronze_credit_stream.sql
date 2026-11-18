{#
    Glue bronze credit_stream · Iceberg table (Glue, Bronze) · Domain: B2B
    Process stage: 13 · Lakehouse bronze

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('marketplace') }}  -- F129 marketplace (jobcloud.ai / ONE) (Kafka (AVRO) marketplace.core.entity.credit)

select 1 as placeholder
