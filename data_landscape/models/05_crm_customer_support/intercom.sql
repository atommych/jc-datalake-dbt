{#
    Intercom · Customer messaging · Domain: Support
    Process stage: 05 · CRM & customer support

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('sources', 'zendesk') }}  -- F052 Zendesk

select 1 as placeholder
