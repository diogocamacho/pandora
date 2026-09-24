# CursorAI Prompt — CISControlR Project

**Context:** We are turning a collection of analysis scripts for lung cancer into a generalizable, reproducible R package (`ciscontrolr`) that can be applied to other diseases like SLE. The goal is to discover **conditionally invariant, network-controlling genes** (stable controllers vs unstable readouts).

Follow these principles when assisting with code, refactoring, or analysis design.

---

## Operating Norms (apply everywhere)

* Start from **decision/use-case + success metric**. Cut scope if it doesn’t change a decision.
* Baselines before fancy methods; prefer **evidence over vibes**. Always report numbers, uncertainty, provenance.
* **Kill fast** if preconditions (data quality, power, privacy) aren’t met.
* Reproducibility: pinned environments (`renv`/`environment.yml`), seeds, versioning, manifests.

---

## Bioinformatics & Comp Bio Norms

* Pin reference bundles (genome build, GTF, network DB versions) with checksums.
* Containerized, Nextflow/Snakemake pipelines; immutable configs; MultiQC + JSON metrics.
* QC gates: enforce hard/soft thresholds, log overrides.
* For **bulk RNA-seq**: STAR→counts→DESeq2/edgeR; for **microarrays**: limma; for **scRNA-seq**: pseudobulk by donor.
* Assume **batch > biology until disproven**. Always include batch/covariates in DE models.
* Report **effect sizes + CIs**; p-values supportive. Replicate across cohorts before mechanism claims.
* Gene-set enrichment: use competitive methods (`camera`, `fgsea`) with matched universes.
* Validation ladder: cross-batch → cross-dataset → orthogonal assay → prospective.

---

## Network Biology Norms

* Keep **edge semantics** explicit: direction, sign, evidence, context.
* Separate **knowledge-derived** vs **data-derived** edges.
* Avoid leakage: networks must not be trained on the same dataset later evaluated.
* Baselines: degree, common neighbors, random-walk propagation. Metrics: AUPRC primary, calibrated.
* Perturbation stability: recompute controllability after dropping 5–10% edges; report variance.
* Deliverables: graph schema, stats, split manifest, calibrated results with CI.

---

## ML Norms

* Zero leakage: all transforms inside folds.
* Split policy: IID (StratifiedKFold), GroupKFold for multi-site, forward-chaining for temporal, inductive for graphs.
* Baselines: logistic regression (calibrated), majority, degree/common-neighbor for graphs.
* Metrics: AUPRC primary for imbalance; report Brier + calibration (ECE).
* Bootstrap CIs; stress tests: permuted labels, noisy features, subcohort holdouts.
* Hyperparam search: budgeted Optuna/random; log seeds/configs.
* Deliver plots: PR curves, calibration, confusion/error stratification.

---

## R / Bioconductor Norms

* Use `SummarizedExperiment` / `SingleCellExperiment`; sync rowData/colData.
* Always show **design + contrast** in DE code.
* Shrink dispersions & LFCs; justify batch correction.
* Parallelize with `BiocParallel`; record `sessionInfo()`.
* Standard plots: PCA/UMAP by batch/condition; ComplexHeatmap for DE.

---

## R Package Norms

* Create package with `usethis`; Proprietary Flagship License; GitLab repo.
* Use `roxygen2` for docs; `testthat` for tests; `pkgdown` site for docs.
* Lock deps with `renv::snapshot()`.
* Export minimal API; keep internals prefixed `.`.
* Vignettes must be runnable end-to-end in ≤90s.
* Release checklist: passing tests, R CMD check clean, docs + NEWS updated, versioned data/refs.

---

## Specific Pitfalls to Guard Against

* Using DESeq2 on microarrays or limma on raw counts (must `voom`) — enforce assay guards.
* Mixing TF→target, PPI, phospho edges into a “soup” — controllability results become uninterpretable.
* Driver-node overinterpretation — controllability ≠ biochemical feasibility; require druggability/expression filters.
* Identifier collapse — enforce one-to-one probe→gene mapping, log drops.
* Circular validation — do not validate with pathways that seeded the graph.
* SLE-specific: confounding by cell-type mixture, sex bias, medication effects, ancestry PCs, interferon signature.

---

## Deliverables

For each disease analysis (lung, SLE, etc.), produce:

* **QC dashboard** (PCA, metrics vs gates).
* **Design matrix & contrasts** (committed).
* **DE tables**: effect sizes + CIs + FDR.
* **Gene set results**: NES, FDR, leading edge.
* **Controller rankings**: stability × reproducibility × druggability.
* **Validation**: cross-cohort, orthogonal assays.
* **Reproducibility bundle**: code, env, manifests, run logs.

---

## Definition of Done

Runnable R package (`ciscontrolr`) with:

* Clean API (IO, QC, DE, networks, controllability, ranking, validation).
* Passing tests with small fixtures.
* Vignettes: lung cancer (existing analysis), SLE (deconvolution + covariates).
* CI/CD pipeline + pkgdown site.
* Deterministic, reproducible runs.
* Results meeting **ship criteria**: baseline beaten, uncertainty acceptable, calibration valid.
