---
type: paper-analysis
title: "ddkg.skill: A Compositional Agent Skill for Translating Biomedical and Bioinformatics Questions into Cypher for the Data Distillery Knowledge Graph"
doi: "10.64898/2026.09.26.754400"
source: "https://www.biorxiv.org/content/10.64898/2026.09.26.754400v1"
authors: ["D. M. Taylor", "A. Lahiri", "B. Stear", "T. Mohseni Ahooyi", "J. C. Silverstein", "et al."]
year: 2026
venue: "bioRxiv"
peer_reviewed: false
clip: "[[ddkg.skill A Compositional Agent Skill for Translating Biomedical and Bioinformatics Questions into Cypher for the Data Distillery Knowledge Graph]]"
pdf: "[[ddkg skill Cypher.pdf]]"
analyzed_on: 2026-10-06
verdict: mixed
tldr: "A well-documented, reproducible Agent Skill that packages release-pinned knowledge of a biomedical knowledge graph so an LLM composes valid Cypher — demonstrated to work on a handful of executed cases but never quantitatively shown to outperform a skill-less LLM."
reviewer_divergence: minor
tags: [paper, agent-skills, knowledge-graph, text-to-cypher, llm, biomedical-data]
---

# ddkg.skill: Compositional Agent Skill for Biomedical Text-to-Cypher

> Batch note: independent-reviewer step folded into the analyst's data-only pass for this 8-paper run. Directly relevant to the agent-skills work in this vault.

## TL;DR & verdict
- An engineering/systems **descriptive** paper (not a benchmark). It packages release-specific knowledge of the Data Distillery Knowledge Graph (DDKG, Dec 2025 release) as an Agent Skill — a SKILL.md controller, a compositional library of reference docs/tables, validated query patterns, a routing table, and a `route.py` link-checker — so a general LLM composes Cypher the user runs themselves (no live KG connection; important for firewalled installs).
- **Verdict: mixed** — solid as an engineering artifact and an honest write-up; weak as empirical evidence that the skill *helps* vs a naive LLM.
- The "evaluation" is a behavioral nine-test series (5 of 7 relevant "correct") + three executed demo use cases. **No paired baseline** (same LLM without the skill), which the authors explicitly concede.
- The most valuable contributions are diagnostic: the skill surfaced its own **false reference statements and silently-empty queries** via execution, and the methodological finding that **positive checkable rules survive in a skill far better than negative "be careful" cautions** (which should be pushed into executable checks).
- Reproducibility is unusually strong for a preprint: public repo, SHA-256-checksummed archive, file/routing counts, exact DDKG release, Neo4j version, preserved historical test record.

## Main idea
A large biomedical property graph is hard to query because release-specific identifiers, source conventions, relationship directions, and binning cannot be inferred from Cypher syntax or the biology. The authors encode this version-pinned procedural knowledge as a compositional skill: the controller routes a question to only the relevant pieces via typed links (`answers`, `must_read_with`, `demonstrated_by`, `invalidated_by`, `supersedes`), keeping context small and avoiding "concept bleed." The skill composes queries and diagnostics but deliberately does not connect to the KG; the user executes against their own Neo4j/DDKG instance.

## Key findings — claims ledger
| Claim | Evidence | Grade | Confidence |
|---|---|---|---|
| Skill lets a general LLM generate executable DDKG Cypher | 3 use cases executed on live DDKG (181 / 2,500-unique / 131 rows; Figs 1–3) | demonstrated (anecdotal) | high |
| 5/7 relevant nine-test questions produced correct executed results | Testing section; detail in Supp S1 (not in main text) | partial (self-reported, no in-paper artifact) | medium |
| Compositional design avoids concept bleed | argued by analogy to [13,14]; not measured | asserted | medium |
| Skill exposed its own errors (false refs, empty queries, bad assumptions) | Testing/failure sections | demonstrated | high |
| No outperformance claim — no baseline | Discussion states eval is behavioral, not paired | N/A (honest) | high |
| Reproducible: public repo + checksummed archive | Software availability (GitHub TaylorResearchLab/ddkg-agent; SHA-256; 38 files) | supported (repo not independently verified) | med-high |

## Methods / eval audit
- **Eval set:** 3 hand-picked executed demos + a purposive nine-question series built around sources *absent* from the worked examples. Small, purposive, not random/representative.
- **Baselines: none.** No naive-LLM-without-skill arm; no alternative text-to-Cypher tool run (CypherBench/Mind-the-Query/BioCypher cited only as related work). Acknowledged.
- **Metrics:** informal — "correct executed result" (5/7 relevant) = the query ran and returned the intended row grain, NOT verified-correct biology; plus qualitative failure categories. No accuracy %, execution-success rate, or hallucination/invalid-query rate.
- **Failure analysis:** a genuine strength — documents that false reference statements producing silently-empty results "survived several rounds of review" and were caught only by execution; the positive-rules-beat-negative-cautions finding is the reusable lesson.
- **Reproducibility:** strong — public repo, R7 skill, SHA-256-checksummed single archive (303,258 bytes, 38 files), exact release `DataDistillery_2025_04_DEC`, Neo4j 5.26.28, full Cypher in Supp S1, preserved complete record. Caveat: DDKG access is institutional; repo not independently verified as populated.
- **Availability/COI:** code claimed real + specific; Supp S1 (the core eval artifact) lives outside the main PDF. Funding/COI not reported.

## Independent-skeptic pass — divergences
- **Demonstrated:** the skill produced Cypher that executed and returned non-empty, provenance-tagged results on 3 cross-domain questions and ~5/7 relevant novel ones, and demonstrably exposed its own errors under execution.
- **Not demonstrated:** that it improves correctness / reduces hallucination / raises execution success *relative to the same LLM without the skill*. No baseline = the central value proposition is untested (authors say so).
- **Soft spots:** "correct" ≠ biologically correct (no answer key for the 181/131 gene sets); use case 2's counts come from an intentionally capped 5,000-row slice; the 5/7 denominator excludes 2 questions the skill itself scoped out (mild circularity); inventory counts describe coverage potential, not tested behavior.
- Framing is refreshingly non-inflated; the gap is between the abstract's confident tone and thin, baseline-free evidence.

## Adversarial context
- **Steelman:** for a firewalled, release-versioned KG, the hard part is knowing which of 289 sources names a relationship, inverse-pair directions, and binning that changes between releases — knowledge absent from base models and from Cypher itself. Packaging it as a checksummed, auditable skill with provenance links is a legitimately useful pattern, and the honest failure analysis beats a shiny accuracy number.
- **Red team:** no baseline, no accuracy metric, n≈3 demos + 9 purposive tests, correctness = "ran and returned expected grain," no in-paper results table, generalization untested, single lab/graph, self-defined scope.
- **Alternative explanation:** a capable LLM given *any* well-structured DDKG reference dump might produce the same queries — the paper can't distinguish "the skill helped" from "a strong model + good context helped." The compositional/anti-concept-bleed benefit is borrowed from [13,14], not shown here.
- **What would convince:** paired design (same LLM ± skill) on a 50–100 question bank, blinded grading of execution success / row-grain correctness / answer correctness vs a key, plus hallucinated-identifier and invalid-query rates, across ≥2 LLMs and a second KG.
- **Novelty:** modest but real — the specific application of a compositional, release-pinned, no-live-connection skill pattern to a large biomedical graph, plus the positive-rules-beat-cautions finding. Prior art: CypherBench, BioCypher, SkillsBench, Neo4j skills.

## Integrity & reproducibility
Preprint, not peer-reviewed, CC-BY 4.0, posted 2026-10-02. Code claimed real + specific (GitHub TaylorResearchLab/ddkg-agent, SHA-256, byte/file counts) — a good-faith signal; not independently verified. Core eval in Supp S1 (outside main PDF). Funding/COI not reported. Corresponding: taylordm@chop.edu (CHOP).

## Avenues to explore
- **Directly useful here:** the paper's design lessons map onto the skills in this vault — release-pin procedural knowledge, prefer positive checkable rules, push negative cautions into executable checks (`route.py`-style), keep context small via routing. A concrete template for authoring robust agent skills over structured biomedical data.
- The missing paired evaluation is exactly the experiment to run if we ever want to *claim* a skill helps, not just assert it.

## Growing ideas
No forced `ideas/` link. Most relevant to the user's own agent-skill tooling practice (process, not a venture thesis); noted in Avenues rather than as a support/challenge.

## References
### Verified
- This paper: Taylor et al., 2026, bioRxiv — https://doi.org/10.64898/2026.09.26.754400 (read in full; main text, Supp S1 not inspected).
### Unverified (do not cite until checked)
- Cited within: Lobentanzer 2023/2025 (BioCypher); Feng 2025 (CypherBench); Chauhan 2025 (Mind the Query); Mohseni Ahooyi 2025 (Data Distillery); Stear 2024 (Petagraph); Agent Skills spec [11]; SkillsBench/SWE-Skills-Bench [13,14] (several arXiv IDs appear future-dated as printed) — not independently verified.
