{# Hand-maintained. Source: Marketing_Analytics_Data_Landscape.md (JobCloud AG, Nov 2026).
   Not produced by scripts/generate_project.py, so regeneration leaves it alone. #}

{% docs ma_landscape %}
# Marketing Analytics data landscape

Reference for the **Marketing Analytics** (Web Tracking) space: end-to-end digital
measurement, event tracking, data layers, Customer Data Platform (CDP) operations and
marketing data pipelines. Backlog: Jira project `TEAL` (board 212).

> We make sure that every click, every action, every test and survey a user takes helps us
> know them better and make our analytics and marketing smarter.

**Works with:** Data Engineering (Eaglefly, Kafka, Databricks), Data Analytics
(Adobe, ad performance, BI) and User Research.

## Tracked platforms

| Segment | Property | Stack | Tracking |
|---|---|---|---|
| B2C | `jobs.ch` | Web (SPA/SSR) | Tealium `utag.js` via `c.jobs.ch` |
| B2C | `jobup.ch` (seekers) | Web (SPA/SSR) | Tealium `utag.js` via `c.jobup.ch` |
| B2C | `jobscout24.ch` | Web | Tealium `utag.js` via `c.jobscout24.ch` |
| B2C | Jobs and Jobup mobile apps | iOS (Swift), Android (Kotlin) | Tealium Mobile Native SDK |
| B2B | `jobcloud.ch` | Corporate / WordPress | Tealium `utag.js` via `c.jobcloud.ch` |
| B2B | `jobcloud.ai` | Web portal (React) | Tealium `utag.js` via `c.jobcloud.ai` |
| B2B | `one.jobcloud.ch` | JobCloud ONE core app | Tealium `utag.js` via `c.jobcloud.ch` |
| B2B | `jobup.ch` (employers) | Employer backend | Tealium `utag.js` via `c.jobup.ch` |

## End-to-end flow

1. **Client:** data layer (`utag.view` / `utag.link`) on web and native apps; backend and
   Kafka streams (`services.click`, `datapool.job`, ...) in parallel.
2. **Tealium iQ (TMS):** consent, privacy, `utag.js`; client-side tags (Google Ads, Meta,
   Criteo, RTB, TikTok).
3. **Tealium EventStream / AudienceStream (CDP):** real-time profiles and activation.
4. **Tealium Pub/Sub (GCP connector) to BigQuery:** Dataform transformation, attribution,
   SEO and costs; Tealium DataAccess (EventDB / AudienceDB) also feeds the warehouse.
5. **BI and analytics:** Adobe Analytics, Looker Studio, Tableau Server.
6. **Activation:** SFMC (email / journeys), Intercom (pop-ups), Joveo.
{% enddocs %}

{% docs ma_tracking_framework %}
## Tag management and event framework

**Tealium iQ.** `utag.js` loads asynchronously from dedicated subdomains with
environment paths (`/prod/`, `/dev/`). Custom templates: `uTag Loader` (UID `loader`) and
`Consent Manager - General` (UID `cmGeneral`, exposes the `utag.gdpr` API).

**Flat data layer.** Strings, numbers, booleans and arrays only; no nested objects.
Common keys: `event_name`, `event_origin`, `event_source`, `page_category_lvl1..5`,
`page_depth_level`, `page_language`, `page_referrer`, `user_id` (SHA-256 hashed email),
`user_login_id` (internal user UUID), `user_account_id` (B2B account UUID),
`user_type` (`b2c` / `b2b`) and `company_*` attributes (name, industry, location,
employees count).

**Event queue (2025/2026).** Events caused by one user action on the same page are bundled
in a single `utag.view()` / `utag.link()` call, replacing multiple calls that caused race
conditions, duplicate billing and disjointed pageviews.

- `event_queue`: array of event objects
- `event_timestamp_unix`: millisecond timestamp per event
- `event_queue_closure`: `completed`, `navigation`, `unexpected event`, `timeout`,
  `unload` or `error`
{% enddocs %}

{% docs ma_event_taxonomy %}
## Business event taxonomy

**Seeker and discovery (B2C):** `page_view`, `job_search`, `job_list_view`, `job_view`,
`job_tab_view`, `job_save` / `job_unsave`, `job_share`, `job_print`, `job_alert_setup` /
`job_alert_unsubscribe`, `salary_search` / `salary_view` / `salary_entry_sent`,
`company_search` / `company_view` / `company_list_view` / `company_follow`,
`company_review_start` / `_sent`, `interview_review_start` / `_sent`.

**Job application funnel (core B2C conversion):** `job_application_start`,
`job_application_form_interaction`, `job_application_document_upload`,
`job_application_save`, `job_application_sent` (native), `job_application_sent_external`
(redirect hand-off), `cv_optimiser_displayed` / `_complete`,
`job_match_score_displayed`, `job_match_list_view`.

**Employer and recruitment (B2B / eCommerce):** `job_ad_create_start` / `_step` /
`job_ad_publish`, `job_ad_detail_view`, `job_ad_list_view`, `job_ad_deactivated` /
`job_ad_reactivated`, `ecommerce_product_list_view`, `ecommerce_product_details_view`,
`ecommerce_cart_add` / `_remove`, `ecommerce_checkout_step`, `ecommerce_purchase`,
`ecommerce_credit_used`, `company_profile_create` / `_edit` / `_update`,
`user_company_claim` (`_verified`, `_not_verified`).

**Account lifecycle and consent:** `user_registration_start` / `user_registration`,
`user_login_start` / `user_login`, `user_account_delete`, `consent_category`,
`consent_type` (`job_fit`, `cv_optimiser`, `recommendations`, `newsletter`),
`mobile_push_consent`, `mobile_push_category_setup`, `mobile_push_category_unsubscribed`.
{% enddocs %}

{% docs ma_cdp %}
## Tealium Customer Data Hub (CDP)

- **EventStream:** central API hub that ingests client-side payloads and forwards them to
  vendors and real-time streams.
- **AudienceStream:** unified visitor profiles stitched on `user_login_id`,
  `tealium_visitor_id` and `user_id`; lifetime value, funnel drop-off milestones, segments.
- **Predict:** ML propensity scores (probability of applying, of a recruiter publishing).
- **DataAccess:** `EventStore` / `AudienceStore` (long-term semi-structured storage);
  `EventDB` / `AudienceDB` (queryable SQL store with raw event records).
- **Pub/Sub to BigQuery:** real-time events stream to Google Cloud through the
  `GCP jobcloud-tealium` connector. Backfill runbooks (space `MA`) re-sync missing
  partitions after streaming lag.
{% enddocs %}

{% docs ma_adobe %}
## Web analytics: Adobe Analytics

Three generations: **Google Analytics 3 (UA)** (sunset, legacy baseline) then
**Google Analytics 4** (parallel validation, alerts) then **Adobe Analytics** (primary).

**Solution design**

- **eVars:** persistent and session marketing dimensions (eVar48/49 internal campaigns,
  eVar50-57 eCommerce, job attributes); merchandising eVars tied to job ads and products.
- **Props:** hit-level traffic variables.
- **Events:** counter, numeric and currency events mapped to funnel stages.
- **List variables:** three configured (for example `list1` for search filters).

**Attribution.** Processing rules assign traffic to marketing channels; channels use a
30-day rolling expiration window, refreshed on non-overwriting visits.

**Monitoring.** Automated hourly/daily alerts across Adobe Analytics, GA4 and Sentry for
tag anomalies.
{% enddocs %}

{% docs ma_bigquery %}
## BigQuery and modelling pipelines

BigQuery is the marketing data lakehouse and transformation hub, in the
`jobcloud-marketing` and `jobcloud-universum` projects.

**Datasets:** `b2c_<project>` (seekers), `b2b_<project>` (recruiters, eCommerce, leads),
`transformationflow_` (staging, ETL/ELT).

**Scheduled pipelines (Dataform)**

| Pipeline | What it does |
|---|---|
| `Tealium_join_Costs` | Joins ad-network spend with Tealium EventDB events; `definitions/GROUP_CHANNELS.sqlx`; UDFs `parse_campaign_name`, `parse_url_query_params`, `URL_decode` |
| `job_performance_scoring` | Rolling 90-day `job_views`, `job_application_start` and application methods; scores feed Feedonomics |
| `job_inventory_kafka-joins-gsc` | Daily join of Google Search Console URL performance with Kafka `datapool_id` attributes |
| `SEA_dsa_feeds_v2` | S3 CSV dumps (`jcag-unity-csv-export`) to Google Ads Dynamic Search Ads feeds |
| `SEA_gnas_keywords_v2` | Converting Google/Bing search terms to keyword structures (Cloud Run + BigQuery) |
| `SEA_googleads Location Migration` | Dataset relocation to EU regions (data residency) |
| DataForSEO integration | Daily Google Search and AI Overview (LLM prompt tracking V1/V2) rankings for Swiss job keywords |

**Synergy with Data Engineering.** DENG owns Eaglefly and ingests backend changes, ATS
states, billing and Kafka click/event streams (`jobcloud.client.event.jobs.click`,
`datapool`) into Databricks (bronze / silver / gold). Marketing Analytics adds front-end
context, referral paths, UTM parameters, journey touchpoints and unauthenticated behaviour.
Join keys: `datapool_id` and `job_id` (backend jobs to client events), `user_login_id`
(OneLog authentication to CDP profiles).
{% enddocs %}

{% docs ma_channels %}
## Channel grouping and attribution

Standard grouping (Tealium / BigQuery / Eaglefly), evaluated top to bottom:

| # | Channel | Rule |
|---|---|---|
| 1 | Direct | `traffic_source = direct` and medium `(no referral)` / `(not set)` |
| 2 | Paid Search | medium `cpc\|ppc\|paidsearch\|search`, source `google\|bing`, `campaign_paid = y` or `gclid` |
| 3 | Organic Search | medium `organic\|search\|referral`, search-engine source, `campaign_paid != y` |
| 4 | Paid Social | medium `paidsocial\|social` with `campaign_paid = y` or `fbclid` |
| 5 | Organic Social | unpaid referrals from social networks |
| 6 | Affiliates | medium `affiliate\|xycm\|xxcm\|lc-web`, or source/campaign `partner\|applifly\|joveo\|-ppp` |
| 7 | Email | medium `email`, or source `automail\|newsletter` |
| 8 | Display | medium `display\|cpm\|banner`, or source `criteo\|rtbhouse\|doubleclick\|dv360` |
| 9 | Internal Referral | between JobCloud domains and `intercom.io` |
| 10 | External Referral | any other unpaid referral |
| 11 | App | source `android\|ios\|applesearch`, or campaign `appstore\|app_` |
| 12 | Other Advertising | `cpv\|cpa\|cpp\|qrcode\|syndication` |
| 13 | (other) | fallback |

**Attribution models:** session-based (last click, last non-direct click); user-based
(first click / first user click, used for B2B acquisition); data-driven with Adtriba
(historical, multi-touch).
{% enddocs %}

{% docs ma_consumers %}
## Downstream integrations and consumers

| System | Mechanism | Use cases |
|---|---|---|
| Salesforce Marketing Cloud | Tealium AudienceStream connectors | B2B: claim-company reminders, ad-creation activation, abandoned cart, freemium upsell, job-expiry surveys. B2C: recommendations, abandoned job view, journey milestones |
| Salesforce CRM (Sales Cloud) | BigQuery ETL / webhooks | Recruiter qualification, hiring alerts, ad billing status, lifecycle enrichment |
| Ad networks (Google, Meta, Criteo, RTB, TikTok, Joveo) | Tealium iQ and server-side tags | Conversion tracking (`job_application_start`, `job_application_sent`, `job_ad_create`), remarketing |
| Intercom | Tealium iQ event triggers | In-app messaging, B2B onboarding, support modals |
| MomentsIQ (surveys) | Client SDK and Adobe Analytics | Micro-surveys (registration ease, ad creation, candidate quality CSAT) |
| Feedback classification | Python / Cloud Run LLM pipeline | Classifies Zendesk tickets, MomentsIQ comments and sales feedback into themes |
| Tableau Server | BigQuery / DWH | Publication funnel, ME/SE KPIs, ad performance, salary benchmark, OneLog activity |
| Looker Studio | BigQuery direct | B2C acquisition budgets, global conversions, DataForSEO / LLM search visibility |
{% enddocs %}

{% docs ma_privacy %}
## Privacy, consent and governance

- **Regulation:** Swiss revised Data Protection Act (nFADP / revDSG) and GDPR.
- **Consent (`utag.gdpr`):** no marketing tags or tracking events fire before explicit
  consent; purposes are `essential`, `analytics`, `marketing`, `personalization`.
- **PII:** raw emails never enter the client data layer (SHA-256 hashed before
  transmission); dynamic PII masking in streaming and BigQuery ingestion.
- **Deletion:** `User Data Deletion` runbooks purge requests across Tealium CDH, GA and
  BigQuery.
{% enddocs %}

{% docs sys_adobe_analytics %}
**Adobe Analytics** · Web analytics (primary)

- **Node kind:** External service
- **Domain:** Tracking
- **Represented as:** dbt exposure, added from `Marketing_Analytics_Data_Landscape.md`
- **Source of the edge:** Tealium. The reference also shows Adobe as a consumer of the
  tracked events; check the exact feed (client-side tag vs. server-side) with Web Tracking.
{% enddocs %}

{% docs sys_marketing_analytics %}
**Marketing Analytics reference** · documentation node

Groups the tracking, CDP, BigQuery and governance reference for the Marketing Analytics
space. Its edges only indicate the systems it documents (Tealium, Google Analytics,
Tableau); they are not data flows.
{% enddocs %}
