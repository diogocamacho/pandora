# DRUID geom_tf — what counts as proof?

**Date:** 2026-09-11
**Mode:** challenge
**Status:** open — defending both package default AND biological utility

## Idea (one line)
Ship `geom_tf` as default (engineering claim) and assert it improves real therapeutic/indication recovery (biology claim).

## Load-bearing assumption under fire
Same-name leave-one-out recovery on Harmonizome CMap is a valid proxy for “better connectivity / indication ranking for real disease queries.”

## Challenge so far
- Ablation answers a **relative ranking** question among corpus weightings under a fixed scoring pipeline — not absolute biological validity.
- Decision already split: LOO winner by top-25 rule was `binary`; production choice `geom_tf` leaned on NSCLC face validity. That’s a second, softer claim that needs its own bar.
- Stouffer failure is well-supported *for this cosine+binary-query setup*; don’t overclaim it kills Stouffer in general.
- Diogo wants to defend **both** tiers → ablation is necessary for default, insufficient alone for biology.

## Split of burden
| Claim | Evidence bar |
|-------|----------------|
| Package default | Ablation + NSCLC face validity + correctness/tests — largely met |
| Biological utility | Needs external disease→drug recovery with a pre-registered success metric |

## Open questions
1. ~~What claim are we defending?~~ Both.
2. **What is the biological success criterion?** (MoA enrichment? known-indication recall@k? AUC vs annotated positives? expert panel?)
3. How to avoid circularity: validating CMap weighting with CMap-derived disease signatures.
4. Sensitivity: other corpora (LINCS), other phenotypes, FDR/calibration of null.

## Next
Force a concrete definition of biological success before designing the next study.
