{#
    jobs.ch (JobsSE) · MySQL (operational DB) · Domain: B2B + B2C
    Process stage: 04 · Operational platforms

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('sources', 'x28') }}  -- F003 x28
-- depends_on: {{ source('sources', 'kumo') }}  -- F006 kumo
-- depends_on: {{ ref('jobs_ch_b2b_fe') }}  -- F018 jobs.ch B2B Frontend

{#  FLAGGED TWO-WAY FLOWS: real flows into this system that are left out of the
    lineage graph, because drawing them would create a cycle (dbt rejects cycles).
    F054 Salesforce 1 -> jobs.ch (JobsSE): reverse flow F022 is drawn instead
#}

select 1 as placeholder
