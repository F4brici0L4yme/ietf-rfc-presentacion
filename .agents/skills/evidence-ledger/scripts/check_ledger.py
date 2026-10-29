#!/usr/bin/env python3
"""Validate (and optionally render) a research evidence ledger (JSONL)."""
import argparse, json, re, sys
from collections import Counter

REQ = ["id", "claim", "source", "location", "type", "depth", "subquestion", "confidence"]
TYPES = {"primary", "review", "preprint", "report", "web"}
DEPTH = {"fulltext", "abstract"}
CONF = {"high", "medium", "low"}
DOI = re.compile(r"^10\.\d{4,9}/\S+$")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("ledger")
    ap.add_argument("--md", help="write a readable markdown version")
    a = ap.parse_args()

    errors, warnings, entries = [], [], []
    with open(a.ledger, encoding="utf-8") as f:
        for n, line in enumerate(f, 1):
            line = line.strip()
            if not line:
                continue
            try:
                entries.append((n, json.loads(line)))
            except json.JSONDecodeError as e:
                errors.append(f"line {n}: invalid JSON ({e})")

    ids = Counter(e.get("id") for _, e in entries)
    for n, e in entries:
        p = f"line {n} ({e.get('id', '?')})"
        for k in REQ:
            if not e.get(k):
                errors.append(f"{p}: missing '{k}'")
        if ids[e.get("id")] > 1:
            errors.append(f"{p}: duplicate id")
        if e.get("type") and e["type"] not in TYPES:
            errors.append(f"{p}: bad type '{e['type']}'")
        if e.get("depth") and e["depth"] not in DEPTH:
            errors.append(f"{p}: bad depth '{e['depth']}'")
        if e.get("confidence") and e["confidence"] not in CONF:
            errors.append(f"{p}: bad confidence '{e['confidence']}'")
        if e.get("depth") == "abstract" and e.get("confidence") == "high":
            errors.append(f"{p}: abstract-only entries cannot be high confidence")
        s = e.get("source") or {}
        if isinstance(s, dict):
            if not (s.get("url") or s.get("doi")):
                errors.append(f"{p}: source needs url or doi")
            if s.get("doi") and not DOI.match(str(s["doi"])):
                warnings.append(f"{p}: DOI looks malformed: {s['doi']}")
            if not s.get("year"):
                warnings.append(f"{p}: source year missing")
            if not s.get("title"):
                errors.append(f"{p}: source title missing")
        else:
            errors.append(f"{p}: 'source' must be an object")
        if len(str(e.get("claim", ""))) > 400:
            warnings.append(f"{p}: claim is long; paraphrase more tightly")
        if e.get("confidence") in {"high", "medium"} and not e.get("confidence_reason"):
            warnings.append(f"{p}: add confidence_reason")
        for c in e.get("conflicts_with", []) or []:
            if c not in ids:
                errors.append(f"{p}: conflicts_with unknown id {c}")

    by_id = {e.get("id"): e for _, e in entries}
    for _, e in entries:
        for c in e.get("conflicts_with", []) or []:
            o = by_id.get(c)
            if o and e.get("id") not in (o.get("conflicts_with") or []):
                warnings.append(f"{e['id']} conflicts with {c} but not the reverse")

    sq = Counter(e.get("subquestion") for _, e in entries)
    print(f"{len(entries)} entries; per sub-question: {dict(sq)}")
    for w in warnings:
        print("WARN ", w)
    for er in errors:
        print("ERROR", er)

    if a.md:
        with open(a.md, "w", encoding="utf-8") as out:
            out.write("# Evidence ledger\n\n")
            for _, e in sorted(entries, key=lambda x: str(x[1].get("id"))):
                s = e.get("source", {}) if isinstance(e.get("source"), dict) else {}
                out.write(f"## {e.get('id')} ({e.get('subquestion')}, {e.get('confidence')})\n")
                out.write(f"- **Claim:** {e.get('claim')}\n")
                out.write(f"- **Source:** {s.get('authors','')} {s.get('year','')}. {s.get('title','')}. {s.get('url') or s.get('doi','')}\n")
                out.write(f"- **Location:** {e.get('location')}  |  **Type:** {e.get('type')}  |  **Read:** {e.get('depth')}\n")
                if e.get("inference"):
                    out.write(f"- **[INFERENCE]** {e['inference']}\n")
                if e.get("conflicts_with"):
                    out.write(f"- **Conflicts with:** {', '.join(e['conflicts_with'])}\n")
                out.write("\n")
        print(f"wrote {a.md}")

    sys.exit(1 if errors else 0)


if __name__ == "__main__":
    main()
