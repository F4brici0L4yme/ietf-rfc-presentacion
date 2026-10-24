# .agents.example — research/paper skills bundle

Portable subset of the research skills in this repository. It contains only
skills related to papers, literature, evidence, writing, and study planning.
Copy the whole directory into another project as `.agents/`:

```bash
cp -a .agents.example /path/to/other-project/.agents
```

The resulting layout is:

```
.agents/
├── README.md
└── skills/
    ├── bgpt-paper-search/
    ├── citation-management/
    ├── convert-pdf-to-md/
    ├── database-lookup/
    ├── experimental-design/
    ├── hypothesis-generation/
    ├── literature-review/
    ├── paper-lookup/
    ├── paperclip/
    ├── scientific-critical-thinking/
    └── scientific-writing/
```

## Included skills

| Skill | Purpose |
| --- | --- |
| `bgpt-paper-search` | Claim-level evidence search over full-text scientific papers (BGPT). |
| `citation-management` | Search OpenAlex/PubMed/Scholar, extract metadata, validate citations, build BibTeX. |
| `convert-pdf-to-md` | Convert PDFs to Markdown before reading, summarizing, or extracting from them. |
| `database-lookup` | Query documented scientific/regulatory/public database APIs with provenance. |
| `experimental-design` | Plan designs, randomization, blocking, DOE, and adaptive/sequential studies. |
| `hypothesis-generation` | Turn observations into testable hypotheses, rival explanations, and preregistration plans. |
| `literature-review` | Systematic, scoping, and narrative reviews with reproducible searches. |
| `paper-lookup` | Search 18 scholarly APIs (PubMed, arXiv, OpenAlex, Crossref, Unpaywall, etc.). |
| `paperclip` | Search/read biomedical papers, FDA/PMDA/EMA documents, and clinical trials via GXL Paperclip. |
| `scientific-critical-thinking` | Appraise evidence quality, bias, confounders, GRADE/Cochrane risk of bias. |
| `scientific-writing` | Draft and audit manuscripts/reports with provenance and reporting guidelines. |

## Deliberately excluded

Not copied because they are not paper/literature/research-writing skills:
`polars`, `pymc`, `pymoo`, `scikit-learn`, `shap`, `statsmodels`, `sympy`,
`uncertainty-and-units`, `exploratory-data-analysis`, `scientific-visualization`,
`scientific-slides`, `scientific-schematics`, `markdown-mermaid-writing`,
`hugging-science`, `parallel-web`, `what-if-oracle`.

Optional cross-references in some included skills point to `parallel-web`
(supplementary web discovery) and `scientific-schematics` (AI diagrams).
Those skills are not required for the core workflows; install them separately
if you want those optional steps.

## Requirements

- Python 3.10+ for bundled scripts. Each skill lists its own dependencies in
  `SKILL.md` (some use `uv`, `pip`, or CLI tools such as `paperclip` or
  `parallel-cli`).
- Network access and any needed API keys for the external services each skill
  documents. Check `references/installation.md` or `references/setup.md` inside
  the relevant skill.
- Script paths in the original skills assume `skills/<name>/scripts/...`; when
  copied as `.agents/skills/...`, adjust `skills/` to `.agents/skills/` if a
  command is run from the repository root.
