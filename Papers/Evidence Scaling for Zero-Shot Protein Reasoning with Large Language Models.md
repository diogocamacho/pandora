---
title: "Evidence Scaling for Zero-Shot Protein Reasoning with Large Language Models"
source: "https://www.biorxiv.org/content/10.64898/2026.09.27.754822v1.abstract?%3Fcollection="
author:
  - "[[Zitong Hao]]"
  - "[[Chaoyang Wang]]"
  - "[[Dongyuan Li]]"
  - "[[Yiquan Wang]]"
published:
created: 2026-10-06
description: "bioRxiv - the preprint server for biology, operated by openRxiv, a nonprofit organization dedicated to advancing scientific communication"
tags:
  - "clippings"
analyzed: true
analyzed_on: 2026-10-06
analysis: "[[Evidence Scaling for Zero-Shot Protein Reasoning (Hao 2026)]]"
doi: "10.64898/2026.09.27.754822"
---
New Results

Zitong Hao, Chaoyang Wang, Dongyuan Li, [View ORCID Profile](http://orcid.org/0000-0002-1954-9808) Yiquan Wang

doi: https://doi.org/10.64898/2026.09.27.754822

This article is a preprint and has not been certified by peer review \[[what does this mean?](https://www.biorxiv.org/about/FAQ#unrefereed)\].

## Abstract

Large language models (LLMs) show emerging zero-shot capability for protein variant prediction, yet still lag behind specialized protein models. We ask whether this gap can be reduced by scaling access to biological evidence rather than adapting model parameters. We introduce BioEvidence, a training-free and model-agnostic interface that converts structural and evolutionary information from standard biological tools into compact evidence for frozen LLMs. On the ProteinGym benchmark, we observe evidence scaling: performance improves as evidence becomes richer. Structural and evolutionary evidence each improve performance, and combining them yields further gains, while mismatching the same evidence to the wrong variants degrades performance below the no-evidence baseline. Notably, BioEvidence enables zero-shot ranking to reach strong specialized protein predictors on matched evaluations, and the improvement persists on post-cutoff data released after the model’s knowledge cutoff. Evidence also interacts with conventional scaling: for GPT-5.6 Sol, evidence at low reasoning effort outperforms the no-evidence condition at medium effort, while a six-model analysis associates stronger no-evidence performance with larger margins over evolutionary rank fusion. These results identify external evidence as a complementary scaling axis for scientific prediction alongside model capability and inference effort.

### Competing Interest Statement

The authors have declared no competing interest.

## Funder Information Declared

University of Florida, https://ror.org/02y3ad647

Copyright

The copyright holder for this preprint is the author/funder, who has granted bioRxiv a license to display the preprint in perpetuity. It is made available under a [CC-BY-NC-ND 4.0 International license](http://creativecommons.org/licenses/by-nc-nd/4.0/).

bioRxiv and medRxiv thank the following for their generous financial support:

> The Chan Zuckerberg Initiative, Cold Spring Harbor Laboratory, the Sergey Brin Family Foundation, California Institute of Technology, Centre National de la Recherche Scientifique, Fred Hutchinson Cancer Center, Imperial College London, Massachusetts Institute of Technology, Stanford University, The University of Edinburgh, University of Washington, and Vrije Universiteit Amsterdam.

[Donate to openRxiv](https://www.zeffy.com/en-US/donation-form/donate-to-make-a-difference-10981)

[Back to top](#page)

[Previous](https://www.biorxiv.org/content/10.64898/2026.09.25.753934v1 "The molecular structural basis of the braking action of muscle") [Next](https://www.biorxiv.org/content/10.64898/2026.09.30.729488v1 "Cerebral organoids recapitulate interneuron chain migration in the human cortex")

Posted October 01, 2026.

## Subject Area

- ```html
	Bioinformatics
	```

Reviews and Context