{#
    Silver ppp_job_ads · Iceberg table (Silver, dimension) · Domain: Data Lakehouse
    Process stage: 14 · Lakehouse silver

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ ref('bronze_raw_ppp_job_ads') }}  -- F105 Bronze raw_ppp_job_ads (Latest partition, dedup by jobAdId on last_updated; CREATE OR REPLACE)

select 1 as placeholder
