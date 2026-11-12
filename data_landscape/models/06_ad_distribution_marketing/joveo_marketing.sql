{#
    Joveo – Marketing Instance · Programmatic job ad distribution · Domain: Marketing
    Process stage: 06 · Ad distribution & marketing

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('jobs_ch') }}  -- F025 jobs.ch (JobsSE)
-- depends_on: {{ ref('marketplace') }}  -- F043 marketplace (jobcloud.ai / ONE)

select 1 as placeholder
