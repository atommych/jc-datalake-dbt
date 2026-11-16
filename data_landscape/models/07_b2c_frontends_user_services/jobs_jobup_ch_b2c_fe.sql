{#
    jobs.ch / jobup.ch B2C Frontends · Web / app frontend · Domain: B2C
    Process stage: 07 · B2C frontends & user services

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('users_teams', 'b2c_users') }}  -- F017 B2C Users
-- depends_on: {{ ref('datapool') }}  -- F072 Datapool
-- depends_on: {{ ref('unity') }}  -- F077 unity

select 1 as placeholder
