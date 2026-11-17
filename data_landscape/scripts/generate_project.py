#!/usr/bin/env python3
"""
Generate a documentation-only dbt project from data_sources_standardized.xlsx.

    python scripts/generate_project.py path/to/data_sources_standardized.xlsx [project_dir]

What it writes (generated files are replaced; profiles.yml and README.md are not touched):
    dbt_project.yml                    node colours per process stage
    models/sources.yml                 origin systems (no inbound flows)   -> dbt sources
    models/exposures.yml               end-point systems (no outbound)     -> dbt exposures
    models/groups.yml                  one dbt group per domain (owner from GROUP_OWNERS), set on stub models
    models/<stage>/<system_id>.sql     every other system                  -> stub model
    models/<stage>/_<stage>__models.yml
    models/docs/overview.md            docs home page (__overview__)
    models/docs/systems.md             one docs block per system

Every edge in the dbt lineage graph is one row of the "Data Flows" sheet.
dbt does not allow cycles, so for every two-way pair one direction is
flagged and left out of the graph (see choose_flagged_flows).
"""
import re
import shutil
import sys
from collections import defaultdict
from pathlib import Path

import openpyxl
import yaml

PROJECT_NAME = "data_landscape"

# Owning team (and main contacts) per domain group, from the stakeholder overview
GROUP_OWNERS = {
    "analytics_bi": "Data Analytics & BI (Arnaud Fiales)",
    "b2b": "Enterprise Analytics Suite / LME (Simon Jansen, Chris Ackermann)",
    "b2b_b2c": "Core & Pro Engine Engineering (Marko Ilic)",
    "b2c": "Seekers - B2C Portals (Marek Lerche, Edgars Zvirbulis)",
    "finance": "Finance & Controlling (Diego Rudolf, Evangelo Zervoulias)",
    "integration": "Data Engineering (Andreas Kamber)",
    "tracking": "Web Tracking (Aneliya Filatova)",
}

# Stakeholder groups that own no domain of systems but still belong in groups.yml
EXTRA_GROUP_OWNERS = {
    "data_science_ai": "Data Science & AI Hub (Ignacio Aracena, Yasmina Tregan)",
    "small_enterprises": "Small Enterprises - SE / ONE (Adrian Herrmann, Oliver Leumann)",
    "data_governance": "Data Governance, Legal & Security (Eugenia Lipski)",
    "executive_sponsors": "Executive Sponsors (Hamza Waqas, Sebastian Bossung)",
}

# Stage of systems that never send data (they have no "Process stage (source)"
# value in the Data Flows sheet). Systems not listed here and not found in the
# sheet go to "99 Unassigned".
SINK_STAGES = {
    "aircall": "5 CRM & customer support",
    "partner_networks": "6 Ad distribution & marketing",
    "sfmc": "6 Ad distribution & marketing",
    "jobmailer": "7 B2C frontends & user services",
    "js24_b2c_fe": "7 B2C frontends & user services",
    "vertical_fe": "7 B2C frontends & user services",
    "frontends_unspec": "7 B2C frontends & user services",
    "bigquery": "10 Data warehouse & BI",
    "tx_group": "11 Shareholder reporting",
    "ringier": "11 Shareholder reporting",
}

# Lineage-graph colour of stub models per process stage. dbt docs keeps
# sources green and exposures orange.
STAGE_COLOURS = {
    3: "#8e63ce", 4: "#3b78e7", 5: "#d81b60", 6: "#b8860b",
    7: "#a0522d", 8: "#78909c", 9: "#00acc1", 10: "#5c6bc0", 11: "#6d4c41",
}

EXPOSURE_TYPE_BY_KIND = {"Organisation": "dashboard"}
EXPOSURE_TYPE_BY_ID = {"bigquery": "analysis"}


# --------------------------------------------------------------------------- #
# Helpers
# --------------------------------------------------------------------------- #
def slug(text):
    return re.sub(r"[^a-z0-9]+", "_", str(text).lower()).strip("_")


def md(text):
    """Make a value safe inside a markdown table cell."""
    return str(text or "").replace("|", "\\|").replace("\n", " ").strip()


class Stage:
    def __init__(self, label):
        num, _, title = label.partition(" ")
        self.num = int(num)
        self.title = title.strip()
        self.label = f"{self.num:02d} · {self.title}"
        self.slug = slug(self.title)
        self.folder = f"{self.num:02d}_{self.slug}"
        self.tag = f"stage_{self.num:02d}"

    def __lt__(self, other):
        return self.num < other.num

    def __eq__(self, other):
        return self.num == other.num

    def __hash__(self):
        return self.num


class IndentDumper(yaml.SafeDumper):
    """Indent list items under their parent key (dbt community style)."""

    def increase_indent(self, flow=False, indentless=False):
        return super().increase_indent(flow, False)


def dump_yaml(data):
    text = yaml.dump(data, Dumper=IndentDumper, sort_keys=False,
                     allow_unicode=True, width=120, default_flow_style=False)
    # blank line between the main list entries, for readability
    return re.sub(r"\n(  - name:|      - name:)", r"\n\n\1", text)


def rows(ws):
    it = ws.iter_rows(values_only=True)
    # the header is the first row with 3+ filled cells (some tabs have a title row above it)
    header = next(list(r) for r in it if sum(v is not None for v in r) >= 3)
    for r in it:
        if any(v is not None for v in r):
            yield dict(zip(header, r))


def stated_in(r):
    """Catalog workbooks have no "Stated in" column: two ' | ' separated rows in "Source text" mean Both."""
    return "Both" if " | " in str(r.get("Source text") or "") else "One row"


# --------------------------------------------------------------------------- #
# Read the workbook
# --------------------------------------------------------------------------- #
def read_workbook(path):
    wb = openpyxl.load_workbook(path, read_only=True, data_only=True)
    systems = {}
    # the catalog workbook calls the tab "Data Sources"; older exports call it "Systems"
    for r in rows(wb["Data Sources" if "Data Sources" in wb.sheetnames else "Systems"]):
        systems[r["System ID"]] = dict(
            id=r["System ID"], name=r["System"], kind=r["Node kind"] or "",
            type=r["Type / technology"] or "", domain=r["Domain"] or "",
            aliases=[a.strip() for a in str(r["Aliases in source"] or "").split(";") if a.strip()],
            notes=r["Notes"] or "", entities=[], metrics=[], stage=None)

    flows = []
    for r in rows(wb["Data Flows"]):
        for key in ("Source ID", "Target ID"):
            if r[key] not in systems:
                sys.exit(f"Flow {r['Flow ID']}: unknown system id {r[key]!r}")
        flows.append(dict(
            id=r["Flow ID"], src=r["Source ID"], tgt=r["Target ID"],
            stage=r["Process stage (source)"], detail=r["Flow detail"] or "",
            stated=r["Stated in"] if "Stated in" in r else stated_in(r),
            note=r.get("Mapping note") or ""))
    flows.sort(key=lambda f: f["id"])

    for r in rows(wb["System Entities"]):
        systems[r["System ID"]]["entities"].append(
            r["Entity"] + (f" ({r['Entity detail']})" if r["Entity detail"] else ""))
    for r in rows(wb["System Metrics"]):
        systems[r["System ID"]]["metrics"].append(r["Metric / KPI"])
    return systems, flows


# --------------------------------------------------------------------------- #
# Structure: stages, resource types, cycles
# --------------------------------------------------------------------------- #
def assign_stages(systems, flows):
    for f in flows:
        if f["stage"] and systems[f["src"]]["stage"] is None:
            systems[f["src"]]["stage"] = Stage(f["stage"])
    for s in systems.values():
        if s["stage"] is None:
            label = SINK_STAGES.get(s["id"])
            if not label:
                print(f"WARNING: no process stage for {s['name']}; using 99 Unassigned")
                label = "99 Unassigned"
            s["stage"] = Stage(label)

    # position in the process sequence: stage, then first outbound flow
    first_out = {}
    for i, f in enumerate(flows):
        first_out.setdefault(f["src"], i)
    order = sorted(systems.values(),
                   key=lambda s: (s["stage"].num, first_out.get(s["id"], 10**6), s["name"].lower()))
    for i, s in enumerate(order):
        s["pos"] = i
    return order


def assign_resource_types(systems, flows):
    inbound, outbound = defaultdict(list), defaultdict(list)
    for f in flows:
        outbound[f["src"]].append(f)
        inbound[f["tgt"]].append(f)
    for s in systems.values():
        s["inbound"], s["outbound"] = inbound[s["id"]], outbound[s["id"]]
        if not s["inbound"]:
            s["resource"] = "source"      # data starts here
        elif not s["outbound"]:
            s["resource"] = "exposure"    # data ends here
        else:
            s["resource"] = "model"       # receives and passes on


def choose_flagged_flows(systems, flows):
    """
    dbt needs an acyclic graph, so one flow per cycle is flagged and left out
    of the lineage graph. The flow kept is, in order of preference:
      1. the one confirmed by both rows of the original table ("Stated in" = Both);
      2. the one pointing forward in the process sequence.
    Two-way pairs are resolved first, then any longer cycle that remains.
    Returns {flagged flow id: id of the reverse flow drawn instead, or None}.
    """
    by_pair = {(f["src"], f["tgt"]): f for f in flows}

    def strength(f):
        forward = systems[f["src"]]["pos"] < systems[f["tgt"]]["pos"]
        return (f["stated"] == "Both", forward, -int(f["id"][1:]))

    flagged = {}
    for (a, b), f in by_pair.items():
        rev = by_pair.get((b, a))
        if rev and f["id"] < rev["id"]:
            weak, strong = sorted((f, rev), key=strength)
            flagged[weak["id"]] = strong["id"]

    def find_cycle():
        graph = defaultdict(list)
        for f in flows:
            if f["id"] not in flagged:
                graph[f["src"]].append(f)
        state, stack = {}, []

        def dfs(n):
            state[n] = 1
            for f in graph[n]:
                stack.append(f)
                if state.get(f["tgt"]) == 1:
                    start = next(i for i, e in enumerate(stack) if e["src"] == f["tgt"])
                    return stack[start:]
                if f["tgt"] not in state:
                    found = dfs(f["tgt"])
                    if found:
                        return found
                stack.pop()
            state[n] = 2
            return None

        for n in list(graph):
            if n not in state:
                found = dfs(n)
                if found:
                    return found
        return None

    while (cycle := find_cycle()):
        flagged[min(cycle, key=strength)["id"]] = None
    return flagged


# --------------------------------------------------------------------------- #
# Writers
# --------------------------------------------------------------------------- #
def dbt_call(s):
    if s["resource"] == "source":
        return f"source('{s['stage'].slug}', '{s['id']}')"
    return f"ref('{s['id']}')"


def node_config(s, flagged):
    meta = {
        "system_id": s["id"],
        "system_name": s["name"],
        "node_kind": s["kind"],
        "type_technology": s["type"],
        "domain": s["domain"],
        "process_stage": s["stage"].label,
    }
    # aliases, entities and metrics live in the description and in entity_* tags
    own_flagged = sorted(f["id"] for f in s["inbound"] + s["outbound"] if f["id"] in flagged)
    if own_flagged:
        meta["flagged_two_way_flows"] = ", ".join(own_flagged)

    tags = [s["stage"].tag, f"domain_{slug(s['domain'])}", f"kind_{slug(s['kind'])}"]
    tags += sorted({f"entity_{slug(e.split(' (')[0])}" for e in s["entities"]})
    if own_flagged:
        tags.append("two_way_flow")
    return {"meta": meta, "tags": tags}


def flow_table(s, direction, systems, flagged):
    items = s["inbound"] if direction == "in" else s["outbound"]
    if not items:
        return "_None._\n"
    head = "From" if direction == "in" else "To"
    out = [f"| Flow | {head} | Detail | Stated in | In lineage graph | Note |",
           "|---|---|---|---|---|---|"]
    for f in sorted(items, key=lambda f: f["id"]):
        other = systems[f["src"] if direction == "in" else f["tgt"]]
        if f["id"] in flagged:
            kept = flagged[f["id"]]
            graph = f"⚠️ No: two-way flow, {kept} drawn instead" if kept else "⚠️ No: breaks a cycle"
        else:
            graph = "Yes"
        out.append(f"| {f['id']} | {md(other['name'])} | {md(f['detail'])} | {md(f['stated'])} "
                   f"| {graph} | {md(f['note'])} |")
    return "\n".join(out) + "\n"


RESOURCE_TEXT = {
    "source": "dbt source (origin system: sends data, receives none)",
    "model": "dbt stub model (receives data and passes it on)",
    "exposure": "dbt exposure (end point: receives data, sends none)",
}


def system_doc(s, systems, flagged):
    L = [
        f"{{% docs sys_{s['id']} %}}",
        f"**{s['name']}** · {s['type'] or 'type not stated'}",
        "",
        f"- **Node kind:** {s['kind']}",
        f"- **Domain:** {s['domain']}",
        f"- **Process stage:** {s['stage'].label}",
        f"- **Represented as:** {RESOURCE_TEXT[s['resource']]}",
        f"- **Also written as:** {', '.join(s['aliases']) if s['aliases'] else '—'}",
        f"- **Core entities:** {', '.join(s['entities']) if s['entities'] else '—'}",
        f"- **Metrics / KPIs:** {', '.join(s['metrics']) if s['metrics'] else '—'}",
        "",
    ]
    if s["notes"]:
        L += [f"**Notes:** {s['notes']}", ""]
    L += ["#### Receives data from", "", flow_table(s, "in", systems, flagged),
          "#### Sends data to", "", flow_table(s, "out", systems, flagged),
          "{% enddocs %}", ""]
    return "\n".join(L)


def overview_doc(order, systems, flows, flagged):
    count = defaultdict(int)
    for s in order:
        count[s["resource"]] += 1
    stages = sorted({s["stage"] for s in order})
    fmap = {f["id"]: f for f in flows}

    L = ["{% docs __overview__ %}",
         "# Data & systems landscape",
         "",
         "This project documents the data and systems landscape from "
         "`data_sources_standardized.xlsx`. It holds no transformation logic and never "
         "loads or queries data: the `.sql` files are stubs that exist only so dbt can "
         "draw the lineage graph.",
         "",
         "## How to read the lineage graph",
         "",
         "Each node is one system and each edge is one row of the **Data Flows** sheet "
         f"({flows[0]['id']}–{flows[-1]['id']}), except the flagged two-way flows listed below.",
         "",
         "| dbt resource | Represents | Count |",
         "|---|---|---|",
         f"| Source | Origin systems: send data, receive none | {count['source']} |",
         f"| Model (stub) | Systems that receive data and pass it on | {count['model']} |",
         f"| Exposure | End points: receive data, send none | {count['exposure']} |",
         "",
         "Each system's page lists its inbound and outbound flows with Flow ID, flow detail, "
         "whether the original table stated the flow in both rows, and any mapping note.",
         "",
         "## Process stages",
         "",
         "Stub models are coloured by stage in the lineage graph; sources stay green and "
         "exposures orange.",
         "",
         "| Stage | Model colour | Systems |",
         "|---|---|---|"]
    for st in stages:
        names = ", ".join(s["name"] for s in order if s["stage"] == st)
        has_models = any(s["resource"] == "model" and s["stage"] == st for s in order)
        colour = f"`{STAGE_COLOURS.get(st.num, '#607d8b')}`" if has_models else "—"
        L.append(f"| {st.label} | {colour} | {md(names)} |")

    L += ["",
          "## Flagged two-way flows (cycles)",
          "",
          "dbt does not allow cycles, so one direction of each two-way pair is left out of the "
          "graph. The direction drawn is the one confirmed by both rows of the original table; "
          "when that doesn't decide it, the one that points forward in the process sequence. "
          "Flagged flows still appear on both systems' pages and as comments in the stub SQL.",
          "",
          "| Flagged (not drawn) | Drawn instead | Stated in (flagged / drawn) |",
          "|---|---|---|"]
    for fid, kept in sorted(flagged.items()):
        f = fmap[fid]
        a, b = systems[f["src"]]["name"], systems[f["tgt"]]["name"]
        if kept:
            k = fmap[kept]
            L.append(f"| {fid} {md(a)} → {md(b)} | {kept} {md(systems[k['src']]['name'])} → "
                     f"{md(systems[k['tgt']]['name'])} | {f['stated']} / {k['stated']} |")
        else:
            L.append(f"| {fid} {md(a)} → {md(b)} | — (breaks a longer cycle) | {f['stated']} / — |")

    L += ["",
          "## Useful graph filters",
          "",
          "Type these in the `--select` box under the lineage graph:",
          "",
          "- `+salesforce_1+` shows everything upstream and downstream of Salesforce 1.",
          "- `tag:stage_08` shows one process stage (here: tracking).",
          "- `tag:entity_customer` shows every system that holds Customer data.",
          "- `tag:domain_b2b` shows one domain.",
          "- `tag:two_way_flow` shows the systems involved in flagged two-way flows.",
          "",
          "## Open assumptions from standardization",
          "",
          "| Flows | Assumption |",
          "|---|---|"]
    notes = defaultdict(list)
    for f in flows:
        if f["note"]:
            notes[f["note"]].append(f["id"])
    for note, ids in sorted(notes.items(), key=lambda kv: kv[1][0]):
        L.append(f"| {', '.join(ids)} | {md(note)} |")
    L += ["", "{% enddocs %}", ""]
    return "\n".join(L)


def stub_sql(s, systems, flagged):
    L = ["{#",
         f"    {s['name']} · {s['type']} · Domain: {s['domain']}",
         f"    Process stage: {s['stage'].label}",
         "",
         "    Stub model for documentation only. It holds no transformation logic and is",
         "    never run against real data. Each depends_on line below is one inbound flow",
         "    from the Data Flows sheet; dbt draws it as an edge in the lineage graph.",
         "#}",
         ""]
    inbound = sorted(s["inbound"], key=lambda f: f["id"])
    for f in (f for f in inbound if f["id"] not in flagged):
        src = systems[f["src"]]
        detail = f" ({f['detail']})" if f["detail"] else ""
        L.append(f"-- depends_on: {{{{ {dbt_call(src)} }}}}  -- {f['id']} {src['name']}{detail}")
    held = [f for f in inbound if f["id"] in flagged]
    if held:
        L += ["",
              "{#  FLAGGED TWO-WAY FLOWS: real flows into this system that are left out of the",
              "    lineage graph, because drawing them would create a cycle (dbt rejects cycles)."]
        for f in held:
            kept = flagged[f["id"]]
            why = f"reverse flow {kept} is drawn instead" if kept else "breaks a longer cycle"
            L.append(f"    {f['id']} {systems[f['src']]['name']} -> {s['name']}: {why}")
        L.append("#}")
    L += ["", "select 1 as placeholder", ""]
    return "\n".join(L)


def write(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")


def generate(xlsx, root):
    systems, flows = read_workbook(xlsx)
    order = assign_stages(systems, flows)
    assign_resource_types(systems, flows)
    flagged = choose_flagged_flows(systems, flows)

    models_dir = root / "models"
    for old in models_dir.glob("[0-9][0-9]_*"):
        shutil.rmtree(old)  # stage folders are regenerated from scratch

    header = ("# Generated by scripts/generate_project.py from data_sources_standardized.xlsx.\n"
              "# Edit the workbook and regenerate rather than editing this file by hand.\n\n")

    # sources.yml: origin systems, grouped by process stage --------------------
    by_stage = defaultdict(list)
    for s in order:
        if s["resource"] == "source":
            by_stage[s["stage"]].append(s)
    sources = [{
        "name": st.slug,
        "description": f"Origin systems in process stage {st.label}: they send data but receive none.",
        "tables": [{"name": s["id"], "description": f'{{{{ doc("sys_{s["id"]}") }}}}',
                    "config": node_config(s, flagged)} for s in by_stage[st]],
    } for st in sorted(by_stage)]
    write(models_dir / "sources.yml", header + dump_yaml({"version": 2, "sources": sources}))

    # exposures.yml: end-point systems ------------------------------------------
    exposures = []
    for s in order:
        if s["resource"] != "exposure":
            continue
        deps = sorted({dbt_call(systems[f["src"]]) for f in s["inbound"] if f["id"] not in flagged})
        exposures.append({
            "name": s["id"],
            "label": s["name"],
            "type": EXPOSURE_TYPE_BY_ID.get(s["id"], EXPOSURE_TYPE_BY_KIND.get(s["kind"], "application")),
            "description": f'{{{{ doc("sys_{s["id"]}") }}}}',
            "owner": {"name": "TBD"},
            "depends_on": deps,
            "config": node_config(s, flagged),
        })
    write(models_dir / "exposures.yml", header + dump_yaml({"version": 2, "exposures": exposures}))

    # stub models and their properties, one folder per stage ---------------------
    stage_models = defaultdict(list)
    for s in order:
        if s["resource"] == "model":
            stage_models[s["stage"]].append(s)
            write(models_dir / s["stage"].folder / f"{s['id']}.sql", stub_sql(s, systems, flagged))
    for st, ms in stage_models.items():
        props = {"version": 2, "models": [
            {"name": s["id"], "description": f'{{{{ doc("sys_{s["id"]}") }}}}',
             "config": {"group": slug(s["domain"]), **node_config(s, flagged)}} for s in ms]}
        write(models_dir / st.folder / f"_{st.folder}__models.yml", header + dump_yaml(props))

    # groups.yml: one group per domain; dbt groups apply to models only ---------
    domains = sorted({s["domain"] for s in order if s["resource"] == "model"}, key=slug)
    groups = [{"name": slug(d), "owner": {"name": GROUP_OWNERS.get(slug(d), "TBD")}} for d in domains]
    groups += [{"name": n, "owner": {"name": o}} for n, o in EXTRA_GROUP_OWNERS.items() if n not in {g["name"] for g in groups}]
    write(models_dir / "groups.yml", header + dump_yaml({"version": 2, "groups": groups}))

    # docs blocks -----------------------------------------------------------------
    write(models_dir / "docs" / "systems.md",
          "\n".join(system_doc(s, systems, flagged) for s in order))
    write(models_dir / "docs" / "overview.md", overview_doc(order, systems, flows, flagged))

    # dbt_project.yml: node colour per stage folder ----------------------------------
    folder_cfg = {st.folder: {"+docs": {"node_color": STAGE_COLOURS.get(st.num, "#607d8b")}}
                  for st in sorted(stage_models)}
    project = {
        "name": PROJECT_NAME,
        "version": "1.0.0",
        "profile": PROJECT_NAME,
        "model-paths": ["models"],
        "target-path": "target",
        "clean-targets": ["target", "logs"],
        "models": {
            PROJECT_NAME: {"+materialized": "view", **folder_cfg},
            "elementary": {"+schema": "elementary"},
        },
    }
    write(root / "dbt_project.yml", header + dump_yaml(project))

    # Elementary observability package (https://docs.elementary-data.com) -----------
    write(root / "packages.yml", header + dump_yaml(
        {"packages": [{"package": "elementary-data/elementary", "version": "0.26.1"}]}))
    write(root / "macros" / "elementary_materialization.sql",
          "{% materialization test, default %}\n"
          "  {{ return(elementary.materialization_test_default()) }}\n"
          "{% endmaterialization %}\n")

    print(f"{len(systems)} systems: " + ", ".join(
        f"{sum(s['resource'] == r for s in order)} {r}s" for r in ("source", "model", "exposure")))
    print(f"{len(flows)} flows, {len(flagged)} flagged: " + ", ".join(
        f"{k} (drawn instead: {v})" for k, v in sorted(flagged.items())))


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit(__doc__)
    project_dir = Path(sys.argv[2]) if len(sys.argv) > 2 else Path(__file__).resolve().parents[1]
    generate(Path(sys.argv[1]), project_dir)
