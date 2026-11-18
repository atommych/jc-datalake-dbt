{#
    Glue silver vacancy · Iceberg table (Glue, Silver) · Domain: B2B
    Process stage: 14 · Lakehouse silver

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('glue_bronze_vacancy_stream') }}  -- F151 Glue bronze vacancy_stream (Current-state entity built with AUTO CDC from Bronze)

select 1 as placeholder
