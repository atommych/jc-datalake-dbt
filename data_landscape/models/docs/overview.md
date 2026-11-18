{% docs __overview__ %}
# Data & systems landscape

This project documents the data and systems landscape from `data_sources_standardized.xlsx`. It holds no transformation logic and never loads or queries data: the `.sql` files are stubs that exist only so dbt can draw the lineage graph.

## How to read the lineage graph

Each node is one system and each edge is one row of the **Data Flows** sheet (F001–F164), except the flagged two-way flows listed below.

| dbt resource | Represents | Count |
|---|---|---|
| Source | Origin systems: send data, receive none | 13 |
| Model (stub) | Systems that receive data and pass it on | 61 |
| Exposure | End points: receive data, send none | 11 |

Each system's page lists its inbound and outbound flows with Flow ID, flow detail, whether the original table stated the flow in both rows, and any mapping note.

## Process stages

Stub models are coloured by stage in the lineage graph; sources stay green and exposures orange.

| Stage | Model colour | Systems |
|---|---|---|
| 01 · External & reference sources | — | moneyhouse, Admin UID Register, kumo, Anzeigedaten, Marketing Vendor Tracking |
| 02 · Users & teams | — | Customer Service / Sales, B2C Users |
| 03 · B2B frontends | `#5fb825` | jobs.ch B2B Frontend, jobup.ch B2B Frontend, jobscout24.ch B2B Frontend, jobcloud.ai B2B Frontend |
| 04 · Operational platforms | `#3b78e7` | jobs.ch (JobsSE), jobup, jobscout24 (JS24), marketplace (jobcloud.ai / ONE) |
| 05 · CRM & customer support | `#d81b60` | Zendesk, Salesforce, Intercom, Aircall |
| 06 · Ad distribution & marketing | `#b8860b` | PRO, Datapool, Partner Networks, Salesforce Marketing Cloud |
| 07 · B2C frontends & user services | `#5fb825` | unity, jobs.ch / jobup.ch B2C Frontends, Frontends (unspecified), Jobmailer, jobscout24.ch B2C Frontend, Vertical B2C Frontends |
| 08 · Tracking | `#78909c` | event.click, Application Tracker, Email Tracker, Jobtracker, nginx, Tealium, Google Analytics |
| 09 · Finance | `#00acc1` | Datendrehscheibe, Abacus |
| 10 · Data warehouse & BI | `#5c6bc0` | EagleFly, Tableau, BigQuery |
| 11 · Shareholder reporting | — | Ringier, TX Group |
| 12 · Lakehouse sources | — | MongoDB raw-ppp-job-ads, MongoDB organic clicks collection, MongoDB sponsored clicks collection, MongoDB ml-driven-pacing collection, S3 event history (deng-services-event-prod-history) |
| 13 · Lakehouse bronze | `#8d6e63` | Bronze raw_ppp_job_ads, Bronze tracking_organic_clicks, Bronze tracking_sponsored_clicks, Bronze ml_driven_pacing, Glue bronze clicks_all_platforms_historical, Glue bronze clicks_all_platforms_stream, Glue bronze company_stream, Glue bronze job_stream, Glue bronze credit_stream, Glue bronze credit_redemption_stream, Glue bronze vacancy_stream |
| 14 · Lakehouse silver | `#9e9e9e` | Silver tracking_organic_clicks, Silver ppp_job_ads, Silver tracking_sponsored_clicks, Silver ml_driven_pacing_forecasts, Glue silver clicks_all_platforms_historical, Glue silver clicks_job_application_sent_historical, Glue silver clicks_job_application_sent_stream, Glue silver clicks_job_application_start_historical, Glue silver clicks_job_application_start_stream, Glue silver clicks_job_hit_historical, Glue silver clicks_job_hit_stream, Glue silver clicks_all_platforms_stream_and_historical, Glue silver clicks_job_application_sent_stream_and_historical, Glue silver clicks_job_application_start_stream_and_historical, Glue silver clicks_job_hit_stream_and_historical, Glue silver company, Glue silver job, Glue silver credit, Glue silver credit_redemption, Glue silver vacancy |
| 15 · Lakehouse gold | `#f9a825` | Gold organic_clicks_hourly_by_segment, Gold sponsored_clicks_hourly_by_segment, Gold organic_clicks_hourly, Gold pacing_forecast_vs_actuals_hourly, Glue gold vacancy_credit_duration |
| 16 · Lakehouse query access | — | Amazon Athena (pro-ds-lakehouse workgroup) |

## Flagged two-way flows (cycles)

dbt does not allow cycles, so one direction of each two-way pair is left out of the graph. The direction drawn is the one confirmed by both rows of the original table; when that doesn't decide it, the one that points forward in the process sequence. Flagged flows still appear on both systems' pages and as comments in the stub SQL.

| Flagged (not drawn) | Drawn instead | Stated in (flagged / drawn) |
|---|---|---|
| F041 marketplace (jobcloud.ai / ONE) → PRO | F074 PRO → marketplace (jobcloud.ai / ONE) | One row / Both |
| F046 marketplace (jobcloud.ai / ONE) → jobcloud.ai B2B Frontend | F021 jobcloud.ai B2B Frontend → marketplace (jobcloud.ai / ONE) | One row / One row |
| F054 Salesforce → jobs.ch (JobsSE) | F022 jobs.ch (JobsSE) → Salesforce | One row / Both |
| F055 Salesforce → jobup | F029 jobup → Salesforce | One row / Both |
| F056 Salesforce → jobscout24 (JS24) | F034 jobscout24 (JS24) → Salesforce | One row / Both |
| F057 Salesforce → marketplace (jobcloud.ai / ONE) | F039 marketplace (jobcloud.ai / ONE) → Salesforce | One row / Both |
| F063 Salesforce → PRO | F068 PRO → Salesforce | One row / Both |
| F094 Datendrehscheibe → Salesforce | F060 Salesforce → Datendrehscheibe | One row / One row |
| F096 Abacus → Datendrehscheibe | F095 Datendrehscheibe → Abacus | One row / Both |

## Useful graph filters

Type these in the `--select` box under the lineage graph:

- `+salesforce_1+` shows everything upstream and downstream of Salesforce 1.
- `tag:entity_customer` shows every system that holds Customer data.
- `tag:two_way_flow` shows the systems involved in flagged two-way flows.

## Open assumptions from standardization

| Flows | Assumption |
|---|---|

{% enddocs %}
