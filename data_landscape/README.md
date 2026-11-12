# data_landscape: data & systems landscape as dbt docs

A documentation-only dbt project generated from `data_sources_standardized.xlsx`.
There is no database server and no transformation logic: the `.sql` files are
one-line stubs that exist only so dbt can draw the lineage graph.

## View the docs

Open `dbt_docs.html` in this folder in a browser. It is the
static, self-contained build of the docs, so it needs no dbt install.

To build the docs yourself:

```bash
pip install dbt-core dbt-duckdb
cd data_landscape
dbt parse --profiles-dir .
dbt docs generate --empty-catalog --static --profiles-dir .   # writes target/static_index.html
dbt docs serve --profiles-dir .                               # or serve it locally
```

`profiles.yml` points DuckDB at `:memory:`, so nothing is written to disk.
`--empty-catalog` skips querying for table metadata. Tested with dbt Core
1.12.6 and dbt-duckdb 1.11.1.

## How the landscape maps to dbt

| Workbook | dbt | Count |
|---|---|---|
| System that sends data but receives none | source (`models/sources.yml`, grouped by process stage) | 10 |
| System that receives and passes data on | stub model (`models/<stage>/<system_id>.sql`) | 27 |
| System that receives data but sends none | exposure (`models/exposures.yml`) | 13 |
| Row of the Data Flows sheet | one edge: a `-- depends_on: {{ ref() }}` / `{{ source() }}` line, or an exposure `depends_on` entry | 93 of 100 |
| System notes, entities, metrics, aliases, flows | docs block per system (`models/docs/systems.md`) | 50 |

The docs home page (`models/docs/overview.md`) explains the graph, lists the
process stages and their colours, the flagged flows and the open assumptions.

Every node carries tags you can use in the graph's `--select` box:
`stage_05`, `domain_b2b`, `kind_system`, `entity_customer`, `two_way_flow`.

## Flagged two-way flows

dbt rejects cycles, so for each two-way pair one direction is left out of the
graph (7 flows). The direction drawn is the one confirmed by both rows of the
original table; when that doesn't decide it, the one pointing forward in the
process sequence. Flagged flows stay documented on both systems' pages, in
the stub SQL as a comment, and in the `flagged_two_way_flows` meta field.

## Updating

Edit the workbook, then regenerate (this replaces `dbt_project.yml` and
everything under `models/`):

```bash
python scripts/generate_project.py path/to/data_sources_standardized.xlsx
```

A system that only receives data has no process stage in the Data Flows
sheet; its stage comes from `SINK_STAGES` in the script. Add new end-point
systems there, otherwise they land in stage 99 "Unassigned".

Exposure owners are set to `TBD`, since the workbook has no owner column.
