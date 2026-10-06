---
type: paper-analysis
title: "Evidence Scaling for Zero-Shot Protein Reasoning with Large Language Models"
doi: "10.64898/2026.09.27.754822"
source: "https://www.biorxiv.org/content/10.64898/2026.09.27.754822v1"
authors: ["Z. Hao", "C. Wang", "D. Li", "Y. Wang"]
year: 2026
venue: "bioRxiv"
peer_reviewed: false
clip: "[[Evidence Scaling for Zero-Shot Protein Reasoning with Large Language Models]]"
pdf: "[[Evidence Scaling Protein Reasoning.pdf]]"
analyzed_on: 2026-10-06
verdict: mixed
tldr: "A frozen LLM ranks protein variants substantially better when given correctly-assigned structural/evolutionary evidence in-prompt (with a strong shuffle control), but this is evidence conditioning not 'reasoning', it still trails top specialists, and main-benchmark contamination is unresolved."
reviewer_divergence: minor
tags: [paper, protein-language-models, llm, variant-effect, proteingym, ml-evaluation]
---

# Evidence Scaling for Zero-Shot Protein Reasoning with LLMs

> Batch note: for this 8-paper run the independent-reviewer step was folded into the analyst's adversarial/data-only pass rather than a separate blinded agent. Flagged for transparency; happy to run a strict blinded review on request.

## TL;DR & verdict
- "Evidence scaling" is **not** agentic retrieval or test-time compute. It is pre-computed structural + evolutionary annotations rendered as text ("BioEvidence" blocks) inserted into a frozen LLM's prompt for ProteinGym variant ranking. Coverage of candidates with evidence is the knob.
- **Verdict: mixed.** The cleanest result is well-controlled: for GPT-5.6 Sol, correct structure+evolution evidence raises nested-macro Spearman from 0.321 (none) to 0.434, while a **shuffled control (same content, wrong candidate assignment) drops to 0.234 — below baseline.** That rules out "longer prompt / biological vocabulary" as the explanation.
- **"Reasoning" is not demonstrated.** Scoring is deterministic Spearman vs measured fitness; the only mechanism-adjacent analysis is disclaimed in-text as "does not identify an internal reasoning mechanism." This is conditioning, not reasoning.
- LLM arms **still lose to the best specialists** on matched coverage (Claude Opus 5 −0.048 vs VenusREM; GPT-5.6 Sol·max·SE last of 14 in the ρ≥0.45 band). "Narrows the gap" is accurate; "reaches specialists" overstates the paper's own tables.
- **Contamination under-addressed:** ProteinGym assays, AlphaFold structures, and MSAs are public and almost certainly in pretraining; the only mitigation (25 post-cutoff assays) is called "preliminary" and is confounded by shallow alignments.

## Main idea
Holding model and task fixed, how much does a frozen general-purpose LLM improve at protein variant ranking when handed explicit biological evidence in-prompt, versus adapting parameters? BioEvidence converts standard tool outputs (DSSP secondary structure/RSA, AlphaFold pLDDT/contacts, alignment frequencies/entropy) into per-site blocks. They vary coverage (0–100%), modality (S/E/SE), and a shuffle control (SH) across six frontier LLMs, and frame "evidence availability" as a third scaling axis alongside model size and inference compute (while repeatedly flagging the causal/transfer claims as exploratory).

## Key findings — claims ledger
| Claim | Evidence | Grade | Confidence |
|---|---|---|---|
| Performance rises monotonically with evidence coverage (0.322→0.433) | Fig 2a | direct (1 model, 1 effort) | high |
| Correct candidate correspondence matters: SE 0.434 vs R 0.321 vs SH 0.234 | Table 1 | direct — strongest control | high |
| Structure and evolution help separately, combine best | Table 2 | direct (single model, unadjusted CIs) | med-high |
| Evidence narrows specialist gap; Opus 5 above 91/95 predictors | Fig 3; Table 5 | indirect (own-coverage, cross-channel) | medium |
| LLM arms still below top specialists on matched panel | Table 3 | direct | high |
| Improvement persists past knowledge cutoff | §5.4, Table 6 | asserted/indirect (n=25, confounded) | low |
| Evidence can substitute for reasoning effort | Fig 4, §5.5 | direct (GPT-5.6 Sol only; Opus 4.8 n.s.) | medium |
| Gains exceed a mechanical evolutionary-fusion baseline | Fig 5, Table 7 | indirect (2 of 6 models; n=6) | low-med |
| "Reasoning" occurs | — | asserted (authors disclaim) | very low |

## Methods & ML audit
- **Benchmark:** ProteinGym substitution, PG-LLM episode protocol — 217 assays × 3 draws × 50 candidates = 651 episodes. Candidate IDs anonymized (good — limits ID lookup). Metric: nested-macro Spearman, deterministic, **no LLM judge** (good), 10k paired bootstrap CIs (not multiplicity-adjusted).
- **Contamination:** primary risk, under-mitigated. Anonymizing IDs doesn't stop recognition of famous proteins (BRCA1 appears verbatim in the prompt example). Post-cutoff set is 25 assays, cross-channel, with evolutionary signal degraded 0.238 by alignment shallowness — authors concede it "cannot establish related proteins were absent from training."
- **Baselines:** strong and current (VenusREM 2025, ProSST, S3F-MSA, ESCOTT, PoET, GEMME, ESM2/3, SaProt, VespaG, RSALOR). A mechanical evolutionary-rank-fusion baseline is a thoughtful "is prompting better than a one-line rule" control — and 4 of 6 models barely beat it.
- **Integrity positives:** excluded a published condition after a served-model audit found model substitution; reported refusals by taxonomy; channel calibration (their channel scores GPT ~0.04–0.06 lower — conservative for GPT).
- **Tuning-on-test:** fusion weights/"best-weight envelope" chosen using benchmark correlations (post-hoc); primary α=0.5 fixed a priori (cleaner).
- **Availability:** a detailed code package is described (scripts, seeds, frozen snapshots) but **no repo URL in the text** — asserted, not verifiable. Funding/COI not located.

## Independent-skeptic pass — divergences from the framing
1. **"Reasoning"** (title) vs deterministic rank correlation with no mechanism probe. Biggest word↔data gap.
2. **"Reach strong specialized predictors"** (abstract) vs Table 3 showing every LLM arm below VenusREM/ProSST.
3. **"Persists past cutoff"** vs a thin, confounded 25-assay result the Limitations walk back.
4. **"Evidence scaling" as a scaling axis** vs a 5-point curve for one model; authors deny a scaling law.
Net: internal results are honest and well-controlled; the abstract/title inflate along those three axes, and the Discussion walks nearly all of it back.

## Adversarial context
- **Steelman:** unusually disciplined prompt-augmentation study; the shuffle control is the right control and it works; refuses to score refusals as zero; caught a served-model substitution.
- **Red team:** headline causal claim rests on one model at one effort; "reasoning" disclaimed; contamination never closed; for most models the LLM barely beats a one-line evolutionary heuristic.
- **Alternative explanation:** the LLM acts as a soft re-weighter of injected evolutionary frequencies plus memorized knowledge of famous proteins — transcription + recall, not integration. Consistent with near-equality to the fusion baseline.
- **Falsifying experiment:** run the SE-vs-R-vs-SH contrast on proteins with zero public assay/structure/MSA footprint, deep alignments, same-channel. If the +0.11 SE gain survives, "evidence conditioning" is robust; if it collapses to fusion, it's recall + frequency transcription.
- **Novelty:** the framing (isolating evidence availability from retrieval/tool-selection, with a correspondence-shuffle control) is plausibly novel vs ReAct/Toolformer/PG-LLM; components incremental. Not verified.

## Integrity & reproducibility
Preprint, not peer-reviewed, CC-BY-NC-ND, posted 2026-10-01. Code described in detail but no public URL in text. Data: ProteinGym (public). No LLM judge. Funding/COI not reported in pages read.

## Avenues to explore
- The clean re-analysis: does the +0.11 evidence gain survive on genuinely uncontaminated proteins? That's the whole ballgame.
- Reusable mental model: "LLM + pre-computed evidence" is a fast, fine-tuning-free baseline and orchestration layer, not a replacement for specialists — and a template for how the crew should treat LLM-plus-tools claims.

## Growing ideas
No forced connection to the `ideas/` vault. Methodologically adjacent to any "use an LLM as a protein scoring/oracle layer" thinking, but I did not assert a specific idea link without reading those notes.

## References
### Verified
- This paper: Hao, Wang, Li, Wang, 2026, bioRxiv — https://doi.org/10.64898/2026.09.27.754822 (read in full).
### Unverified (do not cite until checked)
- Cited within the paper: Arora 2026 (PG-LLM); Notin 2023 (ProteinGym); Tan 2025 (VenusREM); Li 2024 (ProSST); Jumper 2021 (AlphaFold); and others — not independently verified.
