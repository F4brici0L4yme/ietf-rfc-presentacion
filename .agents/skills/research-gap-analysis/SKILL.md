---
name: research-gap-analysis
description: Reads a populated evidence ledger and identifies research gaps (contradictions, untested assumptions, missing populations or methods, weak evidence, stale findings) with each gap tied to ledger IDs. Use after literature collection and before generating hypotheses or research ideas, or whenever the user asks "what is missing", "what is unknown", "where are the gaps", or "what hasn't been studied".
---

# Research gap analysis

Input: `ledger.jsonl` (validated), `scope.md`. Output: `gaps.md`.
Work only from the ledger. If you need a fact that is not in it, go back and add it through `evidence-ledger` first.

## Gap types to look for
1. **Contradiction:** entries with `conflicts_with`, or findings that differ by method/population.
2. **Weak evidence:** a claim relied upon but supported only by low confidence, abstract-only, or single-study entries.
3. **Untested assumption:** something all sources take for granted without testing it.
4. **Coverage hole:** population, condition, scale, geography, organism, dataset, or time period absent from the ledger.
5. **Method limitation:** common measurement or design flaw shared across studies.
6. **Stale evidence:** findings older than the field's pace of change, or superseded by newer methods.
7. **Unreplicated result:** an important finding without independent confirmation.

## Procedure
1. Tabulate the ledger by sub-question: what is well supported, contested, thin.
2. For each gap type, scan systematically; do not stop at the first few.
3. For each candidate gap, check it is real: search specifically for work that fills it. If found, add it to the ledger and drop or reshape the gap.
4. Rate each gap on **importance** (what changes if solved) and **tractability** (can it be addressed with realistic means).

## gaps.md format
```
## G01: <one-line gap>
- Type: contradiction | weak-evidence | assumption | coverage | method | stale | unreplicated
- Evidence: E003, E017, E022 (what they show, in one or two lines)
- Why it is a gap: ...
- Verification search done: <queries> -> <result>
- Importance: H/M/L  Tractability: H/M/L
- Confidence that this is truly open: H/M/L
```
End with "Not a gap" (apparent gaps you checked that turned out to be filled) and "Limits of this analysis" (what the ledger could not cover).

## Don'ts
- No gap without ledger IDs.
- Do not call something unstudied because you did not find it in one search; say "not found in N searches."
