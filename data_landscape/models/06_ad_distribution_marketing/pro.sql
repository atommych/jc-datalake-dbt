{#
    PRO · Schema / system (not described) · Domain: Unknown
    Process stage: 06 · Ad distribution & marketing

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('jobup_ch_b2b') }}  -- F030 jobup

{#  FLAGGED TWO-WAY FLOWS: real flows into this system that are left out of the
    lineage graph, because drawing them would create a cycle (dbt rejects cycles).
    F041 marketplace (jobcloud.ai / ONE) -> PRO: reverse flow F074 is drawn instead
    F063 Salesforce -> PRO: reverse flow F068 is drawn instead
#}

select 1 as placeholder
