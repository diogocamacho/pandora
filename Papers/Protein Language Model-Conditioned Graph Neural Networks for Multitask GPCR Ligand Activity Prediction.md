---
title: "Protein Language Model-Conditioned Graph Neural Networks for Multitask GPCR Ligand Activity Prediction"
source: "https://www.biorxiv.org/content/10.64898/2026.09.27.754816v1.abstract?%3Fcollection="
author:
  - "[[Manashi De]]"
  - "[[Ekarsi Lodh]]"
  - "[[Shalini Majumder]]"
  - "[[Tapan Chowdhury]]"
published:
created: 2026-10-06
description: "bioRxiv - the preprint server for biology, operated by openRxiv, a nonprofit organization dedicated to advancing scientific communication"
tags:
  - "clippings"
---
New Results

[View ORCID Profile](http://orcid.org/0000-0003-4709-3219) Manashi De, [View ORCID Profile](http://orcid.org/0009-0000-7462-3217) Ekarsi Lodh, [View ORCID Profile](http://orcid.org/0009-0003-6371-1504) Shalini Majumder, [View ORCID Profile](http://orcid.org/0000-0003-1511-1793) Tapan Chowdhury

doi: https://doi.org/10.64898/2026.09.27.754816

This article is a preprint and has not been certified by peer review \[[what does this mean?](https://www.biorxiv.org/about/FAQ#unrefereed)\].

## Abstract

Predicting ligand activity across G protein-coupled receptors (GPCRs) requires models that capture both molecular structure and receptor-specific information while remaining robust to chemical and target-domain shifts. We developed a multimodal graph neural network that combines explicit ligand molecular graphs with frozen protein language model representations of GPCR sequences and jointly predicts quantitative pActivity and binary activity. The model was trained on 271,739 curated ligand-GPCR pairs spanning 183,694 ligands and 216 human GPCRs and evaluated using random, Bemis-Murcko scaffold, and strict cold-ligand partitions. With ESM-2 650M receptor embeddings, the selected model achieved mean absolute errors of 0.513 ± 0.006, 0.540 ± 0.006, and 0.641 ± 0.005 pActivity units under random, cold-ligand, and scaffold evaluation, respectively, substantially outperforming a protein-aware fixed-feature multilayer perceptron and consistently improving quantitative prediction over a matched GINE reference. Removing receptor embeddings markedly degraded both regression and classification, whereas differences among ESM-2 35M, ESM-2 650M, and ProtT5 were comparatively small. Independent evaluation on 6,319 ChEMBL 37/BindingDB pairs revealed a substantial external domain shift, with mean absolute error increasing to approximately 0.94-0.95 despite chemically stringent internal validation. Nevertheless, receptor-specific information remained highly informative in a DRD2-DRD3 selectivity analysis: the cold-ligand ensemble achieved R^2 = 0.853, Spearman ρ = 0.916, and ROC-AUC = 0.966 for strong DRD3 selectivity, whereas the receptor-independent ablation approached chance-level discrimination. These results establish protein-language-model-conditioned molecular graph learning as a scalable strategy for GPCR bioactivity prediction while identifying chemotype novelty, external-domain transfer, and richer ligand-receptor interaction representations as key remaining challenges.

### Competing Interest Statement

The authors have declared no competing interest.

Copyright

The copyright holder for this preprint is the author/funder, who has granted bioRxiv a license to display the preprint in perpetuity. All rights reserved. No reuse allowed without permission.

bioRxiv and medRxiv thank the following for their generous financial support:

> The Chan Zuckerberg Initiative, Cold Spring Harbor Laboratory, the Sergey Brin Family Foundation, California Institute of Technology, Centre National de la Recherche Scientifique, Fred Hutchinson Cancer Center, Imperial College London, Massachusetts Institute of Technology, Stanford University, The University of Edinburgh, University of Washington, and Vrije Universiteit Amsterdam.

[Donate to openRxiv](https://www.zeffy.com/en-US/donation-form/donate-to-make-a-difference-10981)

[Back to top](#page)

[Previous](https://www.biorxiv.org/content/10.64898/2026.09.27.754850v1 "Pan-Screening the Structural Predictability of Drug Toxicity: Validation of Molecular Fingerprints")

Posted October 02, 2026.

## Subject Area

- ```html
	Bioinformatics
	```

Reviews and Context