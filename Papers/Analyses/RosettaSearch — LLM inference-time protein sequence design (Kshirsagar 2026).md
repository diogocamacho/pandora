---
type: paper-analysis
title: "RosettaSearch: Multi-Objective Inference-Time Search for Protein Sequence Design"
doi: "10.48550/arXiv.2604.17175"
source: "https://www.alphaxiv.org/abs/2604.17175"
authors: ["Meghana Kshirsagar", "Allen Nie", "Ching-An Cheng", "Fanglei Xue", "Rahul Dodhia", "Juan Lavista Ferres", "Kevin K. Yang", "Frank DiMaio"]
year: 2026
venue: "arXiv (preprint)"
peer_reviewed: false
clip: "[[RosettaSearch Multi-Objective Inference-Time Search for Protein Sequence Design]]"
analyzed_on: 2026-10-14
verdict: solid
tldr: "An LLM-as-optimizer inference-time loop that reads RosettaFold3 structural feedback and rewrites inverse-folding sequences roughly triples design success rate over LigandMPNN, with gains that survive an independent structure oracle — but on very low absolute success rates and a small, selectively hard test set."
reviewer_divergence: minor
tags: [paper, protein-design, inverse-folding, llm-optimizer, inference-time-search, structure-prediction]
idea-supports:
  - "[[2026-10-03 scoring-function-oracle]]"
  - "[[2026-10-03 plm-novelty-oracle]]"
idea-challenges:
---

# RosettaSearch: Multi-Objective Inference-Time Search for Protein Sequence Design

## TL;DR & verdict
- **Main result:** Wrapping an off-the-shelf reasoning LLM (o4-mini, Gemini-3) in a search loop that reads RosettaFold3 (RF3) structural feedback and proposes mutations raises inverse-folding design success from 7.9% to 21.6% on ~400 hard PDB monomers (~2.5×), with no model retraining.
- **Verdict — solid:** The core claim (LLM-as-optimizer beats single-pass LigandMPNN on refinement, and beats a random-mutation baseline given identical feedback) is directly supported and the cross-oracle check guards against the most obvious failure mode. Downgraded from "strong" because absolute success rates are low (21.6% RF3; 6.7% Chai-1), the headline set was deliberately selected for low baseline fidelity, and the senior human-expert audit found LLM reasoning valid only 56% of the time.
- **Biggest author/reviewer divergence (minor):** The data-only read lands on the same conclusions but reframes the "2.5× success" headline as "2.5× of a small number" — the Chai-1 absolute rate (6.7%) is the honest operating point, and the framing of "learning genuine structural principles" overstates what a preserved relative gain demonstrates.
- **Biggest weakness:** Low absolute success + single-sequence-per-backbone objective (no diversity) + preprint, not peer-reviewed. The random-mutation ablation is the single most load-bearing control and it does the heavy lifting.
- **Why it matters:** This is a clean, generalizable instance of inference-time scaling applied to a scientific design loop — the LLM is a black-box optimizer over rich textual feedback from a physics-like oracle, requiring zero gradient access or retraining. For a protein-design platform it is a cheap "refinement layer" bolted onto any inverse-folding model.

## Main idea
Deep inverse-folding models (ProteinMPNN, LigandMPNN) are single-pass: they emit a sequence for a target backbone with no mechanism to check that the sequence actually refolds to that backbone, so a meaningful fraction of designs fail a downstream structure-prediction filter. RosettaSearch reframes sequence design as inference-time multi-objective search: an LLM proposes mutations, RF3 scores the resulting predicted structure against the target (TM-score, pLDDT, Cα-RMSD, combined into a weighted reward), and localized textual feedback ("residues 45–52 misaligned") is fed back for the next iteration. A "Priority Search" (beam-like: top-K=3 kept, N=2 proposals each, three edit-size regimes) under a fixed ~75-evaluation budget avoids premature convergence. The pitch is that general reasoning LLMs can act as competent optimizers over structured scientific feedback without any domain fine-tuning.

## Key findings — claims ledger
| # | Claim | Evidence (fig/panel) | Grade | Reviewer | Confidence |
|---|-------|---------------------|-------|----------|------------|
| 1 | ~2.5× success-rate gain over LigandMPNN on hard monomers (7.9%→21.6%, RF3) | Results; success-rate table | direct | agrees (notes low absolute base) | High |
| 2 | Gains survive an independent oracle (Chai-1: 3.1%→6.7%) | Chai-1 validation | direct | agrees — but 6.7% is the true operating point | High |
| 3 | LLM reasoning is the active ingredient, not the feedback loop per se (random-mutation baseline given identical feedback does not improve, 7.9%) | Random-mutation ablation | direct | agrees — strongest control in paper | High |
| 4 | Generalizes to de novo Dayhoff backbones (ProteinMPNN 72.4%→89.5% success-rate-1) | Dayhoff results | direct | agrees | High |
| 5 | Performance scales with LLM reasoning capability (o3-mini 12.3% < Gemini-3 19.4% ≈ o4-mini 20.5%) | Cross-model table | indirect | agrees — 3 points, trend not a law | Medium |
| 6 | Priority Search beats sequential revision (TM +50.9% vs +35.5%) | Algorithm comparison | direct | agrees | High |
| 7 | VLM multimodal feedback is competitive (RF3 16.6% vs 17.4% text) | VLM extension | indirect | weaker than claimed — parity, not benefit; "richer CoT" is qualitative | Medium |
| 8 | LLM "learns genuine structural principles" | Cross-oracle + CoT inspection | asserted | not supported as stated — expert audit: reasoning valid 56% | Low |

## Methods audit
- **Test sets:** ~400 PDB monomers (randomly sampled from PDB-D, then **selected for low single-sequence fidelity** — i.e. deliberately the cases where LigandMPNN fails); 275 Dayhoff de novo backbones (RFDiffusion + ProteinMPNN); 50 BindCraft binders. The selection bias toward hard cases inflates the relative-improvement headline and must be read as "rescue of near-misses," not average-case lift.
- **Oracles:** RF3 as the in-loop reward oracle; Chai-1 held out as an independent evaluator — a genuine guard against reward hacking, though both are deep structure predictors and could share systematic blind spots (neither is wet-lab validation).
- **Budget / compute:** 75 evaluations/protein, ~30.6 min wall-clock/protein, dominated by RF3 inference. No wet-lab validation anywhere — all "success" is in-silico refold agreement.
- **Baselines:** LigandMPNN single-pass; native sequence (7.0%); random-mutation-with-feedback (7.9%). The random-mutation control is the key evidence that the LLM, not the loop, drives gains.
- **Ablations (Table 7):** reward-only 9.3% → +detailed feedback 11.4% → +native-seq context 17.2%; adding function annotations (17.4%) and RAG (16.1%, declined) gave nothing. Honest reporting of a negative RAG result.
- **Stats:** Success defined by thresholds (pLDDT & TM-score ≥ 0.8); no error bars / CIs / significance tests reported on success rates in the extracted material. Single-sequence-per-backbone; no diversity objective (stated limitation).
- **Human audit:** Senior-author / Gemini-3 cross-check found LLM structural reasoning valid only ~56% of the time, with a recurring fixed-pattern bias toward N-terminal loops.

## Independent reviewer
### Reviewer's conclusions (data only — Methods/Results/tables, blind to abstract framing)
1. On a set of inverse-folding designs preselected to fail a structure-prediction filter, an iterative LLM-proposes / RF3-scores loop increases the fraction passing a TM/pLDDT≥0.8 threshold from 7.9% to 21.6% under RF3 and from 3.1% to 6.7% under a held-out oracle (success tables). The relative gain is real; the absolute operating point is low.
2. The gain is attributable to the LLM's interpretation of feedback, not the loop: a random-mutation agent with identical oracle access does not improve (7.9%) (ablation). This is the strongest, cleanest result.
3. The method generalizes beyond native backbones — de novo Dayhoff backbones improve 72.4%→89.5% (success-rate-1) — and to already-optimized BindCraft binders (small but consistent metric gains, pockets retained). (Dayhoff/BindCraft tables.)
4. A reasoning-capability gradient is visible across three models (12.3%/19.4%/20.5%) but three points do not establish scaling as a law. (Cross-model table.)
5. Cannot determine, from data, whether the LLM has learned transferable "structural principles": the expert audit scoring reasoning valid ~56% of the time is near coin-flip, and cross-oracle preservation only shows the edits aren't RF3-specific artifacts, not that the reasoning is mechanistically sound.
- **Most serious weaknesses:** no wet-lab validation; hard-selected test set; low absolute success; no statistical uncertainty on headline rates; single-sequence objective.
- **Missing experiments that would change assessment:** experimental expression/fold validation of a sample of rescued designs; a non-selected (average-case) monomer set; success rates with CIs; an oracle from a third architecture family.

### Authors vs reviewer
| Claim | Authors | Reviewer | Agreement |
|-------|---------|----------|-----------|
| 2.5× success improvement | Headline framing | Real, but 2.5× of 7.9%; honest operating point is Chai-1 6.7% | weaker than claimed |
| Gains are not reward-hacking | Cross-oracle preserved | Agrees it's not RF3-specific; not proof of correctness | agrees |
| LLM reasoning is the active ingredient | Random-mutation baseline | Strongest result; fully supported | agrees |
| LLM learns genuine structural principles | Asserted | 56% expert-valid reasoning undercuts this | not supported |
| Scales with reasoning capability | Stated as trend | 3 points — suggestive, not established | reviewer more cautious |
| VLM extension adds value | Framed as contribution | Parity with text, not a gain | weaker than claimed |

**Reviewer divergence summary: minor.** Same conclusions; the reviewer deflates two framings (absolute magnitude; "genuine principles") and downgrades the VLM extension from benefit to parity.

## Adversarial context
### Steelman
This is the right shape for applying inference-time scaling to design: a general optimizer (the LLM) driven by rich, localized feedback from a cheap structural oracle, with zero retraining, that plugs onto any inverse-folding backbone. The random-mutation ablation is a genuinely strong control, the negative RAG result is honest, and the cross-oracle check is exactly the discipline the field usually skips. As LLM reasoning and structure predictors both improve, this layer improves for free.

### Red team
Everything is in-silico. "Success" means two deep structure predictors agree a sequence refolds to the target — a weak proxy for a protein that actually expresses, folds, and functions. The headline set was chosen to be hard, so 2.5× is a rescue statistic, not a throughput number. Absolute success under the independent oracle is 6.7%. The expert audit says the model's structural reasoning is valid barely more than half the time, which means the "reasoning" may be partly post-hoc narration over edits that RF3 happened to reward. No statistical uncertainty is reported on any headline rate.

### Alternative explanations
The gains may reflect the LLM efficiently exploring sequence space near the target rather than any structural understanding — a smarter-than-random local search whose "feedback interpretation" is really just biasing proposals toward high-reward directions. The reasoning-capability gradient could track general instruction-following / constraint-satisfaction rather than protein-specific competence.

### Falsifying experiment
Express and characterize (fold + function) a blinded, matched set of RosettaSearch-rescued vs. LigandMPNN-baseline designs. If in-silico "success" does not translate to a higher wet-lab fold/function rate, the method's practical value collapses regardless of the in-silico deltas.

## Avenues to explore
- Swap RF3 for a diversity-aware or ensemble oracle and add a diversity objective (the stated limitation) to produce candidate sets, not single sequences.
- Test whether the LLM transfers across oracle families (train-loop on RF3, evaluate on Chai-1 and a third) to probe "genuine principles" vs. oracle-specific hill-climbing.
- Quantify how much of the gain is recoverable by a cheap non-LLM optimizer (CMA-ES / simulated annealing) given the same feedback — isolates the LLM's marginal value.
- Relevant to a scoring/oracle-centric platform: this is a concrete template for an LLM wrapper that turns any differentiable-or-not scorer into a design loop.

## Growing ideas
- ✅ [[2026-10-03 scoring-function-oracle]] — Demonstrates an LLM-driven optimization loop built entirely around a structural scoring oracle (RF3) with a held-out oracle (Chai-1) as the honesty check; a working instance of oracle-centric design and of guarding against reward-hacking the scorer.
- ✅ [[2026-10-03 plm-novelty-oracle]] — Supports the broader thesis that model-based oracles can gate/steer sequence generation at inference time without retraining; the random-mutation ablation shows the oracle-plus-reasoner, not the oracle alone, is what adds value.
