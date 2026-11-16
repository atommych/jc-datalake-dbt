{#
    Tealium · Tag management / CDP · Domain: Tracking
    Process stage: 08 · Tracking

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('marketplace') }}  -- F047 marketplace (jobcloud.ai / ONE)
-- depends_on: {{ ref('jobs_jobup_ch_b2c_fe') }}  -- F083 jobs.ch / jobup.ch B2C Frontends
-- depends_on: {{ ref('event_click') }}  -- F084 event.click
-- depends_on: {{ ref('application_tracker') }}  -- F085 Application Tracker
-- depends_on: {{ ref('email_tracker') }}  -- F087 Email Tracker
-- depends_on: {{ ref('jobtracker') }}  -- F088 Jobtracker
-- depends_on: {{ ref('nginx') }}  -- F090 nginx

select 1 as placeholder
