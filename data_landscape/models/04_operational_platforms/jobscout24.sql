{#
    jobscout24 (JS24) · SQL Server (operational DB) · Domain: B2B + B2C
    Process stage: 04 · Operational platforms

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('sources', 'x28') }}  -- F004 x28
-- depends_on: {{ source('sources', 'kumo') }}  -- F007 kumo
-- depends_on: {{ ref('js24_b2b_fe') }}  -- F020 jobscout24.ch B2B Frontend

{#  FLAGGED TWO-WAY FLOWS: real flows into this system that are left out of the
    lineage graph, because drawing them would create a cycle (dbt rejects cycles).
    F056 Salesforce 1 -> jobscout24 (JS24): reverse flow F034 is drawn instead
#}

select 1 as placeholder
