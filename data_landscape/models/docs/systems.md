{% docs sys_moneyhouse %}
**moneyhouse** · External company register

- **Node kind:** External source
- **Domain:** Reference Data
- **Process stage:** 01 · External & reference sources
- **Represented as:** dbt source (origin system: sends data, receives none)
- **Also written as:** —
- **Core entities:** Company (Company data)
- **Metrics / KPIs:** —

**Notes:** Dashed (optional/manual) link.

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F001 | marketplace (jobcloud.ai / ONE) |  | Both | Yes |  |

{% enddocs %}

{% docs sys_admin_uid %}
**Admin UID Register** · Swiss company UID register

- **Node kind:** External source
- **Domain:** Reference Data
- **Process stage:** 01 · External & reference sources
- **Represented as:** dbt source (origin system: sends data, receives none)
- **Also written as:** admin UID register
- **Core entities:** Company (Company ID)
- **Metrics / KPIs:** —

**Notes:** Dashed link.

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F002 | marketplace (jobcloud.ai / ONE) |  | Both | Yes |  |

{% enddocs %}

{% docs sys_kumo %}
**kumo** · Crawler

- **Node kind:** System
- **Domain:** Integration
- **Process stage:** 01 · External & reference sources
- **Represented as:** dbt source (origin system: sends data, receives none)
- **Also written as:** kumo (crawlers), kumo crawler
- **Core entities:** Ad
- **Metrics / KPIs:** —

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F008 | Datapool |  | Both | Yes |  |

{% enddocs %}

{% docs sys_anzeigedaten %}
**Anzeigedaten** · Ad data feed

- **Node kind:** Data feed
- **Domain:** B2B
- **Process stage:** 01 · External & reference sources
- **Represented as:** dbt source (origin system: sends data, receives none)
- **Also written as:** —
- **Core entities:** Ad
- **Metrics / KPIs:** —

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F009 | Salesforce |  | Both | Yes |  |

{% enddocs %}

{% docs sys_mkt_vendor_tracking %}
**Marketing Vendor Tracking** · External tracking

- **Node kind:** External source
- **Domain:** Marketing
- **Process stage:** 01 · External & reference sources
- **Represented as:** dbt source (origin system: sends data, receives none)
- **Also written as:** marketing vendor tracking
- **Core entities:** —
- **Metrics / KPIs:** —

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F010 | BigQuery |  | Both | Yes |  |

{% enddocs %}

{% docs sys_cs_sales %}
**Customer Service / Sales** · Internal team

- **Node kind:** People / team
- **Domain:** Support / Sales
- **Process stage:** 02 · Users & teams
- **Represented as:** dbt source (origin system: sends data, receives none)
- **Also written as:** Customer Service/Sales
- **Core entities:** Customer, Opportunity, Order
- **Metrics / KPIs:** —

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F011 | jobs.ch B2B Frontend |  | One row | Yes |  |
| F012 | jobup.ch B2B Frontend |  | One row | Yes |  |
| F013 | jobscout24.ch B2B Frontend |  | One row | Yes |  |
| F014 | jobcloud.ai B2B Frontend |  | One row | Yes |  |
| F015 | Salesforce |  | Both | Yes |  |

{% enddocs %}

{% docs sys_b2c_users %}
**B2C Users** · End users (job seekers)

- **Node kind:** People / team
- **Domain:** B2C
- **Process stage:** 02 · Users & teams
- **Represented as:** dbt source (origin system: sends data, receives none)
- **Also written as:** Customers, Users
- **Core entities:** User
- **Metrics / KPIs:** —

**Notes:** Row was named "Customers" (core entity User); renamed to avoid clash with B2B Customer entity. Also referenced as "Users".

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F017 | jobs.ch / jobup.ch B2C Frontends |  | Both | Yes |  |

{% enddocs %}

{% docs sys_jobs_se_ch_b2b_fe %}
**jobs.ch B2B Frontend** · Web frontend

- **Node kind:** Frontend
- **Domain:** B2B
- **Process stage:** 03 · B2B frontends
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F011 | Customer Service / Sales |  | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F018 | jobs.ch (JobsSE) |  | Both | Yes |  |

{% enddocs %}

{% docs sys_jobup_ch_b2b_fe %}
**jobup.ch B2B Frontend** · Web frontend

- **Node kind:** Frontend
- **Domain:** B2B
- **Process stage:** 03 · B2B frontends
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F012 | Customer Service / Sales |  | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F019 | jobup |  | Both | Yes |  |

{% enddocs %}

{% docs sys_js24_b2b_fe %}
**jobscout24.ch B2B Frontend** · Web frontend

- **Node kind:** Frontend
- **Domain:** B2B
- **Process stage:** 03 · B2B frontends
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

**Notes:** Added: referenced in flows but had no row of its own.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F013 | Customer Service / Sales |  | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F020 | jobscout24 (JS24) |  | One row | Yes |  |

{% enddocs %}

{% docs sys_jobcloud_b2b_fe %}
**jobcloud.ai B2B Frontend** · Web frontend

- **Node kind:** Frontend
- **Domain:** B2B
- **Process stage:** 03 · B2B frontends
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

**Notes:** Added: referenced in flows but had no row of its own.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F014 | Customer Service / Sales |  | One row | Yes |  |
| F046 | marketplace (jobcloud.ai / ONE) |  | One row | ⚠️ No: two-way flow, F021 drawn instead |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F021 | marketplace (jobcloud.ai / ONE) |  | One row | Yes |  |

{% enddocs %}

{% docs sys_jobs_se_ch_b2b %}
**jobs.ch (JobsSE)** · MySQL (operational DB)

- **Node kind:** System
- **Domain:** B2B + B2C
- **Process stage:** 04 · Operational platforms
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** jobs.ch, jobs.ch / JobsSE (jobsse), JobsSE, jobsse
- **Core entities:** Ad, Ad Product, Customer, Order
- **Metrics / KPIs:** Credit Consumption, Credits

**Notes:** Called 'jobs.ch' in the B2B/B2C map and 'jobsse' in the landscape.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F018 | jobs.ch B2B Frontend |  | Both | Yes |  |
| F054 | Salesforce |  | One row | ⚠️ No: two-way flow, F022 drawn instead |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F022 | Salesforce |  | Both | Yes |  |
| F024 | Datapool |  | Both | Yes |  |
| F026 | Partner Networks |  | Both | Yes |  |
| F027 | Jobmailer |  | Both | Yes |  |
| F028 | EagleFly | daily revenue | Both | Yes |  |

{% enddocs %}

{% docs sys_jobup_ch_b2b %}
**jobup** · MySQL (operational DB)

- **Node kind:** System
- **Domain:** B2B + B2C
- **Process stage:** 04 · Operational platforms
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** Jobup, jobup (MySQL)
- **Core entities:** Ad, Ad Product, Customer, Order
- **Metrics / KPIs:** Credit Consumption, Credits

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F019 | jobup.ch B2B Frontend |  | Both | Yes |  |
| F055 | Salesforce |  | One row | ⚠️ No: two-way flow, F029 drawn instead |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F029 | Salesforce |  | Both | Yes |  |
| F030 | PRO |  | Both | Yes |  |
| F031 | Datapool |  | Both | Yes |  |
| F032 | Jobmailer |  | Both | Yes |  |
| F033 | EagleFly | daily revenue | Both | Yes |  |

{% enddocs %}

{% docs sys_jobscout24 %}
**jobscout24 (JS24)** · SQL Server (operational DB)

- **Node kind:** System
- **Domain:** B2B + B2C
- **Process stage:** 04 · Operational platforms
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** jobscout24, JS24
- **Core entities:** Ad, Ad Product, Customer, Order
- **Metrics / KPIs:** Ad Views, Applications, Users

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F020 | jobscout24.ch B2B Frontend |  | One row | Yes |  |
| F056 | Salesforce |  | One row | ⚠️ No: two-way flow, F034 drawn instead |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F034 | Salesforce |  | Both | Yes |  |
| F035 | Datapool |  | Both | Yes |  |
| F036 | Salesforce Marketing Cloud |  | Both | Yes |  |
| F037 | jobscout24.ch B2C Frontend |  | One row | Yes |  |
| F038 | EagleFly | daily revenue | Both | Yes |  |

{% enddocs %}

{% docs sys_marketplace %}
**marketplace (jobcloud.ai / ONE)** · Kafka-based platform

- **Node kind:** System
- **Domain:** B2B
- **Process stage:** 04 · Operational platforms
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** Marketplace, marketplace, marketplace (jobcloud.ai, aka ONE), marketplace_adapter_salesforce, marketplace_core
- **Core entities:** Ad, Ad Product, Customer, Order
- **Metrics / KPIs:** Active Customers, Registered Customers

**Notes:** Schemas in ER diagram: marketplace_core, marketplace_ecommerce, marketplace_ats, marketplace_adapter_salesforce.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F001 | moneyhouse |  | Both | Yes |  |
| F002 | Admin UID Register |  | Both | Yes |  |
| F021 | jobcloud.ai B2B Frontend |  | One row | Yes |  |
| F057 | Salesforce |  | One row | ⚠️ No: two-way flow, F039 drawn instead |  |
| F074 | PRO |  | Both | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F039 | Salesforce |  | Both | Yes |  |
| F041 | PRO | schema: marketplace_core | One row | ⚠️ No: two-way flow, F074 drawn instead |  |
| F042 | Datapool |  | Both | Yes |  |
| F044 | Partner Networks |  | One row | Yes |  |
| F045 | Salesforce Marketing Cloud |  | One row | Yes |  |
| F046 | jobcloud.ai B2B Frontend |  | One row | ⚠️ No: two-way flow, F021 drawn instead |  |
| F047 | Tealium |  | One row | Yes |  |
| F048 | Abacus |  | One row | Yes |  |
| F049 | EagleFly | daily revenue | Both | Yes |  |

{% enddocs %}

{% docs sys_zendesk %}
**Zendesk** · Customer support

- **Node kind:** External service
- **Domain:** Support
- **Process stage:** 05 · CRM & customer support
- **Represented as:** dbt source (origin system: sends data, receives none)
- **Also written as:** —
- **Core entities:** Ticket
- **Metrics / KPIs:** —

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F050 | Salesforce |  | Both | Yes |  |
| F051 | Aircall |  | Both | Yes |  |
| F052 | Intercom |  | Both | Yes |  |

{% enddocs %}

{% docs sys_salesforce %}
**Salesforce** · CRM (Salesforce)

- **Node kind:** System
- **Domain:** B2B
- **Process stage:** 05 · CRM & customer support
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** Salesforce 1, Salesforce 2, Salesforce 3, Safo, Safo / Safo1
- **Core entities:** Customer, Opportunity, Order
- **Metrics / KPIs:** New New Customers, Order Intake, Orders Placed

**Notes:** Main CRM. Opportunity has the largest record count in the lineage view.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F009 | Anzeigedaten |  | Both | Yes |  |
| F015 | Customer Service / Sales |  | Both | Yes |  |
| F022 | jobs.ch (JobsSE) |  | Both | Yes |  |
| F029 | jobup |  | Both | Yes |  |
| F034 | jobscout24 (JS24) |  | Both | Yes |  |
| F039 | marketplace (jobcloud.ai / ONE) |  | Both | Yes |  |
| F050 | Zendesk |  | Both | Yes |  |
| F068 | PRO |  | Both | Yes |  |
| F094 | Datendrehscheibe |  | One row | ⚠️ No: two-way flow, F060 drawn instead |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F054 | jobs.ch (JobsSE) |  | One row | ⚠️ No: two-way flow, F022 drawn instead |  |
| F055 | jobup |  | One row | ⚠️ No: two-way flow, F029 drawn instead |  |
| F056 | jobscout24 (JS24) |  | One row | ⚠️ No: two-way flow, F034 drawn instead |  |
| F057 | marketplace (jobcloud.ai / ONE) |  | One row | ⚠️ No: two-way flow, F039 drawn instead |  |
| F058 | Aircall |  | Both | Yes |  |
| F059 | Salesforce Marketing Cloud |  | Both | Yes |  |
| F060 | Datendrehscheibe |  | One row | Yes |  |
| F061 | Abacus |  | Both | Yes |  |
| F062 | EagleFly | order intake | Both | Yes |  |
| F063 | PRO |  | One row | ⚠️ No: two-way flow, F068 drawn instead |  |

{% enddocs %}

{% docs sys_intercom %}
**Intercom** · Customer messaging

- **Node kind:** External service
- **Domain:** Support
- **Process stage:** 05 · CRM & customer support
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** Conversation
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F052 | Zendesk |  | Both | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F067 | Frontends (unspecified) | label: 'to frontend' | One row | Yes |  |

{% enddocs %}

{% docs sys_aircall %}
**Aircall** · Telephony

- **Node kind:** System
- **Domain:** Support / Sales
- **Process stage:** 05 · CRM & customer support
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** —
- **Core entities:** Call
- **Metrics / KPIs:** —

**Notes:** Label partly illegible in export; assumed Aircall.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F051 | Zendesk |  | Both | Yes |  |
| F058 | Salesforce |  | Both | Yes |  |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_pro %}
**PRO** · Schema / system (not described)

- **Node kind:** System
- **Domain:** Unknown
- **Process stage:** 06 · Ad distribution & marketing
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** Joveo, Joveo PPP instance, Joveo – PPP Instance, Joveo Marketing, Joveo Marketing instance, Joveo – Marketing Instance
- **Core entities:** —
- **Metrics / KPIs:** —

**Notes:** Core entities in source: 2 tables (see ER diagram).

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F030 | jobup |  | Both | Yes |  |
| F041 | marketplace (jobcloud.ai / ONE) | schema: marketplace_core | One row | ⚠️ No: two-way flow, F074 drawn instead |  |
| F063 | Salesforce |  | One row | ⚠️ No: two-way flow, F068 drawn instead |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F068 | Salesforce |  | Both | Yes |  |
| F069 | Datapool |  | Both | Yes |  |
| F074 | marketplace (jobcloud.ai / ONE) |  | Both | Yes |  |
| F076 | Partner Networks |  | Both | Yes |  |

{% enddocs %}

{% docs sys_datapool %}
**Datapool** · Kafka (central ad stream)

- **Node kind:** Data stream
- **Domain:** Integration
- **Process stage:** 06 · Ad distribution & marketing
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** Ad, Customer
- **Metrics / KPIs:** Ads Ended, Ads Online, Ads Started

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F008 | kumo |  | Both | Yes |  |
| F024 | jobs.ch (JobsSE) |  | Both | Yes |  |
| F031 | jobup |  | Both | Yes |  |
| F035 | jobscout24 (JS24) |  | Both | Yes |  |
| F042 | marketplace (jobcloud.ai / ONE) |  | Both | Yes |  |
| F069 | PRO |  | Both | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F070 | Partner Networks |  | Both | Yes |  |
| F071 | unity |  | Both | Yes |  |
| F072 | jobs.ch / jobup.ch B2C Frontends |  | One row | Yes |  |
| F073 | jobscout24.ch B2C Frontend |  | One row | Yes |  |
| F075 | Vertical B2C Frontends |  | One row | Yes |  |

{% enddocs %}

{% docs sys_partner_networks %}
**Partner Networks** · External distribution

- **Node kind:** External service
- **Domain:** B2C
- **Process stage:** 06 · Ad distribution & marketing
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** Partner networks
- **Core entities:** Ad
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F026 | jobs.ch (JobsSE) |  | Both | Yes |  |
| F044 | marketplace (jobcloud.ai / ONE) |  | One row | Yes |  |
| F070 | Datapool |  | Both | Yes |  |
| F076 | PRO |  | Both | Yes |  |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_sfmc %}
**Salesforce Marketing Cloud** · Marketing automation

- **Node kind:** External service
- **Domain:** Marketing
- **Process stage:** 06 · Ad distribution & marketing
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F036 | jobscout24 (JS24) |  | Both | Yes |  |
| F045 | marketplace (jobcloud.ai / ONE) |  | One row | Yes |  |
| F059 | Salesforce |  | Both | Yes |  |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_unity %}
**unity** · User account service

- **Node kind:** System
- **Domain:** B2C
- **Process stage:** 07 · B2C frontends & user services
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** User
- **Metrics / KPIs:** New Users, Users

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F071 | Datapool |  | Both | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F077 | jobs.ch / jobup.ch B2C Frontends |  | One row | Yes |  |

{% enddocs %}

{% docs sys_jobs_jobup_ch_b2c_fe %}
**jobs.ch / jobup.ch B2C Frontends** · Web / app frontend

- **Node kind:** Frontend
- **Domain:** B2C
- **Process stage:** 07 · B2C frontends & user services
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** All B2C frontends, B2C frontends (jobs.ch/jobup.ch), B2C frontends (jobs.ch/jobup.ch) App / Web, Frontends, jobs.ch & jobup.ch B2C frontends, jobs.ch / jobup.ch B2C frontends
- **Core entities:** User Behaviour Event
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F017 | B2C Users |  | Both | Yes |  |
| F072 | Datapool |  | One row | Yes |  |
| F077 | unity |  | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F078 | event.click |  | Both | Yes |  |
| F079 | Application Tracker | App / Web | One row | Yes |  |
| F080 | Email Tracker |  | One row | Yes |  |
| F081 | Jobtracker |  | One row | Yes |  |
| F082 | nginx |  | One row | Yes |  |
| F083 | Tealium |  | Both | Yes |  |

{% enddocs %}

{% docs sys_frontends_unspec %}
**Frontends (unspecified)** · Web / app frontend

- **Node kind:** Frontend
- **Domain:** Unknown
- **Process stage:** 07 · B2C frontends & user services
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** Frontends ('to frontend')
- **Core entities:** —
- **Metrics / KPIs:** —

**Notes:** Added: referenced in flows but had no row of its own.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F067 | Intercom | label: 'to frontend' | One row | Yes |  |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_jobmailer %}
**Jobmailer** · AWS SES email service

- **Node kind:** System
- **Domain:** B2C
- **Process stage:** 07 · B2C frontends & user services
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** Jobmailer (AWS SES)
- **Core entities:** Subscription
- **Metrics / KPIs:** Jobmail Bounces, Jobmails Opened, Jobmails Sent, New Subscriptions, Subscriptions

**Notes:** Metric labels are small in the export; verify spelling.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F027 | jobs.ch (JobsSE) |  | Both | Yes |  |
| F032 | jobup |  | Both | Yes |  |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_js24_b2c_fe %}
**jobscout24.ch B2C Frontend** · Web / app frontend

- **Node kind:** Frontend
- **Domain:** B2C
- **Process stage:** 07 · B2C frontends & user services
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** jobscout24.ch frontend
- **Core entities:** —
- **Metrics / KPIs:** —

**Notes:** Added: referenced in flows but had no row of its own.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F037 | jobscout24 (JS24) |  | One row | Yes |  |
| F073 | Datapool |  | One row | Yes |  |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_vertical_fe %}
**Vertical B2C Frontends** · Web / app frontend

- **Node kind:** Frontend
- **Domain:** B2C
- **Process stage:** 07 · B2C frontends & user services
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

**Notes:** Added: referenced in flows but had no row of its own.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F075 | Datapool |  | One row | Yes |  |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_event_click %}
**event.click** · Kafka tracking stream

- **Node kind:** Data stream
- **Domain:** Tracking
- **Process stage:** 08 · Tracking
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** click event / event.click, event.click (Kafka)
- **Core entities:** User Behaviour Event
- **Metrics / KPIs:** Events

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F078 | jobs.ch / jobup.ch B2C Frontends |  | Both | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F084 | Tealium |  | One row | Yes |  |

{% enddocs %}

{% docs sys_application_tracker %}
**Application Tracker** · Tracking stream

- **Node kind:** Data stream
- **Domain:** Tracking
- **Process stage:** 08 · Tracking
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** application tracker
- **Core entities:** Ad, Application, User
- **Metrics / KPIs:** Applications Sent, Applications Started

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F079 | jobs.ch / jobup.ch B2C Frontends | App / Web | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F085 | Tealium |  | Both | Yes |  |
| F086 | EagleFly | f_ad_applications | One row | Yes |  |

{% enddocs %}

{% docs sys_email_tracker %}
**Email Tracker** · Tracking stream

- **Node kind:** Data stream
- **Domain:** Tracking
- **Process stage:** 08 · Tracking
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** email tracker
- **Core entities:** Email, User
- **Metrics / KPIs:** Emails Opened

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F080 | jobs.ch / jobup.ch B2C Frontends |  | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F087 | Tealium |  | Both | Yes |  |

{% enddocs %}

{% docs sys_jobtracker %}
**Jobtracker** · Tracking stream

- **Node kind:** Data stream
- **Domain:** Tracking
- **Process stage:** 08 · Tracking
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** jobtracker
- **Core entities:** Ad, User
- **Metrics / KPIs:** Ad Views

**Notes:** Source of unity_jobtracker_* columns in f_ad_hits.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F081 | jobs.ch / jobup.ch B2C Frontends |  | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F088 | Tealium |  | Both | Yes |  |
| F089 | EagleFly | f_ad_hits | One row | Yes |  |

{% enddocs %}

{% docs sys_nginx %}
**nginx** · Web server logs

- **Node kind:** Data stream
- **Domain:** Tracking
- **Process stage:** 08 · Tracking
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** User
- **Metrics / KPIs:** Active Users, Deleted Users, User Logins

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F082 | jobs.ch / jobup.ch B2C Frontends |  | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F090 | Tealium |  | One row | Yes |  |

{% enddocs %}

{% docs sys_tealium %}
**Tealium** · Tag management / CDP

- **Node kind:** External service
- **Domain:** Tracking
- **Process stage:** 08 · Tracking
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** Session, User
- **Metrics / KPIs:** Applications, Sessions, User Logins, Users

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F047 | marketplace (jobcloud.ai / ONE) |  | One row | Yes |  |
| F083 | jobs.ch / jobup.ch B2C Frontends |  | Both | Yes |  |
| F084 | event.click |  | One row | Yes |  |
| F085 | Application Tracker |  | Both | Yes |  |
| F087 | Email Tracker |  | Both | Yes |  |
| F088 | Jobtracker |  | Both | Yes |  |
| F090 | nginx |  | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F091 | Google Analytics |  | Both | Yes |  |
| F092 | BigQuery |  | Both | Yes |  |

{% enddocs %}

{% docs sys_google_analytics %}
**Google Analytics** · Web analytics

- **Node kind:** External service
- **Domain:** Tracking
- **Process stage:** 08 · Tracking
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F091 | Tealium |  | Both | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F093 | BigQuery |  | Both | Yes |  |

{% enddocs %}

{% docs sys_datendrehscheibe %}
**Datendrehscheibe** · Integration hub / data exchange

- **Node kind:** System
- **Domain:** Integration
- **Process stage:** 09 · Finance
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

**Notes:** Bidirectional link between Abacus and Salesforce 1.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F060 | Salesforce |  | One row | Yes |  |
| F096 | Abacus |  | One row | ⚠️ No: two-way flow, F095 drawn instead |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F094 | Salesforce |  | One row | ⚠️ No: two-way flow, F060 drawn instead |  |
| F095 | Abacus |  | Both | Yes |  |

{% enddocs %}

{% docs sys_abacus %}
**Abacus** · ERP

- **Node kind:** System
- **Domain:** Finance
- **Process stage:** 09 · Finance
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** Bill, Cost Center, Customer, Employee
- **Metrics / KPIs:** Costs, EBITDA, FTE, Headcount, New New Customers, Revenue

**Notes:** Bookings remapped to Ringier / TX Group by account and cost center in EagleFly.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F048 | marketplace (jobcloud.ai / ONE) |  | One row | Yes |  |
| F061 | Salesforce |  | Both | Yes |  |
| F095 | Datendrehscheibe |  | Both | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F096 | Datendrehscheibe |  | One row | ⚠️ No: two-way flow, F095 drawn instead |  |
| F097 | EagleFly | bookings / final revenue | Both | Yes |  |

{% enddocs %}

{% docs sys_eaglefly %}
**EagleFly** · Data warehouse

- **Node kind:** System
- **Domain:** Analytics & BI
- **Process stage:** 10 · Data warehouse & BI
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** DWH (f_ad_applications), DWH (f_ad_hits), EagleFly (daily revenue), EagleFly (order intake), EagleFly DWH (bookings / final revenue)
- **Core entities:** Ad (Unified model (star schema)), Booking, Order, Revenue
- **Metrics / KPIs:** Calculated Daily Revenue, Final Revenue, Order Intake

**Notes:** Name as written on board. Likely hosts the 'Ad unified' star schema. Also referenced as "EagleFly DWH" and "DWH".

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F028 | jobs.ch (JobsSE) | daily revenue | Both | Yes |  |
| F033 | jobup | daily revenue | Both | Yes |  |
| F038 | jobscout24 (JS24) | daily revenue | Both | Yes |  |
| F049 | marketplace (jobcloud.ai / ONE) | daily revenue | Both | Yes |  |
| F062 | Salesforce | order intake | Both | Yes |  |
| F086 | Application Tracker | f_ad_applications | One row | Yes |  |
| F089 | Jobtracker | f_ad_hits | One row | Yes |  |
| F097 | Abacus | bookings / final revenue | Both | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F098 | Tableau |  | Both | Yes |  |

{% enddocs %}

{% docs sys_tableau %}
**Tableau** · BI tool

- **Node kind:** System
- **Domain:** Analytics & BI
- **Process stage:** 10 · Data warehouse & BI
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

**Notes:** Dashboard referenced: tableau.jobcloud.ch/#/views/Marketplacecorechecks/Sheet2

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F098 | EagleFly |  | Both | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F099 | TX Group |  | Both | Yes |  |
| F100 | Ringier |  | Both | Yes |  |

{% enddocs %}

{% docs sys_bigquery %}
**BigQuery** · Cloud data warehouse

- **Node kind:** System
- **Domain:** Analytics & BI
- **Process stage:** 10 · Data warehouse & BI
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F010 | Marketing Vendor Tracking |  | Both | Yes |  |
| F092 | Tealium |  | Both | Yes |  |
| F093 | Google Analytics |  | Both | Yes |  |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_ringier %}
**Ringier** · Shareholder reporting recipient

- **Node kind:** Organisation
- **Domain:** Reporting
- **Process stage:** 11 · Shareholder reporting
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F100 | Tableau |  | Both | Yes |  |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_tx_group %}
**TX Group** · Shareholder reporting recipient

- **Node kind:** Organisation
- **Domain:** Reporting
- **Process stage:** 11 · Shareholder reporting
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F099 | Tableau |  | Both | Yes |  |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_mongo_ppp_job_ads %}
**MongoDB raw-ppp-job-ads** · MongoDB collection (mutable reference data)

- **Node kind:** System
- **Domain:** B2B + B2C
- **Process stage:** 12 · Lakehouse sources (MongoDB)
- **Represented as:** dbt source (origin system: sends data, receives none)
- **Also written as:** —
- **Core entities:** jobAdId, category, location, publisherId, last_updated
- **Metrics / KPIs:** —

**Notes:** ~1 M documents, mutated in place; ingested as a daily full snapshot.

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F101 | Bronze raw_ppp_job_ads | Daily full snapshot (Glue, 5-field projection); overwrite of the ingestion_date partition | One row | Yes |  |

{% enddocs %}

{% docs sys_mongo_tracking_organic_clicks %}
**MongoDB organic clicks collection** · MongoDB collection (append-only events)

- **Node kind:** Data stream
- **Domain:** Tracking
- **Process stage:** 12 · Lakehouse sources (MongoDB)
- **Represented as:** dbt source (origin system: sends data, receives none)
- **Also written as:** —
- **Core entities:** _id, agencyId, bidType, campaignId, classificationType, clientId, country, deviceType, eventCost, eventDate, eventTimestamp, isBot, jobAdId, jobGroupId, jx, jz, last_updated, migration_batch, publisherId, refNumber, trackingEventId
- **Metrics / KPIs:** —

**Notes:** ~100 M documents across both click collections (~140 GB); watermark-incremental ingestion.

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F102 | Bronze tracking_organic_clicks | Watermark incremental: max(event_timestamp) minus 3 days up to end of yesterday; 21-field allowlist applied server-side (ip excluded) | One row | Yes |  |

{% enddocs %}

{% docs sys_mongo_tracking_sponsored_clicks %}
**MongoDB sponsored clicks collection** · MongoDB collection (append-only events)

- **Node kind:** Data stream
- **Domain:** Tracking
- **Process stage:** 12 · Lakehouse sources (MongoDB)
- **Represented as:** dbt source (origin system: sends data, receives none)
- **Also written as:** —
- **Core entities:** _id, agencyId, bidType, campaignId, classificationType, clientId, country, deviceType, eventCost, eventDate, eventTimestamp, isBot, jobAdId, jobGroupId, jx, jz, last_updated, migration_batch, publisherId, refNumber, trackingEventId
- **Metrics / KPIs:** —

**Notes:** Same shape as the organic collection.

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F103 | Bronze tracking_sponsored_clicks | Watermark incremental: max(event_timestamp) minus 3 days up to end of yesterday; 21-field allowlist applied server-side (ip excluded) | One row | Yes |  |

{% enddocs %}

{% docs sys_mongo_ml_driven_pacing %}
**MongoDB ml-driven-pacing collection** · MongoDB collection (ML forecast export)

- **Node kind:** System
- **Domain:** Data Science & AI
- **Process stage:** 12 · Lakehouse sources (MongoDB)
- **Represented as:** dbt source (origin system: sends data, receives none)
- **Also written as:** —
- **Core entities:** _id, mlflow_id, _updatedTS, schemaVersion, target, validFrom, validTo, keyId, jobCategory, jobCity, publisher, weights
- **Metrics / KPIs:** —

**Notes:** One document per (keyId, validFrom, validTo); exporter-owned.

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F104 | Bronze ml_driven_pacing | Daily snapshot of the forecast collection | One row | Yes |  |

{% enddocs %}

{% docs sys_bronze_raw_ppp_job_ads %}
**Bronze raw_ppp_job_ads** · Parquet table (Bronze, 7-day retention)

- **Node kind:** System
- **Domain:** Data Lakehouse
- **Process stage:** 13 · Lakehouse bronze
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** jobAdId, category, location, publisherId, last_updated, ingestion_date
- **Metrics / KPIs:** —

**Notes:** Database pro_ds_lakehouse_bronze. Partitioned by ingestion_date. Not exposed to Data Science.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F101 | MongoDB raw-ppp-job-ads | Daily full snapshot (Glue, 5-field projection); overwrite of the ingestion_date partition | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F105 | Silver ppp_job_ads | Latest partition, dedup by jobAdId on last_updated; CREATE OR REPLACE | One row | Yes |  |

{% enddocs %}

{% docs sys_bronze_tracking_organic_clicks %}
**Bronze tracking_organic_clicks** · Parquet table (Bronze, 7-day retention)

- **Node kind:** System
- **Domain:** Data Lakehouse
- **Process stage:** 13 · Lakehouse bronze
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** _id, agencyId, bidType, campaignId, classificationType, clientId, country, deviceType, eventCost, eventDate, eventTimestamp, isBot, jobAdId, jobGroupId, jx, jz, last_updated, migration_batch, publisherId, refNumber, trackingEventId, event_date, ingested_at
- **Metrics / KPIs:** —

**Notes:** Database pro_ds_lakehouse_bronze. Partitioned by event_date. PII (ip) filtered at source.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F102 | MongoDB organic clicks collection | Watermark incremental: max(event_timestamp) minus 3 days up to end of yesterday; 21-field allowlist applied server-side (ip excluded) | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F106 | Silver tracking_organic_clicks | Latest ingested_at batch merged on event_id; snake_case rename, ObjectId normalised | One row | Yes |  |

{% enddocs %}

{% docs sys_bronze_tracking_sponsored_clicks %}
**Bronze tracking_sponsored_clicks** · Parquet table (Bronze, 7-day retention)

- **Node kind:** System
- **Domain:** Data Lakehouse
- **Process stage:** 13 · Lakehouse bronze
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** _id, agencyId, bidType, campaignId, classificationType, clientId, country, deviceType, eventCost, eventDate, eventTimestamp, isBot, jobAdId, jobGroupId, jx, jz, last_updated, migration_batch, publisherId, refNumber, trackingEventId, event_date, ingested_at
- **Metrics / KPIs:** —

**Notes:** Database pro_ds_lakehouse_bronze. Partitioned by event_date. PII (ip) filtered at source.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F103 | MongoDB sponsored clicks collection | Watermark incremental: max(event_timestamp) minus 3 days up to end of yesterday; 21-field allowlist applied server-side (ip excluded) | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F107 | Silver tracking_sponsored_clicks | Latest ingested_at batch merged on event_id; snake_case rename, ObjectId normalised | One row | Yes |  |

{% enddocs %}

{% docs sys_bronze_ml_driven_pacing %}
**Bronze ml_driven_pacing** · Parquet table (Bronze, 7-day retention)

- **Node kind:** System
- **Domain:** Data Science & AI
- **Process stage:** 13 · Lakehouse bronze
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** _id, mlflow_id, _updatedTS, schemaVersion, target, validFrom, validTo, keyId, jobCategory, jobCity, publisher, weights, ingestion_date
- **Metrics / KPIs:** —

**Notes:** Database pro_ds_lakehouse_bronze. Partitioned by ingestion_date; weights is a nested array.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F104 | MongoDB ml-driven-pacing collection | Daily snapshot of the forecast collection | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F108 | Silver ml_driven_pacing_forecasts | Explode weights to one row per (forecast_doc_id, key_id, ts_hour) | One row | Yes |  |

{% enddocs %}

{% docs sys_silver_tracking_organic_clicks %}
**Silver tracking_organic_clicks** · Iceberg table (Silver, fact)

- **Node kind:** System
- **Domain:** Data Lakehouse
- **Process stage:** 14 · Lakehouse silver
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** event_id (Merge key), agency_id, bid_type, campaign_id, classification_type, client_id, country_code (Upper-cased), device_type (Lower-cased), event_cost, event_date, event_timestamp (Partition column and watermark), is_bot (Not filtered), job_ad_id, job_group_id, jx, jz, source_updated_at, migration_batch, publisher_id, ref_number, tracking_event_id, processed_at
- **Metrics / KPIs:** —

**Notes:** Database pro_ds_lakehouse_silver. One row per click, MERGE on event_id; partitioned by days(event_timestamp). Durable layer.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F106 | Bronze tracking_organic_clicks | Latest ingested_at batch merged on event_id; snake_case rename, ObjectId normalised | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F109 | Gold organic_clicks_hourly_by_segment | Filter by agency, hourly aggregation, is_bot kept as grouping column | One row | Yes |  |
| F113 | Gold organic_clicks_hourly | Single-source hourly aggregation, no dimension join | One row | Yes |  |
| F122 | Amazon Athena (pro-ds-lakehouse workgroup) | Queried by Data Science via the pro-ds-lakehouse workgroup | One row | Yes |  |

{% enddocs %}

{% docs sys_silver_ppp_job_ads %}
**Silver ppp_job_ads** · Iceberg table (Silver, dimension)

- **Node kind:** System
- **Domain:** Data Lakehouse
- **Process stage:** 14 · Lakehouse silver
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** job_ad_id (Join key; unique), job_category (Raw), job_city (Raw free text), processed_at
- **Metrics / KPIs:** —

**Notes:** Database pro_ds_lakehouse_silver. One row per job ad, rebuilt daily.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F105 | Bronze raw_ppp_job_ads | Latest partition, dedup by jobAdId on last_updated; CREATE OR REPLACE | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F110 | Gold organic_clicks_hourly_by_segment | Broadcast left join on job_ad_id for job_category / job_city | One row | Yes |  |
| F112 | Gold sponsored_clicks_hourly_by_segment | Broadcast left join on job_ad_id for job_category / job_city | One row | Yes |  |
| F121 | Amazon Athena (pro-ds-lakehouse workgroup) | Queried by Data Science via the pro-ds-lakehouse workgroup | One row | Yes |  |

{% enddocs %}

{% docs sys_silver_tracking_sponsored_clicks %}
**Silver tracking_sponsored_clicks** · Iceberg table (Silver, fact)

- **Node kind:** System
- **Domain:** Data Lakehouse
- **Process stage:** 14 · Lakehouse silver
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** event_id (Merge key), agency_id, bid_type, campaign_id, classification_type, client_id, country_code (Upper-cased), device_type (Lower-cased), event_cost, event_date, event_timestamp (Partition column and watermark), is_bot (Not filtered), job_ad_id, job_group_id, jx, jz, source_updated_at, migration_batch, publisher_id, ref_number, tracking_event_id, processed_at
- **Metrics / KPIs:** —

**Notes:** Database pro_ds_lakehouse_silver. Same schema as the organic table.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F107 | Bronze tracking_sponsored_clicks | Latest ingested_at batch merged on event_id; snake_case rename, ObjectId normalised | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F111 | Gold sponsored_clicks_hourly_by_segment | Filter by agency, hourly aggregation, is_bot kept as grouping column | One row | Yes |  |
| F123 | Amazon Athena (pro-ds-lakehouse workgroup) | Queried by Data Science via the pro-ds-lakehouse workgroup | One row | Yes |  |

{% enddocs %}

{% docs sys_silver_ml_driven_pacing_forecasts %}
**Silver ml_driven_pacing_forecasts** · Iceberg table (Silver)

- **Node kind:** System
- **Domain:** Data Science & AI
- **Process stage:** 14 · Lakehouse silver
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** forecast_doc_id (Identity), mlflow_id (Nullable), published_at (Nullable), key_id (CATEGORY|City|Publisher), ts_hour (Partition column), target (organic_clicks or total_clicks; always filter), valid_from, valid_to, schema_version (Do not rely on it), job_category, job_city, publisher_id, weight (Sums to 1.0 over 168 h), clicks_forecast
- **Metrics / KPIs:** —

**Notes:** Database pro_ds_lakehouse_silver. One row per (forecast_doc_id, key_id, ts_hour); a mirror, not an archive.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F108 | Bronze ml_driven_pacing | Explode weights to one row per (forecast_doc_id, key_id, ts_hour) | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F114 | Gold pacing_forecast_vs_actuals_hourly | Newest forecast per (key_id, ts_hour), compared per tier | One row | Yes |  |
| F124 | Amazon Athena (pro-ds-lakehouse workgroup) | Queried by Data Science via the pro-ds-lakehouse workgroup | One row | Yes |  |

{% enddocs %}

{% docs sys_gold_organic_clicks_hourly_by_segment %}
**Gold organic_clicks_hourly_by_segment** · Iceberg table (Gold)

- **Node kind:** System
- **Domain:** Data Lakehouse
- **Process stage:** 15 · Lakehouse gold
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** click_date, click_hour, job_category, job_city, publisher_id, is_bot (Grain, not a filter), organic_clicks, total_click_cost, aggregated_at
- **Metrics / KPIs:** Organic clicks, Total click cost

**Notes:** Database pro_ds_lakehouse_gold. Agency jobcloudProdClientFacing. Grain includes is_bot.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F109 | Silver tracking_organic_clicks | Filter by agency, hourly aggregation, is_bot kept as grouping column | One row | Yes |  |
| F110 | Silver ppp_job_ads | Broadcast left join on job_ad_id for job_category / job_city | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F115 | Gold pacing_forecast_vs_actuals_hourly | Actuals collapsed over is_bot, full outer join to forecast per tier | One row | Yes |  |
| F117 | Amazon Athena (pro-ds-lakehouse workgroup) | Queried by Data Science / BI via the pro-ds-lakehouse workgroup | One row | Yes |  |

{% enddocs %}

{% docs sys_gold_sponsored_clicks_hourly_by_segment %}
**Gold sponsored_clicks_hourly_by_segment** · Iceberg table (Gold)

- **Node kind:** System
- **Domain:** Data Lakehouse
- **Process stage:** 15 · Lakehouse gold
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** click_date, click_hour, job_category, job_city, publisher_id, is_bot (Grain, not a filter), sponsored_clicks, total_click_cost, aggregated_at
- **Metrics / KPIs:** Sponsored clicks, Total click cost

**Notes:** Database pro_ds_lakehouse_gold. Agency jobcloudProdPackage. Grain includes is_bot.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F111 | Silver tracking_sponsored_clicks | Filter by agency, hourly aggregation, is_bot kept as grouping column | One row | Yes |  |
| F112 | Silver ppp_job_ads | Broadcast left join on job_ad_id for job_category / job_city | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F116 | Gold pacing_forecast_vs_actuals_hourly | Actuals collapsed over is_bot, full outer join to forecast per tier | One row | Yes |  |
| F118 | Amazon Athena (pro-ds-lakehouse workgroup) | Queried by Data Science / BI via the pro-ds-lakehouse workgroup | One row | Yes |  |

{% enddocs %}

{% docs sys_gold_organic_clicks_hourly %}
**Gold organic_clicks_hourly** · Iceberg table (Gold)

- **Node kind:** System
- **Domain:** Data Lakehouse
- **Process stage:** 15 · Lakehouse gold
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** click_date, click_hour, agency_id, bid_type, classification_type, country_code, device_type, publisher_id, is_bot, total_clicks, processed_at
- **Metrics / KPIs:** Total clicks

**Notes:** Database pro_ds_lakehouse_gold. Single-source worked example carried over from staging.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F113 | Silver tracking_organic_clicks | Single-source hourly aggregation, no dimension join | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F119 | Amazon Athena (pro-ds-lakehouse workgroup) | Queried by Data Science / BI via the pro-ds-lakehouse workgroup | One row | Yes |  |

{% enddocs %}

{% docs sys_gold_pacing_forecast_vs_actuals_hourly %}
**Gold pacing_forecast_vs_actuals_hourly** · Iceberg table (Gold)

- **Node kind:** System
- **Domain:** Data Science & AI
- **Process stage:** 15 · Lakehouse gold
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** click_date, click_hour, tier (1, 2 or 3; always filter), job_category, job_city, publisher_id, key_id, forecast_doc_id, clicks_forecast, weight, actual_organic_clicks, actual_sponsored_clicks, actual_total_clicks, actual_bot_clicks (Already included in actual_total_clicks), total_click_cost, match_type (Forecast, actuals or both)
- **Metrics / KPIs:** Forecast clicks, Actual total clicks

**Notes:** Database pro_ds_lakehouse_gold. Always filter on tier (1-3); tiers are nested aggregates.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F114 | Silver ml_driven_pacing_forecasts | Newest forecast per (key_id, ts_hour), compared per tier | One row | Yes |  |
| F115 | Gold organic_clicks_hourly_by_segment | Actuals collapsed over is_bot, full outer join to forecast per tier | One row | Yes |  |
| F116 | Gold sponsored_clicks_hourly_by_segment | Actuals collapsed over is_bot, full outer join to forecast per tier | One row | Yes |  |

#### Sends data to

| Flow | To | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F120 | Amazon Athena (pro-ds-lakehouse workgroup) | Queried by Data Science / BI via the pro-ds-lakehouse workgroup | One row | Yes |  |

{% enddocs %}

{% docs sys_athena_pro_ds_lakehouse %}
**Amazon Athena (pro-ds-lakehouse workgroup)** · Query engine (10 GB scan cap per query)

- **Node kind:** System
- **Domain:** Data Lakehouse
- **Process stage:** 16 · Lakehouse query access
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

**Notes:** Silver and Gold are exposed to Data Science; Bronze is not.

#### Receives data from

| Flow | From | Detail | Stated in | In lineage graph | Note |
|---|---|---|---|---|---|
| F117 | Gold organic_clicks_hourly_by_segment | Queried by Data Science / BI via the pro-ds-lakehouse workgroup | One row | Yes |  |
| F118 | Gold sponsored_clicks_hourly_by_segment | Queried by Data Science / BI via the pro-ds-lakehouse workgroup | One row | Yes |  |
| F119 | Gold organic_clicks_hourly | Queried by Data Science / BI via the pro-ds-lakehouse workgroup | One row | Yes |  |
| F120 | Gold pacing_forecast_vs_actuals_hourly | Queried by Data Science / BI via the pro-ds-lakehouse workgroup | One row | Yes |  |
| F121 | Silver ppp_job_ads | Queried by Data Science via the pro-ds-lakehouse workgroup | One row | Yes |  |
| F122 | Silver tracking_organic_clicks | Queried by Data Science via the pro-ds-lakehouse workgroup | One row | Yes |  |
| F123 | Silver tracking_sponsored_clicks | Queried by Data Science via the pro-ds-lakehouse workgroup | One row | Yes |  |
| F124 | Silver ml_driven_pacing_forecasts | Queried by Data Science via the pro-ds-lakehouse workgroup | One row | Yes |  |

#### Sends data to

_None._

{% enddocs %}
