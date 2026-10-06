---
title: "A kinetic-aware approach to infer metabolic variations and flux using transcriptomics and metabolomics data"
source: "https://www.biorxiv.org/content/10.64898/2026.09.27.754711v1.abstract?%3Fcollection="
author:
  - "[[Haiqi Zhu]]"
  - "[[Changlin Wan]]"
  - "[[Min Yang]]"
  - "[[Yue Fang]]"
  - "[[Zheng An]]"
  - "[[Paveethran Swaminathan]]"
  - "[[Pengtao Dang]]"
  - "[[Zhi Li]]"
  - "[[Jia Wang]]"
  - "[[Yijie Wang]]"
  - "[[Yabing Chen]]"
  - "[[Anjun Ma]]"
  - "[[Qin Ma]]"
  - "[[Mark R. Kelley]]"
  - "[[Sha Cao]]"
  - "[[Melissa L. Fishel]]"
  - "[[Chi Zhang]]"
published:
created: 2026-10-06
description: "bioRxiv - the preprint server for biology, operated by openRxiv, a nonprofit organization dedicated to advancing scientific communication"
tags:
  - "clippings"
analyzed: true
analyzed_on: 2026-10-06
analysis: "[[mmFEA — kinetic-aware multi-omics flux (Zhu 2026)]]"
doi: "10.64898/2026.09.27.754711"
---
New Results

Haiqi Zhu, Changlin Wan, Min Yang, Yue Fang, Zheng An, Paveethran Swaminathan, Pengtao Dang, Zhi Li, Jia Wang, Yijie Wang, Yabing Chen, Anjun Ma, Qin Ma, Mark R. Kelley, Sha Cao, Melissa L. Fishel, [View ORCID Profile](http://orcid.org/0000-0001-9553-0925) Chi Zhang

doi: https://doi.org/10.64898/2026.09.27.754711

This article is a preprint and has not been certified by peer review \[[what does this mean?](https://www.biorxiv.org/about/FAQ#unrefereed)\].

## Abstract

Assessing metabolic variations and flux quantities enable systematic understandings of metabolic shifts, reprogramming, adaptation and interactions in human diseases. However, omics-based estimation of metabolic flux and its variation remains challenging due to several fundamental limitations: the need for disease and tissue context specific metabolic model; nonlinear enzyme kinetic model that links enzyme and substrate changes to reaction flux; partial, unpaired, and snap-shot measurements across omics modalities; and uncertainty in computational prediction. Here, we present Michaelis-Menten model-based Flux Estimation Analysis (mmFEA), a Monte Carlo framework for estimating condition-specific flux changes by integrating paired or unpaired metabolomics and transcriptomics (or proteomics) data. mmFEA separates each reaction-rate change into enzyme- and substrate-associated components and assess reaction rate using Michaelis-Menten kinetics equation. A baseline metabolite saturation rate is introduced by integrating protein language model predicted kinetic parameters and human baseline level metabolic concentration to enable kinetic-aware integration of unpaired substrate and enzyme level measurements. Distribution of metabolic flux and variations between conditions are further computed using MCMC sampling by treating Michaelis-Menten-derived marginal flux distribution as prior and coherency in flux balance as likelihood. To benchmark mmFEA, we generated an in-house multi-omics data set including transcriptomics, metabolomics, metabolic activity functional assay, and CRISPR screening data using pancreatic cancer cell line system treated by APEX1 inhibitors. We demonstrated that mmFEA could accurately capture experimentally observed metabolic changes and achieved a better performance than all baseline methods. Our analysis revealed the necessity in using both substrate and enzyme modality and kinetic aware model in metabolic flux assessment. Further analysis using independent pancreatic cancer cohorts further validated the robustness of mmFEA, supporting integration of condition-linked unpaired data. Pan-cancer and spatial multi-omic applications demonstrated the use of mmFEA for resolving context-dependent metabolic variation when direct flux measurements are unavailable. Together, mmFEA provides a mechanistically grounded framework for estimating relative metabolic flux changes and their uncertainty from heterogeneous omics data.

### Competing Interest Statement

The authors have declared no competing interest.

Copyright

The copyright holder for this preprint is the author/funder, who has granted bioRxiv a license to display the preprint in perpetuity. It is made available under a [CC-BY-NC-ND 4.0 International license](http://creativecommons.org/licenses/by-nc-nd/4.0/).

bioRxiv and medRxiv thank the following for their generous financial support:

> The Chan Zuckerberg Initiative, Cold Spring Harbor Laboratory, the Sergey Brin Family Foundation, California Institute of Technology, Centre National de la Recherche Scientifique, Fred Hutchinson Cancer Center, Imperial College London, Massachusetts Institute of Technology, Stanford University, The University of Edinburgh, University of Washington, and Vrije Universiteit Amsterdam.

[Donate to openRxiv](https://www.zeffy.com/en-US/donation-form/donate-to-make-a-difference-10981)

[Back to top](#page)

[Previous](https://www.biorxiv.org/content/10.64898/2026.09.27.754785v1 "Acrean fish diversity back in time: Paleoichthyology of the Rio Acre fossil fauna in Brazil")

Posted October 02, 2026.

[Email](https://www.biorxiv.org/ "Email this Article")

A kinetic-aware approach to infer metabolic variations and flux using transcriptomics and metabolomics data

Haiqi Zhu, Changlin Wan, Min Yang, Yue Fang, Zheng An, Paveethran Swaminathan, Pengtao Dang, Zhi Li, Jia Wang, Yijie Wang, Yabing Chen, Anjun Ma, Qin Ma, Mark R. Kelley, Sha Cao, Melissa L. Fishel, Chi Zhang

bioRxiv 2026.09.27.754711; doi: https://doi.org/10.64898/2026.09.27.754711

This article is a preprint and has not been certified by peer review \[[what does this mean?](https://www.biorxiv.org/about/FAQ#unrefereed)\].

Copy

[![Twitter logo](https://www.biorxiv.org/sites/all/modules/highwire/highwire/images/twitter.png)](https://www.biorxiv.org/highwire_log/share/twitter?link=http%3A%2F%2Ftwitter.com%2Fshare%3Furl%3Dhttps%253A%2F%2Fwww.biorxiv.org%2Fcontent%2F10.64898%2F2026.09.27.754711v1%26text%3DA%2520kinetic-aware%2520approach%2520to%2520infer%2520metabolic%2520variations%2520and%2520flux%2520using%2520transcriptomics%2520and%2520metabolomics%2520data "Share this on Twitter") [![LinkedIn logo](https://www.biorxiv.org/sites/all/modules/highwire/highwire/images/linkedin-32px.png)](https://www.biorxiv.org/highwire_log/share/linkedin?link=http%3A%2F%2Fwww.linkedin.com%2FshareArticle%3Fmini%3Dtrue%26url%3Dhttps%253A%2F%2Fwww.biorxiv.org%2Fcontent%2F10.64898%2F2026.09.27.754711v1%26title%3DA%2520kinetic-aware%2520approach%2520to%2520infer%2520metabolic%2520variations%2520and%2520flux%2520using%2520transcriptomics%2520and%2520metabolomics%2520data%26summary%3D%26source%3DbioRxiv "Publish this post to LinkedIn")

[Citation Tools](https://www.biorxiv.org/ "Citation Tools")

[Get QR code](https://connect.biorxiv.org/qr/2026.09.27.754711)

## Subject Area

- ```html
	Systems Biology
	```

Reviews and Context