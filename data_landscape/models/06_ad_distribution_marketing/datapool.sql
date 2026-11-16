{#
    Datapool · Kafka (central ad stream) · Domain: Integration
    Process stage: 06 · Ad distribution & marketing

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('sources', 'kumo') }}  -- F008 kumo
-- depends_on: {{ ref('jobs_se_ch_b2b') }}  -- F024 jobs.ch (JobsSE)
-- depends_on: {{ ref('jobup_ch_b2b') }}  -- F031 jobup
-- depends_on: {{ ref('jobscout24') }}  -- F035 jobscout24 (JS24)
-- depends_on: {{ ref('marketplace') }}  -- F042 marketplace (jobcloud.ai / ONE)
-- depends_on: {{ ref('pro') }}  -- F069 PRO

select 1 as placeholder
