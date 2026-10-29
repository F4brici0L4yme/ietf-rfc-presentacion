---
name: evidence-ledger
description: Records every claim extracted from a source into a structured, citation-linked ledger (ledger.jsonl) and validates it so nothing unsourced or fabricated enters research notes. Use whenever you extract findings from papers, reports, datasets, or web pages during research, literature review, or fact gathering, and before any synthesis or idea generation that depends on those findings.
---

# Evidence ledger

A ledger is the single source of truth for a research project. Synthesis and ideas may only use what is in it.

## Entry format (one JSON object per line in `ledger.jsonl`)

```json
{"id":"E001","claim":"Short paraphrase of what the source reports","source":{"title":"...","authors":"First et al.","year":2023,"venue":"...","url":"https://...","doi":"10.xxxx/..."},"location":"Sec. 4.2 / Table 3 / p. 7","type":"primary|review|preprint|report|web","depth":"fulltext|abstract","subquestion":"SQ2","confidence":"high|medium|low","confidence_reason":"why","inference":"optional: your interpretation, kept separate from the claim","conflicts_with":["E014"]}
```

## Rules
1. **Paraphrase.** Never paste long passages; quote at most a short phrase and mark it.
2. **`claim` = what the source says. `inference` = what you conclude.** Never mix them.
3. **Location is required** (section, table, figure, or page) so the claim can be rechecked.
4. **`depth`:** use `abstract` if you did not read the full text. Abstract-only entries cannot be `high` confidence.
5. **Confidence** reflects study design, sample size, replication, and recency, not how convenient the claim is.
6. If two entries disagree, add each other's ID to `conflicts_with`. Do not pick a winner silently.
7. Do not invent DOIs, page numbers, or authors. Use `null` and say what is missing.
8. Verify a source exists (open the URL or look up the DOI) before first use.

## Workflow
1. Add entries as you read, appending to `ledger.jsonl` with the next free ID.
2. Run the validator after each batch:
   `python scripts/check_ledger.py ledger.jsonl`
3. Fix every error it prints. Warnings should be addressed or consciously accepted.
4. Optionally render a readable version: `python scripts/check_ledger.py ledger.jsonl --md ledger.md`.
