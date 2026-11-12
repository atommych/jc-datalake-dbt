{#
    marketplace (jobcloud.ai / ONE) · Kafka-based platform · Domain: B2B
    Process stage: 04 · Operational platforms

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('sources', 'moneyhouse') }}  -- F001 moneyhouse
-- depends_on: {{ source('sources', 'admin_uid') }}  -- F002 Admin UID Register
-- depends_on: {{ ref('jobcloud_b2b_fe') }}  -- F021 jobcloud.ai B2B Frontend

{#  FLAGGED TWO-WAY FLOWS: real flows into this system that are left out of the
    lineage graph, because drawing them would create a cycle (dbt rejects cycles).
    F057 Salesforce 1 -> marketplace (jobcloud.ai / ONE): reverse flow F039 is drawn instead
#}

select 1 as placeholder
