{#
    Salesforce 1 · CRM (Salesforce) · Domain: B2B
    Process stage: 05 · CRM & customer support

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('sources', 'anzeigedaten') }}  -- F009 Anzeigedaten
-- depends_on: {{ source('users', 'cs_sales') }}  -- F015 Customer Service / Sales
-- depends_on: {{ ref('jobs_ch') }}  -- F022 jobs.ch (JobsSE)
-- depends_on: {{ ref('jobup') }}  -- F029 jobup
-- depends_on: {{ ref('jobscout24') }}  -- F034 jobscout24 (JS24)
-- depends_on: {{ ref('marketplace') }}  -- F039 marketplace (jobcloud.ai / ONE)
-- depends_on: {{ source('sources', 'zendesk') }}  -- F050 Zendesk

{#  FLAGGED TWO-WAY FLOWS: real flows into this system that are left out of the
    lineage graph, because drawing them would create a cycle (dbt rejects cycles).
    F094 Datendrehscheibe -> Salesforce 1: reverse flow F060 is drawn instead
#}

select 1 as placeholder
