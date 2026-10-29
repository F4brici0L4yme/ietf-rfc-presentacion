---
name: research-idea-ranking
description: Stress-tests and ranks candidate research ideas or hypotheses against gaps and evidence, checking novelty by search, feasibility, falsifiability, and risk, then delivers a short list of the best ideas with methods. Use after hypothesis-generation produced candidates, or whenever the user asks which research idea is best, whether an idea is novel, or wants ideas critiqued, prioritized, or compared.
---

# Research idea ranking

Input: `gaps.md`, `ledger.jsonl`, `candidates.md` (from `hypothesis-generation`, or generate 10+ candidates yourself if none exist, each linked to a gap ID).
Output: `ideas.md`.

## Step 1: Require traceability
Drop any candidate that does not cite at least one gap ID (G..) and supporting ledger IDs (E..). Ideas from model memory alone are not allowed through.

## Step 2: Novelty check (by searching, not by feeling)
For each candidate run at least 2 searches using different phrasings (method terms, outcome terms, adjacent-field terms). Classify:
- **Open:** nothing close found.
- **Partially done:** related work exists; state precisely what differs.
- **Done:** already published; cite it and drop or reframe.
Add any newly found sources to the ledger.

## Step 3: Score (1-5 each, with a one-line reason)
| Criterion | Question |
|-----------|----------|
| Novelty | After the search, how much is new? |
| Importance | If true, who cares and what changes? |
| Feasibility | Data, tools, skills, time available to the user? |
| Falsifiability | Is there a result that would clearly refute it? |
| Evidence support | How strong is the ledger basis for the premise? |
| Risk (inverse) | Chance of null result, confounds, or ethics/access blockers |

Do not average blindly: an idea that fails falsifiability or feasibility is out regardless of total. Use `scientific-critical-thinking` to attack the top candidates (confounds, alternative explanations, selection bias).

## Step 4: Deliver top 3 in ideas.md
```
## Idea 1: <title>
- Addresses: G03 (evidence: E005, E011)
- Hypothesis / question:
- Why it matters:
- Novelty status: Open | Partial (differs by ...), with searches run
- Proposed method (use experimental-design for detail):
- Key measurement and what result would falsify it:
- Main risks and mitigation:
- Minimal first step (days, not months):
- Scores: N x / I x / F x / Fa x / Ev x / R x
```
Then add: a ranked table of all candidates with reasons for dropping the rest, and a short note on how confident you are in the novelty judgments and why.

## Don'ts
- Never claim novelty without listing the searches performed.
- Never hide the weakest assumption of a favored idea; state it.
