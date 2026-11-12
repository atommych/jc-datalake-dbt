{% docs __overview__ %}
# Data & systems landscape

This project documents the data and systems landscape from `miro_data_sources_catalog.xlsx`. It holds no transformation logic and never loads or queries data: the `.sql` files are stubs that exist only so dbt can draw the lineage graph.

## How to read the lineage graph

Each node is one system and each edge is one row of the **Data Flows** sheet (F001–F100), except the flagged two-way flows listed below.

| dbt resource | Represents | Count |
|---|---|---|
| Source | Origin systems: send data, receive none | 10 |
| Model (stub) | Systems that receive data and pass it on | 27 |
| Exposure | End points: receive data, send none | 13 |

Each system's page lists its inbound and outbound flows with Flow ID, flow detail, whether the original table stated the flow in both rows, and any mapping note.

## Process stages

Stub models are coloured by stage in the lineage graph; sources stay green and exposures orange.

| Stage | Model colour | Systems |
|---|---|---|
| 01 · External & reference sources | — | moneyhouse, Admin UID Register, x28, kumo, Anzeigedaten, Marketing Vendor Tracking |
| 02 · Users & teams | — | Customer Service / Sales, B2C Users |
| 03 · B2B frontends | `#8e63ce` | jobs.ch B2B Frontend, jobup.ch B2B Frontend, jobscout24.ch B2B Frontend, jobcloud.ai B2B Frontend |
| 04 · Operational platforms | `#3b78e7` | jobs.ch (JobsSE), jobup, jobscout24 (JS24), marketplace (jobcloud.ai / ONE) |
| 05 · CRM & customer support | `#d81b60` | Zendesk, Salesforce 1, Salesforce 2 (Programmatic), Salesforce 3, Intercom, Aircall, PRO, Safo |
| 06 · Ad distribution & marketing | `#b8860b` | Joveo – PPP Instance, Datapool, Joveo – Marketing Instance, Partner Networks, Salesforce Marketing Cloud |
| 07 · B2C frontends & user services | `#a0522d` | unity, jobs.ch / jobup.ch B2C Frontends, Frontends (unspecified), jobcloud.ai B2C Frontend, Jobmailer, jobscout24.ch B2C Frontend, Vertical B2C Frontends |
| 08 · Tracking | `#78909c` | event.click, Application Tracker, Email Tracker, Jobtracker, nginx, Tealium, Google Analytics |
| 09 · Finance | `#00acc1` | Datendrehscheibe, Abacus |
| 10 · Data warehouse & BI | `#5c6bc0` | EaglyFly, Tableau, BigQuery |
| 11 · Shareholder reporting | — | Ringier, TX Group |

## Flagged two-way flows (cycles)

dbt does not allow cycles, so one direction of each two-way pair is left out of the graph. The direction drawn is the one confirmed by both rows of the original table; when that doesn't decide it, the one that points forward in the process sequence. Flagged flows still appear on both systems' pages and as comments in the stub SQL.

| Flagged (not drawn) | Drawn instead |
|---|---|---|
| F054 Salesforce 1 → jobs.ch (JobsSE) | F022 jobs.ch (JobsSE) → Salesforce 1 |
| F055 Salesforce 1 → jobup | F029 jobup → Salesforce 1 |
| F056 Salesforce 1 → jobscout24 (JS24) | F034 jobscout24 (JS24) → Salesforce 1 |
| F057 Salesforce 1 → marketplace (jobcloud.ai / ONE) | F039 marketplace (jobcloud.ai / ONE) → Salesforce 1 |
| F063 Salesforce 2 (Programmatic) → Joveo – PPP Instance | F068 Joveo – PPP Instance → Salesforce 2 (Programmatic) |
| F094 Datendrehscheibe → Salesforce 1 | F060 Salesforce 1 → Datendrehscheibe |
| F096 Abacus → Datendrehscheibe | F095 Datendrehscheibe → Abacus |

## Useful graph filters

Type these in the `--select` box under the lineage graph:

- `+salesforce_1+` shows everything upstream and downstream of Salesforce 1.
- `tag:stage_08` shows one process stage (here: tracking).
- `tag:entity_customer` shows every system that holds Customer data.
- `tag:domain_b2b` shows one domain.
- `tag:two_way_flow` shows the systems involved in flagged two-way flows.

{% enddocs %}
