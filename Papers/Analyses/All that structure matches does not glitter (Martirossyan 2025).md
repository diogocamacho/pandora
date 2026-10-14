---
type: paper-analysis
title: "All that structure matches does not glitter"
doi: "10.48550/arXiv.2509.12178"
source: "https://arxiv.org/abs/2509.12178"
authors: ["Maya M. Martirossyan", "Thomas Egg", "George Karypis", "Richard G. Hennig", "Ellad B. Tadmor", "Stefano Martiniani"]
year: 2025
venue: "arXiv (cs.LG; cond-mat.mtrl-sci)"
peer_reviewed: false
clip: "[[All that structure matches does not glitter]]"
analyzed_on: 2026-10-14
verdict: strong
tldr: "A rigorous audit showing that the standard crystal-structure-prediction benchmarks (carbon-24, perov-5, MP-20) are contaminated by duplicates and polymorph leakage and that the match-rate metric is gameable, proposing deduplicated datasets, polymorph-aware splits, and the METRe/cRMSE metrics as fixes."
reviewer_divergence: minor
tags: [paper, benchmarks, generative-models, crystal-structure-prediction, evaluation-metrics, data-leakage, machine-learning]
---

# All that structure matches does not glitter

## TL;DR & verdict
- The paper shows three concrete, quantified failure modes in crystal-structure-prediction (CSP) benchmarking: carbon-24 is only ~40% unique structures (10,153 → 4,250 after dedup); perov-5 and MP-20 contain many polymorphs that random splits leak across train/test; and the match-rate metric can be inflated by low-quality or non-diverse matches.
- **Verdict: strong.** The claims are backed by direct, reproducible analysis (StructureMatcher tolerance sweeps, re-splits, re-evaluation of DiffCSP/FlowMM/OMatG under old vs new metrics), and the proposed fixes (METRe, cRMSE, polymorph-grouped splits) are precisely targeted at the diagnosed problems. Released datasets/code under CC-BY.
- Author/reviewer divergence is **minor**: the only soft spots are (a) a slight overreach in the "first to provably demonstrate flow-dimensionality limits" framing, which rests on one carbon-NXL construction, and (b) results are shown for three models, so "the field's benchmarks are broken" generalizes beyond what is directly tested.
- Biggest weakness: the normative claim that polymorph-aware splits *improve generalization* (not just fairness) is argued from a modest METRe/cRMSE delta on a few models and could be an artifact of which compositions land where.
- Why it matters: this is a clean, transferable lesson about evaluation hygiene in generative science — duplicates, leakage, and a gameable top-line metric can make a mediocre generator look state-of-the-art. The pattern recurs in protein design, docking, and property prediction.

## Main idea
CSP asks a generative model to produce the most likely crystal structure(s) given a composition. Progress is measured by "match rate" against a held-out set using pymatgen's StructureMatcher. The authors argue the benchmarks and the metric are both broken. They diagnose: (1) duplicate structures (same crystal, different unit cell) inflate dataset size and leak identical structures across splits; (2) polymorphs of the same composition get split randomly, so a model is trained on one phase and graded on reproducing a *different* phase of the same composition — an ill-posed target; (3) match rate rewards finding any one match and ignores whether a model captures the real structural diversity, and it trades off against RMSE. Fixes: deduplicated carbon-24 variants, polymorph-grouped splits for perov-5/MP-20, and two metrics — METRe (match-every-reference, fraction of references with ≥1 valid generated match) and cRMSE (RMSE with an stol penalty for unmatched references, = METRe × (mean RMSE − stol) + stol).

## Key findings — claims ledger
| # | Claim | Evidence (fig/panel) | Grade | Reviewer | Confidence |
|---|-------|----------------------|-------|----------|------------|
| 1 | carbon-24 is ~40% unique (10,153 → 4,250) | Fig. 2 tolerance-sweep duplicate peak; dedup pipeline | direct | agrees | High |
| 2 | perov-5 (9,282 polymorph pairs) and MP-20 leak polymorphs under random split | dataset stats; split analysis | direct | agrees | High |
| 3 | Match rate is gameable; METRe + cRMSE correct it | Table 1 (carbon-24-unique: match 14.8–21.2% vs METRe 97.6–98.5%) | direct | agrees | High |
| 4 | Polymorph-aware splits improve generalization to unseen compositions | Table 1 perov-5 (cRMSE 0.253–0.425 → 0.158–0.172); Table 2 MP-20 | direct but modest | weaker than claimed | Medium |
| 5 | Performance degrades sharply with unit-cell size (flow dimensionality limit) | Table 3 carbon-NXL (N=6: 60–69% → N=8: 26–39%) | direct, narrow construction | reviewer found it over-generalized | Medium |
| 6 | Extrapolation direction matters (high→low atoms easier, 100% METRe) | Table 5 NN-split | direct | agrees | High |

## Methods audit
Strong on reproducibility: uses the field-standard StructureMatcher with explicit, independently varied tolerance parameters (stol, ltol, angle_tol) and binary search to locate duplicate thresholds (stol=0.025, ltol=0.002, angle_tol=0.4). Dedup clustering is transparent (pairs appearing in all three tolerance lists). Three generative models evaluated (DiffCSP, FlowMM, OMatG with several interpolant variants) across old and new datasets/metrics — a real cross-model check, though all three are recent diffusion/flow models, so results don't speak to older baselines. Tolerance-sensitivity appendix (stol dominates) is good practice. No statistical uncertainty bands on match/METRe rates are reported, which matters for the "polymorph splits improve generalization" claim where the deltas are small.

## ML/computational audit
This paper *is* a leakage/benchmark audit, so the relevant checks are self-reflexive and well-handled: it is the duplicate/polymorph leakage itself that the authors expose and fix. The cRMSE formula is principled — it removes the match-rate/RMSE tradeoff by penalizing unmatched references with the tolerance threshold rather than ignoring them. One residual concern: METRe (every-reference matching) could in principle be inflated by a model that over-generates diverse structures, since more generated candidates raise the chance each reference finds *some* match; the paper controls per-reference best-match RMSE, which mitigates but does not fully close this. The carbon-NXL "dimensionality" claim is constructed from a single structure re-expressed in many unit cells, so it isolates the effect cleanly but is a narrow basis for a field-wide conclusion.

## Independent reviewer
### Reviewer's conclusions (data only)
From Tables 1–5 and Fig. 2 alone, blind to the abstract: (1) The duplicate finding is unambiguous — the low-tolerance match peak (Fig. 2) and the 10,153→4,250 reduction are direct measurements. (2) The gap between standard match rate (14.8–21.2%) and METRe (97.6–98.5%) on carbon-24-unique (Table 1) is the single most important number: it demonstrates that the *same generations* look like failure or near-total success depending solely on the metric. That is a metric artifact, proven. (3) The polymorph-split "generalization" improvement (perov-5 cRMSE dropping from ~0.25–0.43 to ~0.16–0.17) is real but small and shown for few models; I would grade it "fairer evaluation" with higher confidence than "better generalization." (4) The carbon-NXL size-degradation (60–69% → 26–39% from N=6 to N=8) is a clean controlled result but, by construction, about one structure — "cannot determine" whether it generalizes to arbitrary chemistries. Most serious weakness: no error bars, so small cross-metric deltas are hard to trust. Missing experiment: repeat the polymorph-split comparison with multiple seeds and report variance.

### Authors vs reviewer
| Claim | Authors | Reviewer | Agreement |
|-------|---------|----------|-----------|
| carbon-24 ~40% unique | Core finding | Directly confirmed from Fig. 2 / dedup | agrees |
| Match rate is a metric artifact | Central thesis | Confirmed — the 15% vs 98% split is decisive | agrees |
| Polymorph splits improve generalization | Stated as a benefit | Fairer, yes; "improve generalization" overstates a small delta | weaker than claimed |
| Flow dimensionality limits performance ("first to provably demonstrate") | Emphasized | True for the carbon-NXL construction; over-generalized as a field law | weaker than claimed |
| New metrics should be field standard | Recommendation | Reasonable; METRe's over-generation sensitivity deserves a caveat | reviewer found something authors didn't emphasize |

## Adversarial context
### Steelman
This is model-evaluation epistemology done right: it doesn't propose a shinier generator, it shows that the ruler is bent. The carbon-24 dedup and the match-rate-vs-METRe gap are the kind of findings that silently invalidate a swath of prior "SOTA" claims, and the fixes are concrete and released. The lesson transfers wholesale to any generative-science benchmark.

### Red team
The paper proves the metrics and datasets are flawed but only lightly demonstrates that its replacements are *better* in a predictive sense rather than merely fairer. Without error bars, the "polymorph splits improve generalization" and some cross-model orderings are shaky. And METRe introduces its own exploit (reward diverse over-generation).

### Alternative explanations
The improved numbers under polymorph-grouped splits might reflect easier test subsets (polymorphs concentrated in training) rather than genuinely better learning — a selection effect, not a generalization gain. The size-dependent degradation could be an optimization/sampling artifact of these specific flow models, not a fundamental dimensionality limit.

### Falsifying experiment
Re-run the three models under polymorph-aware splits with ≥5 seeds and matched test-difficulty; if the cRMSE advantage vanishes within error bars, the generalization claim falls while the fairness/leakage claims stand untouched.

## Avenues to explore
- The generalizable thesis — *the evaluation layer, not the generator, often decides the apparent winner* — is directly portable to protein/binder design and docking, where match-rate-style top-line metrics and leaky splits are rampant.
- METRe/cRMSE analogues for protein-design success (designed vs native backbone, scoring-function-conditioned) could expose the same metric-gaming in that field.
- A reusable "benchmark-contamination audit" service (dedup + leakage + metric-sensitivity sweep) as a product wedge for any generative-science domain.

## Growing ideas
- ✅ [[2026-10-03 scoring-function-oracle]] — Direct empirical support for the generalized thesis: the authors show the *evaluation metric and data split* (not the generative model) explain most of the apparent performance variance in CSP — the same "the triage/scoring layer dominates, not the generator" claim the oracle makes for binder design.
