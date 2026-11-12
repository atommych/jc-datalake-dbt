{#
    Salesforce 2 (Programmatic) · CRM (Salesforce) · Domain: B2B
    Process stage: 05 · CRM & customer support

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('users', 'cs_sales') }}  -- F016 Customer Service / Sales
-- depends_on: {{ ref('joveo_ppp') }}  -- F068 Joveo – PPP Instance

select 1 as placeholder
