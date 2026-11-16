{#
    Tableau · BI tool · Domain: Analytics & BI
    Process stage: 10 · Data warehouse & BI

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('eaglefly') }}  -- F098 EagleFly

select 1 as placeholder
