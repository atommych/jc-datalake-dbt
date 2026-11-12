{#
    Google Analytics · Web analytics · Domain: Tracking
    Process stage: 08 · Tracking

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('tealium') }}  -- F091 Tealium

select 1 as placeholder
