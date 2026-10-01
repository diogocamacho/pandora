---
name: paper-summary
description: Deep, adversarial analysis of scientific papers from a URL, DOI, PDF, or unread clips in the Pandora Papers/ inbox; writes analysis notes, links them to ideas, and feeds the Learning dashboard and weekly synthesis.
---

# paper-summary

Comprehensive, skeptical read of a scientific paper. Output is an Obsidian analysis note in Pandora plus a row on the Learning dashboard. Register: expert-to-expert, maximum depth, no fluff. Accuracy over confidence — say "not reported" or "could not verify" rather than guess. Never fabricate a number, quote, figure panel, or reference.

## Invocation

- `/paper-summary` — process every **unanalyzed** paper in `Papers/` (the inbox).
- `/paper-summary <url | DOI | PMID | arXiv/bioRxiv ID | attached PDF>` — analyze that paper; save a clip stub into `Papers/` first so it is tracked like any other.
- `/paper-summary --reanalyze <title or DOI>` — force a fresh analysis of something already done (keep the old note, suffix the new one with the date).

## Vault layout

Vault: Pandora at `/Users/dcamacho/Documents/pandora` (in Cowork: request folder access if not connected, then work via device_bash at `$HOME/mnt/pandora`).

- `Papers/` — inbox. Web Clipper notes (frontmatter: title, source, author, created, tags) and PDFs dropped beside them.
- `Papers/Analyses/` — one analysis note per paper (create the folder if missing).
- `Dashboards/Learning.md` — the Continuous Learning dashboard; holds the **📄 Papers I clipped** section.
- `ideas/<Idea>/<note>.md` — idea notes; the skill appends ✅/⚡ back-references to them.
- Do NOT put papers in `Clippings/` and do not edit `.scripts/enrich_clippings.sh`; that pipeline enriches general web clips and reads `Papers/Analyses/` for the learning syntheses.

## Step 0 — Scan the inbox and deduplicate

1. List `.md` files directly in `Papers/` (not `Papers/Analyses/`). A clip is **done** if its frontmatter has `analyzed: true`.
2. Extract a DOI for every clip and every analysis note (frontmatter `doi`, a `doi:` line in the body, or parse from `source`; arXiv ID / PMID as fallback). Normalize: lowercase, strip `https://doi.org/`, strip bioRxiv version suffix (`v1`, `v2`).
3. Skip any unanalyzed clip whose normalized ID matches an existing analysis — set `analyzed: true` and `analysis: "[[...]]"` on it, and tell the user it was a duplicate.
4. Preprint ↔ published: if a clip is the journal version of an already-analyzed preprint (check with bioRxiv `search_published_preprints` or matching title/authors), do not redo the full read. Do a **delta pass** instead: what changed (new experiments, changed claims, dropped panels, reviewer-driven additions), appended to the existing analysis note under `## Published version delta`.
5. Report the queue (N new, N duplicates, N deltas) before starting. If processing many, run papers in parallel where possible, each with its own independent reviewer.

## Step 1 — Acquire the full text

Order of preference:
1. Local PDF in `Papers/` matching the clip (match by DOI inside the PDF, or by title/first-author similarity; e.g. `Karenina.pdf` ↔ the Karenina clip). Link it in the analysis note.
2. Open-access full text: PMC (PubMed `get_full_text_article`), bioRxiv/medRxiv full text and PDF (bioRxiv `get_preprint`), arXiv PDF, Unpaywall-located OA copy, publisher page via WebFetch.
3. If a PDF is obtained, save it into `Papers/` next to the clip as `<short title>.pdf`.
4. **Supplementary materials**: fetch them by default. Extended data, supplementary tables, and methods supplements are where n's, failed conditions, and the real benchmarks live.
5. If only the abstract is reachable, stop and ask for the PDF. Never write an analysis from an abstract.
6. If a fetch is blocked, do not work around it with other download methods; tell the user and ask for the PDF.

## Step 2 — Integrity and reproducibility check

- Peer-review status; preprint vs published; current version number.
- Retractions, errata, expressions of concern (PubMed metadata, publisher page); PubPeer comments if findable.
- Code: repo exists? contains actual training/analysis code, or a stub? License?
- Data: deposited where (GEO, SRA, PDB, Zenodo, figshare)? Accession actually resolves? "Available on request" counts as not available.
- Competing interests and funding — note anything material to the claims (e.g., authors selling the tool being benchmarked).

## Step 3 — Comprehensive read (main analyst)

Read every section, every figure, and the supplement. Render PDF pages and **look at the figure panels** — do not rely on captions.

Produce:
- **Main idea**: the question, the approach, and why it matters — in 3–5 sentences.
- **Claims ledger**: every major claim → the figure/panel/table that supports it → evidence grade:
  - `direct` (the experiment tests the claim), `indirect` (consistent with but doesn't isolate it), `asserted` (stated, no supporting data).
- **Figure walkthrough**: one entry per main figure — what it shows, what it actually supports, and problems (truncated axes, missing error bars, unquantified "representative" images, n only in methods, cherry-picked examples, inconsistent n across panels).
- **Methods audit**: sample sizes; biological vs technical replicates; statistical tests and whether they match the data structure; multiple-comparison correction; controls (positive, negative, vehicle, isotype, scrambled); blinding/randomization where relevant.
- **ML/computational audit** (when applicable): train/test leakage — especially splits that ignore sequence/structural similarity, family/scaffold overlap, or time; baseline strength and recency; benchmark selection; ablations that test the right thing; hyperparameter tuning on test; variance across seeds; compute fairness across baselines.
- **Hype gap**: abstract/title claims side-by-side with what the data supports.
- **Causality check**: flag every place mechanism or causation is inferred from association, correlation, or perturbation without rescue/orthogonal validation.

## Step 4 — Independent reviewer (ALWAYS runs)

Spawn a separate subagent (Agent tool) for each paper. Give it **only** the Methods, Results, figures/figure legends, and supplementary material — **not** the title, abstract, introduction, or discussion. Do not share the main analyst's conclusions.

Reviewer prompt essentials:
- "You are a rigorous, skeptical reviewer. From the data alone, state what this work demonstrates, the 3–5 main conclusions you would draw, the strength of each, and the most serious weaknesses. Cite figure panels for every statement. Say 'cannot determine' where the data is insufficient."
- Return structured output: conclusions (with panels + strength), weaknesses, missing experiments, questions for the authors.

If the Agent tool is unavailable, do a separate pass in a fresh context window reading only those sections, and say in the note that the reviewer was not fully independent.

Then **reconcile**: build a table comparing the authors' claims vs the reviewer's conclusions — `agrees`, `weaker than claimed`, `not supported`, `reviewer found something authors didn't emphasize`. Divergences are the most important output of this skill; surface them in the TL;DR.

## Step 5 — Adversarial context

- **Steelman**: the strongest honest version of the paper's case.
- **Red team**: the strongest case against it.
- **Alternative explanations** for the key result.
- **The falsifying experiment**: the single experiment that would most cleanly break the main claim.
- **Literature for and against**: search PubMed, bioRxiv, and the web for (a) prior work that contradicts or pre-empts it, (b) supporting/replicating work, (c) how later citing papers characterize it (if it has been out long enough). Note novelty honestly — if the core idea existed before, say where.
- **Confidence per key claim**: high / medium / low / unsupported, each with a one-line reason.

### Reference rule (hard)
Every reference must be verified to exist — resolve via PubMed `lookup_article_by_citation` / `get_article_metadata`, DOI resolution, or bioRxiv `get_preprint` — and must actually say what it is cited for. Cite as `Author et al., Year, Journal — [DOI/PMID link]`. Anything not verified goes in a separate **Unverified** list, clearly labeled, or is dropped. Never cite from memory.

## Step 6 — Avenues to explore

- Open questions the paper raises but does not answer.
- Concrete follow-ups: experiments, analyses, or re-analyses runnable on the released data/code (state effort: days / weeks / months).
- Reusable assets: datasets, models, benchmarks, protocols — with links and license.
- People: corresponding/senior authors, labs, and company affiliations worth knowing; related patents if obvious.
- Links into the vault: search Pandora (`Notes/`, `Clippings/`, other analyses in `Papers/Analyses/`) for related notes and add `[[wikilinks]]` only where the connection is real.
- **Idea connections**: list every note in `ideas/` recursively (ideas live in subfolders, e.g. `ideas/CausaLab/2025-09-21 causalab.md`). Read the candidates that plausibly relate. Decide, from the full analysis — post-critique, not the authors' framing — whether the paper **supports** or **challenges** each idea. A weak/unsupported paper can still *challenge* an idea (e.g. a failed approach the idea depends on) but should not count as *support*. Only real, specific connections; zero is a fine answer. Each connection gets a one-line reason. These are written in Step 8 and feed the daily and Friday learning syntheses.

## Step 7 — Verify before writing

- Every number, n, p-value, and quote traced to a page/panel. Fix or remove anything that is not.
- Every reference passes the reference rule.
- Reviewer reconciliation table is consistent with the claims ledger.
- TL;DR and verdict reflect the divergences, not just the authors' framing.

## Step 8 — Write outputs

### 8a. Analysis note → `Papers/Analyses/<Short Title> (<First author> <Year>).md`

```markdown
---
type: paper-analysis
title: "<full title>"
doi: "<normalized doi>"
source: "<url>"
authors: ["<First Author>", "...", "<Senior Author>"]
year: <yyyy>
venue: "<journal or bioRxiv>"
peer_reviewed: true|false
clip: "[[<clip note name>]]"
pdf: "[[<pdf filename>]]"
analyzed_on: <yyyy-mm-dd>
verdict: strong | solid | mixed | weak | unsupported
tldr: "<one sentence: what it shows and how much to trust it>"
reviewer_divergence: none | minor | major
tags: [paper, <3-6 topical kebab-case tags>]
related:
  - "[[<vault note>]]"
idea-supports:
  - "[[<exact idea note name>]]"
idea-challenges:
  - "[[<exact idea note name>]]"
---

# <Title>

## TL;DR & verdict
<3-5 bullets: main result, verdict with reason, biggest divergence between authors and reviewer, biggest weakness, why it matters.>

## Main idea
## Key findings — claims ledger
| # | Claim | Evidence (fig/panel) | Grade | Reviewer | Confidence |
## Figures
## Methods audit
## Independent reviewer
### Reviewer's conclusions (data only)
### Authors vs reviewer
## Adversarial context
### Steelman
### Red team
### Alternative explanations
### Falsifying experiment
### Literature — against / supporting
## Integrity & reproducibility
## Avenues to explore
## Open questions
## Growing ideas
- ✅ [[<idea>]] — <one-line reason>
- ⚡ [[<idea>]] — <one-line reason>
## References
### Verified
### Unverified
```

Use YAML block lists (as above) for `related`, `idea-supports`, `idea-challenges` — the learning synthesis script parses that format. Omit a key entirely if it has no entries. Idea names must match the idea note filename exactly (without `.md`).

### 8b. Mark the clip as analyzed
Add to the clip's frontmatter (edit in place, preserve everything else): `analyzed: true`, `analyzed_on: <date>`, `analysis: "[[<analysis note name>]]"`, `doi: "<doi>"` if missing.

### 8b-2. Write back-references into idea notes
For each idea connection, edit the idea note in place (append only; never rewrite its content). Use the same section headings the clipping pipeline uses, so dashboards and the Friday synthesis read both:
- Supports → section `## Supporting evidence`, marker ✅
- Challenges → section `## Challenges & counterpoints`, marker ⚡

If the section is missing, append `\n\n---\n\n## <section>` at the end of the note. Then append one line (skip if the analysis note is already linked in that idea note):

`- ✅ [[<analysis note name>]] (<analyzed_on> · paper · verdict: <verdict>) — <one-line reason>`

### 8c. Learning dashboard
Ensure `Dashboards/Learning.md` contains this section, inserted after the "This week's clips" section (add once; never duplicate; never modify other sections):

````markdown
## 📄 Papers I clipped

> Deep-read papers: verdict, one-line take, and where the independent reviewer disagreed.

```dataview
TABLE WITHOUT ID
  file.link AS "Paper",
  verdict AS "Verdict",
  reviewer_divergence AS "Reviewer Δ",
  tldr AS "TL;DR",
  analyzed_on AS "Read"
FROM "Papers/Analyses"
WHERE type = "paper-analysis"
SORT analyzed_on DESC
LIMIT 25
```

**📥 Waiting to be read**
```dataview
LIST WITHOUT ID file.link + " — clipped " + string(created)
FROM "Papers" AND -"Papers/Analyses"
WHERE !analyzed
SORT created DESC
```
````

The summary on the dashboard comes from the analysis note's frontmatter (`tldr`, `verdict`, `reviewer_divergence`), so write those carefully: they are what Diogo sees first.

### How this feeds the learning reviews (no action needed per run)
`.scripts/enrich_clippings.sh` (9:30am daily) reads `Papers/Analyses/`: the daily synthesis gets the last 7 days of analyses (tldr, verdict, reviewer divergence, idea links), and the Friday deep synthesis (`Notes/Reviews/YYYY-Wnn Deep Synthesis.md`) gets the last 14 days' TL;DR, claims ledger, independent reviewer and adversarial sections, and ends with a **📄 Papers this week** section. It keys on `type: paper-analysis` and `analyzed_on`, so those fields must always be present and correct.

## Step 9 — Report in chat

Per paper: title, verdict, the one-line TL;DR, the biggest author-vs-reviewer divergence, and the note's location. Keep it short; the note holds the detail. List any duplicates skipped, any papers blocked waiting for a PDF, and anything that could not be verified.
