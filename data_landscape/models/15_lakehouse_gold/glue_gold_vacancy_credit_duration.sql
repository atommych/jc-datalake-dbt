{#
    Glue gold vacancy_credit_duration · Iceberg table (Glue, Gold) · Domain: B2B
    Process stage: 15 · Lakehouse gold

    Migrated from a Redshift query over stage_postgres (vacancy, credit_redemption
    and credit masters). Athena (Trino) SQL. Written by hand: the generator keeps
    this file (HAND_WRITTEN_MODELS in scripts/generate_project.py).

    Grain: one row per vacancy and credit product; vacancy_duration is the sum of
    redeemed days.

    ASSUMED silver columns (only glue_silver_vacancy is confirmed). Check them:
      glue_silver_credit_redemption: vacancy_id, credit_id, started_at, ended_at,
                                     stopped_at (timestamp, UTC)
      glue_silver_credit:            credit_id, product_name_en

    Differences from the Redshift query:
      - The events subquery (job_hit / job_application_start counts by vacancy) is
        dropped: it was left-joined on a unique vacancy_id and none of its columns
        were selected, so it could not change the result.
      - DATEDIFF(days, ...) counts date boundaries in Zurich time, so both
        timestamps are converted to Europe/Zurich and cast to date before
        date_diff. Redshift LEAST ignores nulls; Trino does not, hence coalesce.
      - The account filter is the var account_id, defaulting to the original value.
#}

with vacancy as (

    select
        account_id,
        vacancy_id,
        job_position as vacancy_jobposition
    from {{ ref('glue_silver_vacancy') }}

),

credit_redemption as (

    select
        vacancy_id,
        credit_id,
        date_diff(
            'day',
            cast(start_time as date),
            cast(least(coalesce(end_time, stopped_at), coalesce(stopped_at, end_time)) as date)
        ) as vacancy_duration
    from {{ ref('glue_silver_credit_redemption') }}

),

credit as (

    select
        credit_id,
        product_name_en as credit_product_name_en
    from {{ ref('glue_silver_credit') }}

)

select
    vacancy.account_id,
    vacancy.vacancy_id,
    vacancy.vacancy_jobposition,
    credit.credit_product_name_en,
    sum(credit_redemption.vacancy_duration) as vacancy_duration
from vacancy
left join credit_redemption on credit_redemption.vacancy_id = vacancy.vacancy_id
left join credit on credit.credit_id = credit_redemption.credit_id
where vacancy.account_id = '{{ var("account_id", "d137d918-612d-44ae-80f7-aa0a5ab3e16f") }}'
group by 1, 2, 3, 4
