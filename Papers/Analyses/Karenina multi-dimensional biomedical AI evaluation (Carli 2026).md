---
type: paper-analysis
title: "Turning Domain Expertise into Multi-Dimensional Evaluation of Biomedical AI with Karenina"
doi: "10.64898/2026.09.01.748513"
source: "https://www.biorxiv.org/content/10.64898/2026.09.01.748513v1"
authors: ["Francesco Carli", "Polina Rusina", "Lun Ai", "Sebastian Lobentanzer", "Aurelien Dugourd", "David Ochoa", "Julio Saez-Rodriguez"]
year: 2026
venue: "bioRxiv"
peer_reviewed: false
clip: "[[Turning Domain Expertise into Multi-Dimensional Evaluation of Biomedical AI with Karenina]]"
analyzed_on: 2026-10-14
verdict: solid
tldr: "Karenina is an open-source framework that turns expert free-text answers into runnable multi-dimensional evaluations (correctness, grounding, citation integrity, cost, sycophancy, agentic failure modes); applied to Open Targets QA, sycophancy scenarios, and BixBench it convincingly shows that a correctness score alone hides unsupported-but-correct answers, confident reversals under pushback, and biology-vs-compute failure conflation — a methods/tooling contribution, not a new model."
reviewer_divergence: minor
tags: [paper, llm-evaluation, agentic-ai, benchmarking, biomedical-ai, open-targets]
idea-supports:
  - "[[2026-10-08 agentic-function-map]]"
  - "[[2026-10-08 network-biology-platform]]"
idea-challenges: []
---

# Turning Domain Expertise into Multi-Dimensional Evaluation of Biomedical AI with Karenina

## TL;DR & verdict
- **Main result:** An open-source Python framework (karenina, + server + GUI) that converts an expert's plain-language description of "what a good answer contains" into runnable evaluation specs (answer templates, rubrics, multi-turn scenarios) scored on multiple dimensions. Demonstrated across three case studies of increasing autonomy: 144-item Open Targets drug-discovery QA, multi-turn sycophancy/guardrail scenarios, and a regrouped BixBench agentic-coding benchmark.
- **Verdict: solid** — the central thesis (uni-dimensional correctness scores are misleading for high-stakes biomedical AI) is demonstrated with concrete, quantified counter-examples: 10.9% of correct answers were unsupported by retrieved evidence; models abandoned correct answers under false pushback 57.4% of the time; BixBench tasks ran near-error-free code yet scored 12.9% on biological reasoning. Rigorous experimental design (6,048 answers, 42,336 judgments, 3 replicates, Bayesian contrasts). Not "strong" because it is a framework/measurement paper whose scoring depends heavily on LLM judges (reference judge = Claude Opus 4.6), creating circularity that is acknowledged but not fully resolved.
- **Biggest author/reviewer divergence (minor):** The evaluation leans on LLM-as-judge at nearly every layer (template drafting by Claude Opus 4.6, grounding/citation/failure rubrics by GPT-OSS 120B, reference judging by Claude Opus 4.6 — which is also one of the answerers). The framework measures what these judges can measure; the human-expert layer validates templates but does not re-score the 42k judgments. The "trustworthy evaluation" framing understates judge dependence.
- **Biggest weakness:** Self-preference and judge circularity. Claude Opus 4.6 is both an answerer and the reference judge; GLM-5.1 judges its own BixBench answers (authors flag possible self-preference). The headline multi-dimensional numbers are judge-derived, so their absolute values are only as trustworthy as the judges.
- **Why it matters:** For any org deploying LLMs/agents on target discovery, evidence grounding and citation integrity — not just answer correctness — determine whether you can act on an output. Karenina operationalises exactly those dimensions and is open-source infrastructure a platform could adopt directly.

## Main idea
Most LLM benchmarks extract a snippet from a long response and score only correctness, discarding whether the answer was grounded in evidence, honestly cited, cost-efficient, or produced by sound reasoning. In biomedicine a right answer for wrong reasons is dangerous. Karenina lets domain experts encode evaluation *intent* ("what to test" + "what success means") in plain language, which the framework compiles — via three sequential LLM calls plus validation and expert review — into runnable answer templates, rubrics, and multi-turn scenarios. It then runs these across QA, conversational, and autonomous-agent settings and returns a multi-dimensional profile ("ready for deployment?") fed back into a "living benchmark" loop. The contribution is the measurement machinery and the demonstration that the extra dimensions reveal failures correctness alone conceals.

## Key findings — claims ledger
| # | Claim | Evidence (fig/panel) | Grade | Reviewer | Confidence |
|---|-------|----------------------|-------|----------|------------|
| 1 | Live tool access (MCP → Open Targets) raises correctness 50.7→81.2% (7-model avg); biggest gains on Variant questions (23.8→92.4%) | Fig. 2A,B; SI 3.1 | direct | agrees | High |
| 2 | 10.9% of correct, tool-enabled answers were unsupported by retrieved evidence (265/2,441) | Fig. 2C; SI 3.6 | direct | agrees — the paper's most important finding | High |
| 3 | Tool access replaces fabricated PMIDs with a subtler failure: real papers cited for unsupported claims (+40.0 PP share of serious citation failures) | SI 3.7 | direct | agrees; citation panel is a small audited cohort (196 citations) | Medium |
| 4 | Tool use costs 24–121× more tokens per question | SI 3.2; Fig. 2 | direct | agrees | High |
| 5 | Models abandoned initially correct answers under confident false challenge 57.4% of the time (Haiku 4.5 67.9%, Qwen3.5-122B 46.1%) | Fig. 2D; SI 4.1 | direct | agrees | High |
| 6 | Guardrail model flags reversals: 85.2% agreement with reference labels, 97.2% of reversals correctly flagged | SI 4.2 | direct | agrees; guardrail is same model family as answerer | Medium |
| 7 | Graded (vs pass/fail) BixBench scoring: 47.7→59.5%, recovers 260 near-correct answers (13.9% of discarded) | SI 5.2 | direct | agrees | High |
| 8 | Agent performance is a model×harness property: GLM-5.1 49.8→65.3% switching harness; others unchanged | SI 5.1 | direct | agrees; GLM-5.1 also judges its own answers (self-preference caveat) | Medium |
| 9 | Karenina separates biological-reasoning failure from computational failure (one task 12.9% despite near-error-free code) | Fig. 2E; SI 5.4 | direct | agrees — a genuinely useful distinction | High |

## Methods audit
- **Open Targets QA:** 144 items (6 functional areas × subcategories × 3 pairs each), expert-written free-text reference answers, Karenina-drafted templates reviewed/approved by a domain expert. 7 answering models (4 open-weight Qwen/GPT-OSS + Haiku 4.5, Sonnet 4.6, Opus 4.6) × 2 regimes (parametric vs MCP) × 3 replicates = 6,048 answers; 7 judges × all answers = 42,336 judgments (21,168/regime). Temperature 0.7. Strong, well-powered design.
- **Scenario benchmark:** multi-turn sycophancy/autocorrection/guardrail on the same 144 items, restricted to Haiku 4.5 and Qwen3.5-122B; 2×2×2 factor matrix (tool access × easy/hard adversarial alternative × assertive/casual framing); adversarial alternatives generated by a Claude Opus 4.6 agent and manually curated.
- **BixBench:** original pass/fail agentic benchmark regrouped into 53 tasks / 199 answer fields (167 numeric, 32 Boolean) with graded partial-credit scoring; 3 answering models × 2 harnesses (Claude Code 2.1.146, DeepAgents 0.6.3) × 3 replicates = 18 full runs, 3,582 question-level evaluations; isolated Singularity containers, read-only verification.
- **Stats:** Bayesian mixed models (Bambi 0.17/PyMC 5.28, NUTS), posterior medians + 95% credible intervals + odds ratios. Replicate variability reported as sample SD. This is unusually rigorous for an LLM-eval paper.
- **Human layer:** experts wrote reference answers and reviewed every template (all Open Targets templates approved as drafted); a domain curator reviewed every adversarial alternative pair. Humans did **not** re-adjudicate the 42k judge decisions.

## ML/computational audit
- **Judge circularity / self-preference (the central methodological risk):** Claude Opus 4.6 drafts templates *and* serves as reference judge *and* is one of the 7 answerers. GLM-5.1 both answers and judges in BixBench (explicitly flagged). The multi-dimensional scores are LLM-judge outputs; absolute values inherit judge bias. The 7-judge panel allows agreement analysis (SI D) which partly mitigates, but the main-text numbers use the single Opus reference judge.
- **Grounding/citation rubrics** run on GPT-OSS 120B at temperature 0 — a different family from the reference judge, which reduces (not eliminates) correlated bias. Citation panel is a deterministically-sampled 72-response / 196-citation audited cohort, not benchmark-wide prevalence (authors are explicit).
- **No train/test leakage concern** (no model training); the relevant validity question is construct validity of the judges, which the paper addresses via multi-judge agreement and human template review but not via human gold-standard scoring of outcomes.
- **Reproducibility:** code open (Apache-2.0), full regeneration pipeline + locked containers deposited (figshare); Open Targets data public. Strong.

## Independent reviewer
### Reviewer's conclusions (data only)
From Results, figures/legends, and Methods (blind to abstract/intro framing):
1. **Tool access substantially improves correctness but introduces a new, subtler grounding failure.** Fig. 2A,B show the 50.7→81.2% lift; Fig. 2C and the 10.9% unsupported-correct figure show the catch. This pairing is the paper's strongest, most decision-relevant result. *Strong.*
2. **Multi-turn sycophancy is large and invisible to single-turn scoring.** 57.4% reversal under false challenge (Fig. 2D), model-dependent (68% vs 46%). Well-supported. *Strong.*
3. **Graded scoring and failure-decomposition recover information that pass/fail discards.** 47.7→59.5%, 260 near-correct recovered, biology-vs-compute separation (Fig. 2E). Useful and well-evidenced. *Strong.*
4. **Every dimension is an LLM-judge measurement.** The data do not include a human-scored gold standard for the 42k judgments; trust in absolute numbers depends on trusting the judges. *Moderate — construct validity caveat.*
5. **Scope of demonstration is narrow relative to the "universal evaluation" ambition.** Three case studies, one knowledge source (Open Targets), two models in the scenario study. *Moderate.*

Missing experiments that would change the assessment: a human-expert gold-standard re-scoring of a sample of the multi-dimensional judgments (to calibrate judge reliability on each dimension); removal of Opus-as-answerer when Opus is the reference judge (to quantify self-preference on correctness); a second knowledge domain beyond Open Targets to show the framework generalises.

### Authors vs reviewer
| Claim | Authors | Reviewer | Agreement |
|-------|---------|----------|-----------|
| Correctness alone hides failures | Central thesis | Strongly demonstrated (grounding, sycophancy, compute-vs-biology) | agrees |
| Tool access improves correctness | Shown | Confirmed | agrees |
| 10.9% correct-but-unsupported | Key finding | Reviewer rates this the single most important result | agrees (reviewer emphasises harder) |
| Evaluation is "trustworthy" | Framing | Judge-dependent; no human gold-standard rescoring | weaker than claimed |
| Framework is general/"living benchmark" | Ambition | Demonstrated narrowly (one domain, 3 case studies) | weaker than claimed |
| Guardrail reliably flags reversals | 97.2% | Confirmed but same-family judge | agrees (with caveat) |
| Self-preference | Flagged for BixBench | Reviewer extends concern to Opus reference judge | reviewer found something authors underweighted |

**Reviewer divergence summary: minor.** The empirical findings and their decision-relevance are agreed and well-supported. Divergence is about the judge-dependence of absolute scores and the gap between the "universal/trustworthy" framing and the (narrow, LLM-judged) demonstration.

## Adversarial context
### Steelman
This is the right critique of biomedical LLM evaluation and a usable answer to it. The grounding result alone — that tool use makes models *more* correct while leaving a tenth of correct answers unsupported by the very evidence retrieved, and swapping fake citations for real-paper-wrong-claim citations — is a finding anyone deploying agents on target discovery needs to internalise. The experimental scale and Bayesian analysis are well above the norm for the genre, and everything is open-source.

### Red team
It's LLM-judges all the way down. The headline multi-dimensional numbers are produced by models evaluating models, with the reference judge also an answerer and no human gold-standard rescoring to anchor the scales. "Multi-dimensional, trustworthy, living benchmark" is a framework ambition demonstrated on one knowledge base and, for the most interesting (scenario) study, two models. The contribution is real but is tooling + a demonstration, not a validated measurement instrument with known judge reliability.

### Alternative explanations
The 10.9% "unsupported-but-correct" rate could partly reflect the grounding judge (GPT-OSS 120B) failing to recognise valid support in long GraphQL/tool outputs (which the paper truncates with placeholders) rather than genuine ungroundedness. The sycophancy rate could be sensitive to the specific adversarial phrasing. Both are plausible without a human-adjudicated subset.

### Falsifying experiment
Have ≥3 domain experts independently re-score a stratified sample (say 300) of the multi-dimensional judgments blind to the judge labels, per dimension. If human–judge agreement is low on grounding/citation, the absolute numbers (and the "trustworthy" claim) don't hold; if high, the framework is validated. Separately, drop Opus from the answerer pool and re-judge with Opus to measure self-preference on the correctness axis.

## Avenues to explore
- The grounding dimension (answer correct but unsupported by retrieved evidence) is directly portable to any RAG/agentic drug-discovery system and is arguably the most valuable single check to adopt.
- The citation-integrity audit (fabricated → real-paper-wrong-claim) is a new, underappreciated failure class for literature-grounded agents.
- The biology-vs-computation failure decomposition in agentic coding is exactly the signal needed to decide "better model vs better compute environment" — a reusable triage for any autonomous-analysis platform.
- "Living benchmark" expert-in-the-loop loop is an operating model worth adopting internally for continuous eval as models change.

## Growing ideas
- ✅ [[2026-10-08 agentic-function-map]] — Karenina is concrete, open-source evaluation infrastructure for exactly the kind of autonomous biomedical agents an agentic platform would deploy, and its grounding/citation/failure-decomposition dimensions are the trust checks such a platform needs.
- ✅ [[2026-10-08 network-biology-platform]] — the Open Targets QA case study (target/disease/drug/variant/evidence questions, MCP tool access to the platform) is a direct template for evaluating a network-biology target-discovery system's answers for correctness *and* evidence grounding.
