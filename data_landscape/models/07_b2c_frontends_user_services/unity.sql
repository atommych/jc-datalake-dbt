{#
    unity · User account service · Domain: B2C
    Process stage: 07 · B2C frontends & user services

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('datapool') }}  -- F071 Datapool

select 1 as placeholder
