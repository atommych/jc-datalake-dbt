{% docs sys_moneyhouse %}
**moneyhouse** · External company register

- **Node kind:** External source
- **Domain:** Reference Data
- **Process stage:** 01 · External & reference sources
- **Represented as:** dbt source 
- **Also written as:** —
- **Core entities:** Company (Company data)
- **Metrics / KPIs:** —

**Notes:** Dashed (optional/manual) link.

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F001 | marketplace (jobcloud.ai / ONE) |  | Yes |  |

{% enddocs %}

{% docs sys_admin_uid %}
**Admin UID Register** · Swiss company UID register

- **Node kind:** External source
- **Domain:** Reference Data
- **Process stage:** 01 · External & reference sources
- **Represented as:** dbt source 
- **Also written as:** admin UID register
- **Core entities:** Company (Company ID)
- **Metrics / KPIs:** —

**Notes:** Dashed link.

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F002 | marketplace (jobcloud.ai / ONE) |  | Yes |  |

{% enddocs %}

{% docs sys_x28 %}
**x28** · External job data provider

- **Node kind:** External source
- **Domain:** Integration
- **Process stage:** 01 · External & reference sources
- **Represented as:** dbt source 
- **Also written as:** —
- **Core entities:** Ad
- **Metrics / KPIs:** —

**Notes:** Shown in red in landscape.

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F003 | jobs.ch (JobsSE) |  | Yes |  |
| F004 | jobscout24 (JS24) |  | Yes |  |
| F005 | Datapool |  | Yes |  |

{% enddocs %}

{% docs sys_kumo %}
**kumo** · Crawler

- **Node kind:** System
- **Domain:** Integration
- **Process stage:** 01 · External & reference sources
- **Represented as:** dbt source 
- **Also written as:** kumo (crawlers), kumo crawler
- **Core entities:** Ad
- **Metrics / KPIs:** —

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F006 | jobs.ch (JobsSE) |  | Yes |  |
| F007 | jobscout24 (JS24) |  | Yes |  |
| F008 | Datapool |  | Yes |  |

{% enddocs %}

{% docs sys_anzeigedaten %}
**Anzeigedaten** · Ad data feed

- **Node kind:** Data feed
- **Domain:** B2B
- **Process stage:** 01 · External & reference sources
- **Represented as:** dbt source 
- **Also written as:** —
- **Core entities:** Ad
- **Metrics / KPIs:** —

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F009 | Salesforce 1 |  | Yes |  |

{% enddocs %}

{% docs sys_mkt_vendor_tracking %}
**Marketing Vendor Tracking** · External tracking

- **Node kind:** External source
- **Domain:** Marketing
- **Process stage:** 01 · External & reference sources
- **Represented as:** dbt source 
- **Also written as:** marketing vendor tracking
- **Core entities:** —
- **Metrics / KPIs:** —

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F010 | BigQuery |  | Yes |  |

{% enddocs %}

{% docs sys_cs_sales %}
**Customer Service / Sales** · Internal team

- **Node kind:** People / team
- **Domain:** Support / Sales
- **Process stage:** 02 · Users & teams
- **Represented as:** dbt source 
- **Also written as:** Customer Service/Sales
- **Core entities:** Customer, Opportunity, Order
- **Metrics / KPIs:** —

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F011 | jobs.ch B2B Frontend |  | Yes | Generic "B2B frontends" expanded to all four known B2B frontends (inferred) |
| F012 | jobup.ch B2B Frontend |  | Yes | Generic "B2B frontends" expanded to all four known B2B frontends (inferred) |
| F013 | jobscout24.ch B2B Frontend |  | Yes | Generic "B2B frontends" expanded to all four known B2B frontends (inferred) |
| F014 | jobcloud.ai B2B Frontend |  | Yes | Generic "B2B frontends" expanded to all four known B2B frontends (inferred) |
| F015 | Salesforce 1 |  | Yes |  |
| F016 | Salesforce 2 (Programmatic) |  | Yes |  |

{% enddocs %}

{% docs sys_b2c_users %}
**B2C Users** · End users (job seekers)

- **Node kind:** People / team
- **Domain:** B2C
- **Process stage:** 02 · Users & teams
- **Represented as:** dbt source 
- **Also written as:** Customers, Users
- **Core entities:** User
- **Metrics / KPIs:** —

**Notes:** Row was named "Customers" (core entity User); renamed to avoid clash with B2B Customer entity. Also referenced as "Users".

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F017 | jobs.ch / jobup.ch B2C Frontends |  | Yes | "Users" and "Customers" (core entity User) treated as the same B2C end-user actor |

{% enddocs %}

{% docs sys_jobs_ch_b2b_fe %}
**jobs.ch B2B Frontend** · Web frontend

- **Node kind:** Frontend
- **Domain:** B2B
- **Process stage:** 03 · B2B frontends
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F011 | Customer Service / Sales |  | Yes | Generic "B2B frontends" expanded to all four known B2B frontends (inferred) |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F018 | jobs.ch (JobsSE) |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F012 | Customer Service / Sales |  | Yes | Generic "B2B frontends" expanded to all four known B2B frontends (inferred) |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F019 | jobup |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F013 | Customer Service / Sales |  | Yes | Generic "B2B frontends" expanded to all four known B2B frontends (inferred) |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F020 | jobscout24 (JS24) |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F014 | Customer Service / Sales |  | Yes | Generic "B2B frontends" expanded to all four known B2B frontends (inferred) |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F021 | marketplace (jobcloud.ai / ONE) |  | Yes |  |

{% enddocs %}

{% docs sys_jobs_ch %}
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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F003 | x28 |  | Yes |  |
| F006 | kumo |  | Yes |  |
| F018 | jobs.ch B2B Frontend |  | Yes |  |
| F054 | Salesforce 1 |  | ⚠️ No: two-way flow, F022 drawn instead |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F022 | Salesforce 1 |  | Yes |  |
| F023 | Joveo – PPP Instance |  | Yes | List shorthand expanded |
| F024 | Datapool |  | Yes |  |
| F025 | Joveo – Marketing Instance |  | Yes | List shorthand expanded |
| F026 | Partner Networks |  | Yes |  |
| F027 | Jobmailer |  | Yes |  |
| F028 | EaglyFly | daily revenue | Yes |  |

{% enddocs %}

{% docs sys_jobup %}
**jobup** · MySQL (operational DB)

- **Node kind:** System
- **Domain:** B2B + B2C
- **Process stage:** 04 · Operational platforms
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** Jobup, jobup (MySQL)
- **Core entities:** Ad, Ad Product, Customer, Order
- **Metrics / KPIs:** Credit Consumption, Credits

#### Receives data from

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F019 | jobup.ch B2B Frontend |  | Yes |  |
| F055 | Salesforce 1 |  | ⚠️ No: two-way flow, F029 drawn instead |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F029 | Salesforce 1 |  | Yes |  |
| F030 | Joveo – PPP Instance |  | Yes |  |
| F031 | Datapool |  | Yes |  |
| F032 | Jobmailer |  | Yes |  |
| F033 | EaglyFly | daily revenue | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F004 | x28 |  | Yes |  |
| F007 | kumo |  | Yes |  |
| F020 | jobscout24.ch B2B Frontend |  | Yes |  |
| F056 | Salesforce 1 |  | ⚠️ No: two-way flow, F034 drawn instead |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F034 | Salesforce 1 |  | Yes |  |
| F035 | Datapool |  | Yes |  |
| F036 | Salesforce Marketing Cloud |  | Yes |  |
| F037 | jobscout24.ch B2C Frontend |  | Yes | Assumed B2C frontend (Datapool also feeds jobscout24.ch B2C) |
| F038 | EaglyFly | daily revenue | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F001 | moneyhouse |  | Yes |  |
| F002 | Admin UID Register |  | Yes |  |
| F021 | jobcloud.ai B2B Frontend |  | Yes |  |
| F057 | Salesforce 1 |  | ⚠️ No: two-way flow, F039 drawn instead |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F039 | Salesforce 1 |  | Yes |  |
| F040 | Safo | schema: marketplace_adapter_salesforce | Yes | Schema name mapped to its system |
| F041 | PRO | schema: marketplace_core | Yes | Schema name mapped to its system |
| F042 | Datapool |  | Yes |  |
| F043 | Joveo – Marketing Instance |  | Yes |  |
| F044 | Partner Networks |  | Yes |  |
| F045 | Salesforce Marketing Cloud |  | Yes |  |
| F046 | jobcloud.ai B2C Frontend |  | Yes | Assumed B2C frontend (Datapool also feeds jobcloud.ai B2C); could be the B2B frontend — verify |
| F047 | Tealium |  | Yes |  |
| F048 | Abacus |  | Yes |  |
| F049 | EaglyFly | daily revenue | Yes |  |

{% enddocs %}

{% docs sys_zendesk %}
**Zendesk** · Customer support

- **Node kind:** External service
- **Domain:** Support
- **Process stage:** 05 · CRM & customer support
- **Represented as:** dbt source 
- **Also written as:** —
- **Core entities:** Ticket
- **Metrics / KPIs:** —

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F050 | Salesforce 1 |  | Yes |  |
| F051 | Aircall |  | Yes |  |
| F052 | Intercom |  | Yes |  |
| F053 | Safo | label: 'also to Safo' | Yes |  |

{% enddocs %}

{% docs sys_salesforce_1 %}
**Salesforce 1** · CRM (Salesforce)

- **Node kind:** System
- **Domain:** B2B
- **Process stage:** 05 · CRM & customer support
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** —
- **Core entities:** Customer, Opportunity, Order
- **Metrics / KPIs:** New New Customers, Order Intake, Orders Placed

**Notes:** Main CRM. Opportunity has the largest record count in the lineage view.

#### Receives data from

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F009 | Anzeigedaten |  | Yes |  |
| F015 | Customer Service / Sales |  | Yes |  |
| F022 | jobs.ch (JobsSE) |  | Yes |  |
| F029 | jobup |  | Yes |  |
| F034 | jobscout24 (JS24) |  | Yes |  |
| F039 | marketplace (jobcloud.ai / ONE) |  | Yes |  |
| F050 | Zendesk |  | Yes |  |
| F094 | Datendrehscheibe |  | ⚠️ No: two-way flow, F060 drawn instead |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F054 | jobs.ch (JobsSE) |  | ⚠️ No: two-way flow, F022 drawn instead |  |
| F055 | jobup |  | ⚠️ No: two-way flow, F029 drawn instead |  |
| F056 | jobscout24 (JS24) |  | ⚠️ No: two-way flow, F034 drawn instead |  |
| F057 | marketplace (jobcloud.ai / ONE) |  | ⚠️ No: two-way flow, F039 drawn instead |  |
| F058 | Aircall |  | Yes |  |
| F059 | Salesforce Marketing Cloud |  | Yes |  |
| F060 | Datendrehscheibe |  | Yes |  |
| F061 | Abacus |  | Yes |  |
| F062 | EaglyFly | order intake | Yes | List shorthand expanded |

{% enddocs %}

{% docs sys_salesforce_2 %}
**Salesforce 2 (Programmatic)** · CRM (Salesforce)

- **Node kind:** System
- **Domain:** B2B
- **Process stage:** 05 · CRM & customer support
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** Salesforce 2
- **Core entities:** Customer, Opportunity, Order
- **Metrics / KPIs:** New New Customers, Order Intake, Orders Placed

**Notes:** Opportunity is used as framework contract; Order 'should be Opportunity' per lineage slide.

#### Receives data from

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F016 | Customer Service / Sales |  | Yes |  |
| F068 | Joveo – PPP Instance |  | Yes | Generic "Joveo" resolved to PPP instance (the only Joveo instance that sends to this system) |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F063 | Joveo – PPP Instance |  | ⚠️ No: two-way flow, F068 drawn instead |  |
| F064 | Abacus |  | Yes |  |
| F065 | EaglyFly | order intake | Yes | List shorthand expanded |

{% enddocs %}

{% docs sys_salesforce_3 %}
**Salesforce 3** · CRM (Salesforce)

- **Node kind:** System
- **Domain:** B2B
- **Process stage:** 05 · CRM & customer support
- **Represented as:** dbt source 
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** Order Intake

**Notes:** Only named in the finance flow ('Salesforce 1, 2 & 3'). Core entities not shown in source.

#### Receives data from

_None._

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F066 | EaglyFly |  | Yes | List shorthand expanded |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F052 | Zendesk |  | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F067 | Frontends (unspecified) | label: 'to frontend' | Yes | Target frontend not specified; verify |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F051 | Zendesk |  | Yes |  |
| F058 | Salesforce 1 |  | Yes |  |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_pro %}
**PRO** · Schema / system (not described)

- **Node kind:** System
- **Domain:** Unknown
- **Process stage:** 05 · CRM & customer support
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** —
- **Core entities:** —
- **Metrics / KPIs:** —

**Notes:** Core entities in source: 2 tables (see ER diagram).

#### Receives data from

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F041 | marketplace (jobcloud.ai / ONE) | schema: marketplace_core | Yes | Schema name mapped to its system |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_safo %}
**Safo** · System (not described)

- **Node kind:** System
- **Domain:** Unknown
- **Process stage:** 05 · CRM & customer support
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** Safo ('also to Safo'), Safo / Safo1
- **Core entities:** —
- **Metrics / KPIs:** —

**Notes:** Linked by 'quantity > 0' join conditions in the ER diagram. Core entities in source: 1 table (see ER diagram).

#### Receives data from

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F040 | marketplace (jobcloud.ai / ONE) | schema: marketplace_adapter_salesforce | Yes | Schema name mapped to its system |
| F053 | Zendesk | label: 'also to Safo' | Yes |  |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_joveo_ppp %}
**Joveo – PPP Instance** · Programmatic job ad distribution

- **Node kind:** External service
- **Domain:** B2B
- **Process stage:** 06 · Ad distribution & marketing
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** Joveo, Joveo PPP instance, Joveo – PPP instance
- **Core entities:** —
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F023 | jobs.ch (JobsSE) |  | Yes | List shorthand expanded |
| F030 | jobup |  | Yes |  |
| F063 | Salesforce 2 (Programmatic) |  | ⚠️ No: two-way flow, F068 drawn instead |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F068 | Salesforce 2 (Programmatic) |  | Yes | Generic "Joveo" resolved to PPP instance (the only Joveo instance that sends to this system) |
| F069 | Datapool |  | Yes | Generic "Joveo" resolved to PPP instance (the only Joveo instance that sends to this system) |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F005 | x28 |  | Yes |  |
| F008 | kumo |  | Yes |  |
| F024 | jobs.ch (JobsSE) |  | Yes |  |
| F031 | jobup |  | Yes |  |
| F035 | jobscout24 (JS24) |  | Yes |  |
| F042 | marketplace (jobcloud.ai / ONE) |  | Yes |  |
| F069 | Joveo – PPP Instance |  | Yes | Generic "Joveo" resolved to PPP instance (the only Joveo instance that sends to this system) |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F070 | Partner Networks |  | Yes |  |
| F071 | unity |  | Yes |  |
| F072 | jobs.ch / jobup.ch B2C Frontends |  | Yes | List expanded into one frontend per brand |
| F073 | jobscout24.ch B2C Frontend |  | Yes | List expanded into one frontend per brand |
| F074 | jobcloud.ai B2C Frontend |  | Yes | List expanded into one frontend per brand |
| F075 | Vertical B2C Frontends |  | Yes | List expanded into one frontend per brand |

{% enddocs %}

{% docs sys_joveo_marketing %}
**Joveo – Marketing Instance** · Programmatic job ad distribution

- **Node kind:** External service
- **Domain:** Marketing
- **Process stage:** 06 · Ad distribution & marketing
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** Joveo Marketing, Joveo Marketing instance, Joveo – Marketing instance
- **Core entities:** —
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F025 | jobs.ch (JobsSE) |  | Yes | List shorthand expanded |
| F043 | marketplace (jobcloud.ai / ONE) |  | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F076 | Partner Networks |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F026 | jobs.ch (JobsSE) |  | Yes |  |
| F044 | marketplace (jobcloud.ai / ONE) |  | Yes |  |
| F070 | Datapool |  | Yes |  |
| F076 | Joveo – Marketing Instance |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F036 | jobscout24 (JS24) |  | Yes |  |
| F045 | marketplace (jobcloud.ai / ONE) |  | Yes |  |
| F059 | Salesforce 1 |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F071 | Datapool |  | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F077 | jobs.ch / jobup.ch B2C Frontends |  | Yes |  |

{% enddocs %}

{% docs sys_b2c_fe_jobs_jobup %}
**jobs.ch / jobup.ch B2C Frontends** · Web / app frontend

- **Node kind:** Frontend
- **Domain:** B2C
- **Process stage:** 07 · B2C frontends & user services
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** All B2C frontends, B2C frontends (jobs.ch/jobup.ch), B2C frontends (jobs.ch/jobup.ch) App / Web, Frontends, jobs.ch & jobup.ch B2C frontends, jobs.ch / jobup.ch B2C frontends
- **Core entities:** User Behaviour Event
- **Metrics / KPIs:** —

#### Receives data from

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F017 | B2C Users |  | Yes | "Users" and "Customers" (core entity User) treated as the same B2C end-user actor |
| F072 | Datapool |  | Yes | List expanded into one frontend per brand |
| F077 | unity |  | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F078 | event.click |  | Yes |  |
| F079 | Application Tracker | App / Web | Yes |  |
| F080 | Email Tracker |  | Yes |  |
| F081 | Jobtracker |  | Yes |  |
| F082 | nginx |  | Yes | nginx scope is jobs.ch/jobup.ch tracking, so mapped to those B2C frontends |
| F083 | Tealium |  | Yes | "All B2C frontends" mapped to jobs.ch/jobup.ch B2C frontends (Tealium tracking scope); verify whether jobscout24/jobcloud.ai frontends also feed Tealium |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F067 | Intercom | label: 'to frontend' | Yes | Target frontend not specified; verify |

#### Sends data to

_None._

{% enddocs %}

{% docs sys_jobcloud_b2c_fe %}
**jobcloud.ai B2C Frontend** · Web / app frontend

- **Node kind:** Frontend
- **Domain:** B2C
- **Process stage:** 07 · B2C frontends & user services
- **Represented as:** dbt exposure (end point: receives data, sends none)
- **Also written as:** jobcloud.ai frontend
- **Core entities:** —
- **Metrics / KPIs:** —

**Notes:** Added: referenced in flows but had no row of its own.

#### Receives data from

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F046 | marketplace (jobcloud.ai / ONE) |  | Yes | Assumed B2C frontend (Datapool also feeds jobcloud.ai B2C); could be the B2B frontend — verify |
| F074 | Datapool |  | Yes | List expanded into one frontend per brand |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F027 | jobs.ch (JobsSE) |  | Yes |  |
| F032 | jobup |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F037 | jobscout24 (JS24) |  | Yes | Assumed B2C frontend (Datapool also feeds jobscout24.ch B2C) |
| F073 | Datapool |  | Yes | List expanded into one frontend per brand |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F075 | Datapool |  | Yes | List expanded into one frontend per brand |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F078 | jobs.ch / jobup.ch B2C Frontends |  | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F084 | Tealium |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F079 | jobs.ch / jobup.ch B2C Frontends | App / Web | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F085 | Tealium |  | Yes | "trackers" expanded to the three tracker streams |
| F086 | EaglyFly | f_ad_applications | Yes | Assumed "DWH" = EaglyFly (the only DWH in the table) |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F080 | jobs.ch / jobup.ch B2C Frontends |  | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F087 | Tealium |  | Yes | "trackers" expanded to the three tracker streams |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F081 | jobs.ch / jobup.ch B2C Frontends |  | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F088 | Tealium |  | Yes | "trackers" expanded to the three tracker streams |
| F089 | EaglyFly | f_ad_hits | Yes | Assumed "DWH" = EaglyFly (the only DWH in the table) |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F082 | jobs.ch / jobup.ch B2C Frontends |  | Yes | nginx scope is jobs.ch/jobup.ch tracking, so mapped to those B2C frontends |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F090 | Tealium |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F047 | marketplace (jobcloud.ai / ONE) |  | Yes |  |
| F083 | jobs.ch / jobup.ch B2C Frontends |  | Yes | "All B2C frontends" mapped to jobs.ch/jobup.ch B2C frontends (Tealium tracking scope); verify whether jobscout24/jobcloud.ai frontends also feed Tealium |
| F084 | event.click |  | Yes |  |
| F085 | Application Tracker |  | Yes | "trackers" expanded to the three tracker streams |
| F087 | Email Tracker |  | Yes | "trackers" expanded to the three tracker streams |
| F088 | Jobtracker |  | Yes | "trackers" expanded to the three tracker streams |
| F090 | nginx |  | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F091 | Google Analytics |  | Yes |  |
| F092 | BigQuery |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F091 | Tealium |  | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F093 | BigQuery |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F060 | Salesforce 1 |  | Yes |  |
| F096 | Abacus |  | ⚠️ No: two-way flow, F095 drawn instead |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F094 | Salesforce 1 |  | ⚠️ No: two-way flow, F060 drawn instead |  |
| F095 | Abacus |  | Yes |  |

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

**Notes:** Bookings remapped to Ringier / TX Group by account and cost center in EaglyFly.

#### Receives data from

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F048 | marketplace (jobcloud.ai / ONE) |  | Yes |  |
| F061 | Salesforce 1 |  | Yes |  |
| F064 | Salesforce 2 (Programmatic) |  | Yes |  |
| F095 | Datendrehscheibe |  | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F096 | Datendrehscheibe |  | ⚠️ No: two-way flow, F095 drawn instead |  |
| F097 | EaglyFly | bookings / final revenue | Yes |  |

{% enddocs %}

{% docs sys_eaglyfly %}
**EaglyFly** · Data warehouse

- **Node kind:** System
- **Domain:** Analytics & BI
- **Process stage:** 10 · Data warehouse & BI
- **Represented as:** dbt stub model (receives data and passes it on)
- **Also written as:** DWH (f_ad_applications), DWH (f_ad_hits), EaglyFly (daily revenue), EaglyFly (order intake), EaglyFly DWH (bookings / final revenue)
- **Core entities:** Ad (Unified model (star schema)), Booking, Order, Revenue
- **Metrics / KPIs:** Calculated Daily Revenue, Final Revenue, Order Intake

**Notes:** Name as written on board. Likely hosts the 'Ad unified' star schema. Also referenced as "EaglyFly DWH" and "DWH".

#### Receives data from

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F028 | jobs.ch (JobsSE) | daily revenue | Yes |  |
| F033 | jobup | daily revenue | Yes |  |
| F038 | jobscout24 (JS24) | daily revenue | Yes |  |
| F049 | marketplace (jobcloud.ai / ONE) | daily revenue | Yes |  |
| F062 | Salesforce 1 | order intake | Yes | List shorthand expanded |
| F065 | Salesforce 2 (Programmatic) | order intake | Yes | List shorthand expanded |
| F066 | Salesforce 3 |  | Yes | List shorthand expanded |
| F086 | Application Tracker | f_ad_applications | Yes | Assumed "DWH" = EaglyFly (the only DWH in the table) |
| F089 | Jobtracker | f_ad_hits | Yes | Assumed "DWH" = EaglyFly (the only DWH in the table) |
| F097 | Abacus | bookings / final revenue | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F098 | Tableau |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F098 | EaglyFly |  | Yes |  |

#### Sends data to

| Flow | To | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F099 | TX Group |  | Yes |  |
| F100 | Ringier |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F010 | Marketing Vendor Tracking |  | Yes |  |
| F092 | Tealium |  | Yes |  |
| F093 | Google Analytics |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F100 | Tableau |  | Yes |  |

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

| Flow | From | Detail | In lineage graph | Note |
|---|---|---|---|---|
| F099 | Tableau |  | Yes |  |

#### Sends data to

_None._

{% enddocs %}
