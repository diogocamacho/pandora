---
title: "BoltzGen: Toward Universal Binder Design"
source: "https://www.biorxiv.org/content/10.1101/2025.11.20.689494v1"
author:
  - "[[Hannes Stark]]"
  - "[[Felix Faltings]]"
  - "[[MinGyu Choi]]"
  - "[[Yuxin Xie]]"
  - "[[Eunsu Hur]]"
  - "[[Timothy O’Donnell]]"
  - "[[Anton Bushuiev]]"
  - "[[Talip Uçar]]"
  - "[[Saro Passaro]]"
  - "[[Weian Mao]]"
  - "[[Mateo Reveiz]]"
  - "[[Roman Bushuiev]]"
  - "[[Tomáš Pluskal]]"
  - "[[Josef Sivic]]"
  - "[[Karsten Kreis]]"
  - "[[Arash Vahdat]]"
  - "[[Shamayeeta Ray]]"
  - "[[Jonathan T. Goldstein]]"
  - "[[Andrew Savinov]]"
  - "[[Jacob A. Hambalek]]"
  - "[[Anshika Gupta]]"
  - "[[Diego A. Taquiri-Diaz]]"
  - "[[Yaotian Zhang]]"
  - "[[A. Katherine Hatstat]]"
  - "[[Angelika Arada]]"
  - "[[Nam Hyeong Kim]]"
  - "[[Ethel Tackie-Yarboi]]"
  - "[[Dylan Boselli]]"
  - "[[Lee Schnaider]]"
  - "[[Chang C. Liu]]"
  - "[[Gene-Wei Li]]"
  - "[[Denes Hnisz]]"
  - "[[David M. Sabatini]]"
  - "[[William F. DeGrado]]"
  - "[[Jeremy Wohlwend]]"
  - "[[Gabriele Corso]]"
  - "[[Regina Barzilay]]"
  - "[[Tommi Jaakkola]]"
published:
created: 2026-10-01
description: "bioRxiv - the preprint server for biology, operated by openRxiv, a nonprofit organization dedicated to advancing scientific communication"
tags:
  - "clippings"
---
New Results
- ```html
	View current version of this article
	```

Hannes Stark, Felix Faltings, MinGyu Choi, Yuxin Xie, Eunsu Hur, Timothy O’Donnell, Anton Bushuiev, Talip Uçar, Saro Passaro, Weian Mao, Mateo Reveiz, Roman Bushuiev, Tomáš Pluskal, Josef Sivic, Karsten Kreis, Arash Vahdat, Shamayeeta Ray, Jonathan T. Goldstein, Andrew Savinov, Jacob A. Hambalek, Anshika Gupta, Diego A. Taquiri-Diaz, Yaotian Zhang, A. Katherine Hatstat, Angelika Arada, Nam Hyeong Kim, Ethel Tackie-Yarboi, Dylan Boselli, Lee Schnaider, Chang C. Liu, Gene-Wei Li, Denes Hnisz, David M. Sabatini, William F. DeGrado, Jeremy Wohlwend, Gabriele Corso, Regina Barzilay, Tommi Jaakkola

doi: https://doi.org/10.1101/2025.11.20.689494

This article is a preprint and has not been certified by peer review \[[what does this mean?](https://www.biorxiv.org/about/FAQ#unrefereed)\].

## Abstract

We introduce *BoltzGen*, an all-atom generative model for designing proteins and peptides across all modalities to bind a wide range of biomolecular targets. BoltzGen builds strong structural reasoning capabilities about target-binder interactions into its generative design process. This is achieved by unifying design and structure prediction, resulting in a single model that also reaches state-of-the-art folding performance. BoltzGen’s generation process can be controlled with a flexible design specification language over covalent bonds, structure constraints, binding sites, and more. We experimentally validate these capabilities in a total of eight diverse wetlab design campaigns with functional and affinity readouts across 26 targets. The experiments span binder modalities from nanobodies to disulfide-bonded peptides and include targets ranging from disordered proteins to small molecules. For instance, we test 15 nanobody and protein binder designs against each of nine novel targets with low similarity to any protein with a known bound structure. For both binder modalities, this yields nanomolar binders for 66% of targets. We release model weights, data, and both inference and training code at: [https://github.com/HannesStark/boltzgen](https://github.com/HannesStark/boltzgen).

### Competing Interest Statement

The authors have declared no competing interest.

## Footnotes

- \* Interned at Boltz for a part of the project,

Copyright

The copyright holder for this preprint is the author/funder, who has granted bioRxiv a license to display the preprint in perpetuity. It is made available under a [CC-BY 4.0 International license](http://creativecommons.org/licenses/by/4.0/).

bioRxiv and medRxiv thank the following for their generous financial support:

> The Chan Zuckerberg Initiative, Cold Spring Harbor Laboratory, the Sergey Brin Family Foundation, California Institute of Technology, Centre National de la Recherche Scientifique, Fred Hutchinson Cancer Center, Imperial College London, Massachusetts Institute of Technology, Stanford University, The University of Edinburgh, University of Washington, and Vrije Universiteit Amsterdam.

[Donate to openRxiv](https://www.zeffy.com/en-US/donation-form/donate-to-make-a-difference-10981)

[Back to top](#page)

[Previous](https://www.biorxiv.org/content/10.1101/2025.11.21.689589v1 "Less is more: uncompensated gravity torques for intuitive EMG-based assistance with a robotic exoskeleton") [Next](https://www.biorxiv.org/content/10.1101/2025.11.20.689467v1 "Longitudinal analysis of the hand microbiome in response to chlorine-based antiseptic use during a military field exercise")

Posted November 24, 2025.

[Email](https://www.biorxiv.org/ "Email this Article")

BoltzGen: Toward Universal Binder Design

Hannes Stark, Felix Faltings, MinGyu Choi, Yuxin Xie, Eunsu Hur, Timothy O’Donnell, Anton Bushuiev, Talip Uçar, Saro Passaro, Weian Mao, Mateo Reveiz, Roman Bushuiev, Tomáš Pluskal, Josef Sivic, Karsten Kreis, Arash Vahdat, Shamayeeta Ray, Jonathan T. Goldstein, Andrew Savinov, Jacob A. Hambalek, Anshika Gupta, Diego A. Taquiri-Diaz, Yaotian Zhang, A. Katherine Hatstat, Angelika Arada, Nam Hyeong Kim, Ethel Tackie-Yarboi, Dylan Boselli, Lee Schnaider, Chang C. Liu, Gene-Wei Li, Denes Hnisz, David M. Sabatini, William F. DeGrado, Jeremy Wohlwend, Gabriele Corso, Regina Barzilay, Tommi Jaakkola

bioRxiv 2025.11.20.689494; doi: https://doi.org/10.1101/2025.11.20.689494

This article is a preprint and has not been certified by peer review \[[what does this mean?](https://www.biorxiv.org/about/FAQ#unrefereed)\].

Copy

[![Twitter logo](https://www.biorxiv.org/sites/all/modules/highwire/highwire/images/twitter.png)](https://www.biorxiv.org/highwire_log/share/twitter?link=http%3A%2F%2Ftwitter.com%2Fshare%3Furl%3Dhttps%253A%2F%2Fwww.biorxiv.org%2Fcontent%2F10.1101%2F2025.11.20.689494v1%26text%3DBoltzGen%253A%2520Toward%2520Universal%2520Binder%2520Design "Share this on Twitter") [![LinkedIn logo](https://www.biorxiv.org/sites/all/modules/highwire/highwire/images/linkedin-32px.png)](https://www.biorxiv.org/highwire_log/share/linkedin?link=http%3A%2F%2Fwww.linkedin.com%2FshareArticle%3Fmini%3Dtrue%26url%3Dhttps%253A%2F%2Fwww.biorxiv.org%2Fcontent%2F10.1101%2F2025.11.20.689494v1%26title%3DBoltzGen%253A%2520Toward%2520Universal%2520Binder%2520Design%26summary%3D%26source%3DbioRxiv "Publish this post to LinkedIn")

[Citation Tools](https://www.biorxiv.org/ "Citation Tools")

[Get QR code](https://connect.biorxiv.org/qr/2025.11.20.689494)

## Subject Area

- ```html
	Bioengineering
	```

Reviews and Context