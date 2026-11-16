{#
    jobcloud.ai B2B Frontend · Web frontend · Domain: B2B
    Process stage: 03 · B2B frontends

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('users_teams', 'cs_sales') }}  -- F014 Customer Service / Sales

{#  FLAGGED TWO-WAY FLOWS: real flows into this system that are left out of the
    lineage graph, because drawing them would create a cycle (dbt rejects cycles).
    F046 marketplace (jobcloud.ai / ONE) -> jobcloud.ai B2B Frontend: reverse flow F021 is drawn instead
#}

select 1 as placeholder
