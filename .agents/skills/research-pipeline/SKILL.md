---
name: research-pipeline
description: Orchestrates a full grounded research workflow, from question to sourced evidence to gaps to ranked research ideas, by chaining the other research skills in the right order with file handoffs. Use whenever the user wants to research a topic AND come up with research ideas, hypotheses, or project directions, or says things like "investigate X and suggest what to study", "find gaps in the literature", "give me research ideas on X", even if they never mention a pipeline.
---

# Research pipeline

Goal: ideas that are grounded in verified evidence, not in model memory.
Work in a project folder (default `./research/<topic-slug>/`) and hand off between stages through files. Never carry findings only in conversation.

## Stages and which skill to use

| # | Stage | Skills to use | Output file |
|---|-------|---------------|-------------|
| 0 | Scope the question | this skill | `scope.md` |
| 1 | Find sources | `paper-lookup`, `bgpt-paper-search`, `paperclip`, `database-lookup`, `literature-review` | `sources.md` |
| 2 | Read and extract | `convert-pdf-to-md`, then `evidence-ledger` | `ledger.jsonl` |
| 3 | Find gaps | `research-gap-analysis`, `scientific-critical-thinking` | `gaps.md` |
| 4 | Generate ideas | `hypothesis-generation` | `candidates.md` |
| 5 | Rank and stress-test | `research-idea-ranking`, `experimental-design` | `ideas.md` |
| 6 | Cite and write up | `citation-management`, `scientific-writing` | final report |

If a listed skill is missing, continue with general tools and say so in `scope.md`.

## Stage 0: scope.md
Write: the research question in one sentence, 3-5 sub-questions, inclusion criteria (years, fields, source types), what would count as a good answer, and any user constraints (budget, data access, timeline). Ask the user only if the topic itself is ambiguous; otherwise state assumptions and proceed.

## Gates (do not skip)
- **Before stage 3:** `python <skills>/evidence-ledger/scripts/check_ledger.py ledger.jsonl` must pass, and each sub-question needs at least 3 entries or an explicit "thin evidence" note.
- **Before stage 4:** `gaps.md` exists and every gap cites ledger IDs.
- **Before delivering:** every idea cites a gap ID, and every factual claim in the final text maps to a ledger ID.

## Principles
- Source says vs. you infer: keep them labeled separately everywhere.
- Prefer primary sources. Note date and venue. Flag preprints.
- Disagreement between sources is a finding; record both sides.
- Missing information is written as "not found", never filled in.
- Do not cite a paper you have not opened (abstract at minimum). If only the abstract was read, mark `depth: abstract`.
- At the end, report to the user: what was searched, what could not be accessed, and the weakest links in the evidence.
