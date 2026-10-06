---
type: paper-analysis
title: "Repurposing PeTriBERT for Protein–Protein Interaction Prediction with Sequence–Structure Fusion"
doi: "10.64898/2026.09.29.755338"
source: "https://www.biorxiv.org/content/10.64898/2026.09.29.755338v1"
authors: ["Arthur Wavreille", "Gabriel Krouk", "Baldwin Dumortier"]
year: 2026
venue: "bioRxiv"
peer_reviewed: false
clip: "[[Repurposing PeTriBERT for Protein–Protein Interaction Prediction with Sequence–Structure Fusion]]"
pdf: "[[PeTriBERT PPI.pdf]]"
analyzed_on: 2026-10-06
verdict: mixed
tldr: "A monomer inverse-folding encoder (PeTriBERT) fused with frozen ESM-2 scores 0.963 AUROC on a balanced PINDER PPI test set, but unspecified negatives, a 50/50 balance, a single checkpoint, and borrowed baselines mean the headline numbers can't be read as real generalization."
reviewer_divergence: minor
tags: [paper, ppi, protein-language-models, structure-prediction, ml-evaluation, data-leakage]
---

# Repurposing PeTriBERT for PPI Prediction with Sequence–Structure Fusion

## TL;DR & verdict
- **What it does:** PeTriPPI2 fuses two frozen/pretrained encoders for binary PPI prediction — ESM-2 (t33_650M) on sequence, and PeTriBERT/PeTriMPOV (a 5-layer inverse-folding structural encoder that injects an SE(3)-invariant inter-residue frame bias into attention) on structure — concatenate, mean-pool, sigmoid head, fine-tuned on PINDER with ESM frozen (Fig 1–2, Sec 2).
- **Verdict: mixed.** The genuinely interesting result is the ablation: removing the PeTriBERT pathway collapses the model to random (AUROC 0.505, F1 0.118), while removing ESM-2 only drops it to AUROC 0.900. The structural encoder does the work. But every number is one checkpoint, and the evaluation design can't support a generalization claim.
- **Biggest author↔reviewer divergence (minor):** the authors are already modest ("competitive," "different precision–recall balance," not SOTA). The divergence is that even their hedged headline (AUROC 0.963) is uninterpretable — the independent reviewer and I both land on "cannot determine" because of the negative-sampling and homology-stratification gaps.
- **Biggest weakness:** the 50/50 class balance + unspecified negative-sampling scheme + leakage control that stops at interface clustering (no C1/C2/C3 or protein-level/sequence-identity stratification). All three independently push the metrics upward.
- **Why it matters to you:** it's a clean data point for "can a structure-aware encoder trained on monomers transfer to a pairwise task" (yes, suggestively), and a textbook example of why balanced-set PPI metrics overstate deployability.

## Main idea
Reuse PeTriBERT — a transformer originally pretrained for inverse folding on ~10^6 AlphaFold monomers, which encodes residue geometry as a rigid-frame attention bias rather than positional encodings — as a structural encoder for PPI, fused with ESM-2 sequence embeddings. The question is whether a monomer structural encoder transfers to a pairwise (interaction) task. Evaluated on PINDER.

## Key findings — claims ledger
| # | Claim | Evidence | Grade | Reviewer | Confidence |
|---|---|---|---|---|---|
| 1 | Both pathways contribute; structure dominates | Ablations Sec 3.2 (full F1 0.896; −ESM F1 0.820/AUROC 0.900; −PeTriBERT F1 0.118/AUROC 0.505) | direct (single checkpoint) | agrees (large effect, no variance) | medium |
| 2 | High discrimination (AUROC 0.963, AUPRC 0.946) | Sec 3.2, Table 1 | indirect | weaker than claimed | low |
| 3 | "Competitive" vs SpatialPPIv2 | Table 1 (F1 0.896 vs 0.913; prec 0.917 vs 0.886; recall 0.876 vs 0.942) | indirect | does NOT beat it; trades recall for precision | low–medium |
| 4 | Fair comparison to baselines | Table 1 caption ("comparator values reported in [30]"), Sec 3.1 ("according to the authors") | asserted | not controlled — baselines not re-run | low |
| 5 | SE(3)-invariant frame bias improves generalization | Eqs 3–4 (proof of invariance), Sec 2.3 | asserted (math only) | cannot determine (no ablation isolates it) | low |

## Figures
- **Fig 1 (architecture):** two-pathway schematic — PDB1/PDB2 → structure embedding → MLP bias; sequences → token+segment embeddings → 5-layer transformer with that bias; ESM-2 last-layer rep → dimension-adaptation; concatenate + mean-pool → FFN → sigmoid. Clear; it's a design diagram, supports no performance claim.
- **Fig 2 (frame-bias mechanism):** shows relative-frame tensor (N×N×6: centroid + Euler angles) → MLP → bias matrix B added to QᵀK attention. This is the PeTriMPOV mechanism; parallels Evoformer pair bias but single-sequence. Supports the invariance argument, not the empirical claims.
- **Table 1:** the only quantitative comparison. PeTriPPI2 tops accuracy (0.898) and precision (0.917) but SpatialPPIv2 wins recall (0.942) and F1 (0.913). Comparator rows are imported from ref [30], not re-run here.
- **No PR/ROC curves, no error bars, no per-seed results, no calibration plot anywhere.**

## Methods audit
- **Data:** PINDER, filtered to 1,603,337 pairs; forced 50/50 (801,553 pos / 801,784 neg). PDBs lacking N/Cα/Cβ excluded. Test = 2,342 pairs (confusion: 1030 TP, 146 FN, 1073 TN, 93 FP).
- **Leakage control:** interface-based clustering so structurally similar proteins go to the same split (Sec 2.1). This addresses interface-level redundancy but **not** protein/sequence-level overlap across splits, and there is no C1/C2/C3 breakdown or train↔test identity cutoff. For a 1.6M-train / 2.3k-test regime this is the decisive gap.
- **Negative sampling: unspecified.** The paper notes PPIs are sparse and "unobserved pairs are generally assumed negative" but never describes how the 801,784 negatives (train) or the test negatives were built. Random negatives are the classic inflator.
- **Balance:** 50/50 is biologically unrealistic; precision/F1/AUPRC at this prevalence don't transfer to screening prevalence (<1% positives).
- **Variance:** single checkpoint, no seeds — the authors explicitly concede "ablation checkpoints alone do not establish statistical variability across training runs" (Sec 3.2).
- **Training:** AdamW, batch 32, 1000-step warmup then linear decay to 5000 iters; "simple grid-search"; threshold for the confusion matrix unspecified (Discussion hints it wasn't calibrated).
- **Architectural gap:** to handle pairs without known quaternary pose, "anti-diagonal elements of the relative-frame attention bias [were removed] from gradient propagation," and inter-chain frame treatment "requires further specification" (Sec 2.4). How much true cross-chain geometry the model sees is unclear — central for a structure-aware PPI model.

## Independent reviewer
Spawned as a separate subagent, given the PDF with instructions to reason only from methods/results/figures (title/abstract/intro/discussion ignored). Full independence caveat: it saw one PDF rather than a stripped section set, but was not shown the authors' framing or conclusions.

### Reviewer's conclusions (data only)
1. Both pathways contribute, structure dominates (large effect, no variance) — moderate.
2. High discrimination on this set, but weak as evidence given leakage/negative-sampling/balance — weak.
3. Trades recall for precision vs SpatialPPIv2; does not beat it overall — moderate for the trade-off, cannot determine for parity.
4. Baseline comparison not controlled (values imported from [30]) — weak.
5. One checkpoint, no variance — robustness cannot be determined.

### Authors vs reviewer
| Topic | Authors | Reviewer | Status |
|---|---|---|---|
| Both pathways matter | yes | yes | agrees |
| 0.963 AUROC meaningful | presented as competitive | uninterpretable w/o C1/C2/C3 + negatives | weaker than claimed |
| vs SpatialPPIv2 | "competitive," different balance | does not beat it | agrees (authors already hedge) |
| Baselines | "same test data, per the authors" | not re-run, membership unverified | not supported |
| Robustness | conceded limitation | cannot determine | agrees |

## Adversarial context
- **Steelman:** a monomer inverse-folding encoder, never trained on complexes, carries enough geometric signal that fusing it with a frozen PLM yields a strong PPI classifier, and the ablation shows the structural pathway, not ESM, is load-bearing. That's a real, reusable insight about transfer from structure-pretraining.
- **Red team:** on a balanced set with unspecified (likely random) negatives and no protein-level homology control, a near-ceiling AUROC is the expected artifact, not evidence of binding understanding. Remove any one of {random negatives, 50/50 balance, residual homology} and the number likely drops a lot. The model also doesn't beat the method it's compared to.
- **Alternative explanation for the ablation:** removing PeTriBERT doesn't just remove structure — it removes the entire transformer trunk (ESM-2 is frozen and only dimension-adapted), so "−PeTriBERT → random" may reflect "removed the only trainable encoder," not "structure is uniquely informative." The ablation conflates modality with trainable capacity.
- **Falsifying experiment:** re-evaluate with hard/structure-matched negatives at realistic prevalence, under a strict C3 split (both proteins unseen) with a train↔test sequence-identity cap. If AUROC stays high there, the claim holds.
- **Novelty:** incremental. PLM+structure fusion for PPI is the explicit prior art (SpatialPPIv2 [30]); the novelty is specifically reusing PeTriBERT/PeTriMPOV's inverse-folding frame bias for the pairwise task.

## Integrity & reproducibility
- Preprint, not peer reviewed; v1, posted 2026-09-30; CC-BY 4.0.
- **Code:** model repo linked (github.com/Baldwin-disso/PeTriBox) and PINDER (github.com/pinder-org/pinder). Not verified here whether the repo contains full training code vs a stub.
- **Data:** PINDER is public. Specific train/val/test pair lists for this paper not stated as released.
- **Funding:** ANR (DeepPep ANR-23-CE20-0020-01); GENCI/IDRIS compute. No competing interests stated (academic).

## Avenues to explore
- The honest version of this paper is the transfer question: **how much does structural pretraining (inverse folding) buy on downstream protein tasks, controlling for trainable capacity?** That's a clean re-analysis on their released model.
- Reusable: PeTriMPOV frame-bias attention is a compact, MSA-free, SE(3)-invariant way to inject geometry into a transformer — worth knowing as a building block independent of this PPI result.
- The negatives/balance/leakage trifecta here is a reusable checklist for reading any PPI or interaction-prediction paper.

## Open questions
- How are negatives constructed, and what is performance under a strict C3 split at realistic prevalence?
- Does the "structure dominates" ablation survive when you control for trainable parameters (e.g., also unfreeze/adapt ESM)?
- What fraction of test structures are experimental vs AlphaFold-predicted, and does performance track pLDDT?

## Growing ideas
No confident connection to the current `ideas/` vault. This is a methods paper on PPI classification; it neither supports nor specifically challenges the active venture theses (target ID, causal multi-omics, generative chemistry). Logged as read; not force-linked.

## References
### Verified
- This paper: Wavreille, Krouk, Dumortier, 2026, bioRxiv — https://doi.org/10.64898/2026.09.29.755338 (read in full).

### Unverified (do not cite until checked)
- "SpatialPPIv2" / ref [30] — the direct comparator named in the paper; DOI not resolved here.
- Park & Marcotte, "Flaws in evaluation schemes for pair-input computational predictions" (the C1/C2/C3 pair-input leakage critique) — referenced from memory as the standard treatment of this problem; verify the exact citation before using it anywhere.
