{#
    Abacus · ERP · Domain: Finance
    Process stage: 09 · Finance

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('marketplace') }}  -- F048 marketplace (jobcloud.ai / ONE)
-- depends_on: {{ ref('salesforce_1') }}  -- F061 Salesforce 1
-- depends_on: {{ ref('salesforce_2') }}  -- F064 Salesforce 2 (Programmatic)
-- depends_on: {{ ref('datendrehscheibe') }}  -- F095 Datendrehscheibe

select 1 as placeholder
