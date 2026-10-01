---
date: 2026-09-30
tags: [learning]
type: learning
challenges:
  - "When assay disagreement (BLI vs Adaptyv) and benchmark disagreement (peptide-binder field) share the same structure — a proxy that looks valid until it doesn't — is the bottleneck a lack of ground truth, or a lack of agreement on what ground truth should even be?"
  - "If task-specific post-training consistently outperforms general protein and genome language models on design tasks, where does the durable moat for a general-purpose binder platform actually live — in the model, or in the proprietary data it gets trained on?"
---

- **↺ Measurement validity is the meta-problem, not the methods.** Wilke's "can't predict much of anything" piece and the peptide-binder back-and-forth share the same root: proxies validated in one context fail to transfer, and the gap only shows up when it's expensive — which maps directly onto yesterday's BLI-vs-Adaptyv discrepancy. The field, and the lab, are both hitting the same wall. [[Property prediction models]] [[ProteinMPNN — sequence design, co-folding for bindable epitopes]]
- **↺ The PLM covariation trap has a partial exit: task-specific post-training.** The Omnii genome LM paper (cancer vaccine design) is exactly what the covariation critique predicts — fine-tuning on design-relevant distributions outperforms broader evolutionary pretraining precisely in the cases that matter. [[pMHC for diagnostics]] [[T-cell reprogramming]]
- **↺ Drug discovery is front-loading the wrong problem.** Teslo's human-trials argument and the DeepSeek-moment framing converge: ML investment compresses early-stage prediction where value is modest, while trial design and late-stage efficiency stay broken — the disruption will come from whoever attacks the expensive end of the funnel, not the cheap one. [[Drug discovery]]
- **↺ China's pharma edge is regulatory learning-rate, not labor.** The Xiaoping Cao piece on NMPA adds the mechanism the earlier structural pieces were missing: the regulatory compression is deliberate, iterative, and accelerating — making this a capability story, not a cost story. [[Regulatory]]
- **Experience compounds when skills commoditize.** The "Experience > Skills" chart lands differently as AI drives down skill-acquisition time: tenure and pattern recognition become scarce again, which reshapes what to optimize for when building [[2025-09-19 Computational Biology and ML teams for biotech]].

## 🤔 Think about today
1. When assay disagreement (BLI vs Adaptyv) and benchmark disagreement (peptide-binder field) share the same structure — a proxy that looks valid until it doesn't — is the bottleneck a lack of ground truth, or a lack of agreement on what ground truth should even be?
2. If task-specific post-training consistently outperforms general protein and genome language models on design tasks, where does the durable moat for a general-purpose binder platform actually live — in the model, or in the proprietary data it gets trained on?
