{#
    EagleFly · Data warehouse · Domain: Analytics & BI
    Process stage: 10 · Data warehouse & BI

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('jobs_se_ch_b2b') }}  -- F028 jobs.ch (JobsSE) (daily revenue)
-- depends_on: {{ ref('jobup_ch_b2b') }}  -- F033 jobup (daily revenue)
-- depends_on: {{ ref('jobscout24') }}  -- F038 jobscout24 (JS24) (daily revenue)
-- depends_on: {{ ref('marketplace') }}  -- F049 marketplace (jobcloud.ai / ONE) (daily revenue)
-- depends_on: {{ ref('salesforce') }}  -- F062 Salesforce (order intake)
-- depends_on: {{ ref('application_tracker') }}  -- F086 Application Tracker (f_ad_applications)
-- depends_on: {{ ref('jobtracker') }}  -- F089 Jobtracker (f_ad_hits)
-- depends_on: {{ ref('abacus') }}  -- F097 Abacus (bookings / final revenue)

select 1 as placeholder
