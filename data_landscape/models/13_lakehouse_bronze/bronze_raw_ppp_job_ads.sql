{#
    Bronze raw_ppp_job_ads · Parquet table (Bronze, 7-day retention) · Domain: Data Lakehouse
    Process stage: 13 · Lakehouse bronze

    Stub model for documentation only. It holds no transformation logic and is
    never run against real data. Each depends_on line below is one inbound flow
    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.
#}

-- depends_on: {{ source('lakehouse_sources', 'mongo_ppp_job_ads') }}  -- F101 MongoDB raw-ppp-job-ads (Daily full snapshot (Glue, 5-field projection); overwrite of the ingestion_date partition)

select 1 as placeholder
