{#
    jobscout24.ch B2B Frontend · Web frontend · Domain: B2B
    Process stage: 03 · B2B frontends

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('users', 'cs_sales') }}  -- F013 Customer Service / Sales

select 1 as placeholder
