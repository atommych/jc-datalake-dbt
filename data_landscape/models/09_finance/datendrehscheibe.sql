{#
    Datendrehscheibe · Integration hub / data exchange · Domain: Integration
    Process stage: 09 · Finance

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('salesforce') }}  -- F060 Salesforce

{#  FLAGGED TWO-WAY FLOWS: real flows into this system that are left out of the
    lineage graph, because drawing them would create a cycle (dbt rejects cycles).
    F096 Abacus -> Datendrehscheibe: reverse flow F095 is drawn instead
#}

select 1 as placeholder
