{#
    Application Tracker · Tracking stream · Domain: Tracking
    Process stage: 08 · Tracking

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('b2c_fe_jobs_jobup') }}  -- F079 jobs.ch / jobup.ch B2C Frontends (App / Web)

select 1 as placeholder
