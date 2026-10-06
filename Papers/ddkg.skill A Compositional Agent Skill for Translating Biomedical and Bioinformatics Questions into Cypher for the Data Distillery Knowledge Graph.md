---
title: "ddkg.skill: A Compositional Agent Skill for Translating Biomedical and Bioinformatics Questions into Cypher for the Data Distillery Knowledge Graph"
source: "https://www.biorxiv.org/content/10.64898/2026.09.26.754400v1.abstract?%3Fcollection="
author:
  - "[[Deanne M. Taylor]]"
  - "[[Aditya M. Lahiri]]"
  - "[[Taha Mohseni Ahooyi]]"
  - "[[Benjamin Stear]]"
  - "[[Yuanchao Zhang]]"
  - "[[Asif Chinwalla]]"
  - "[[Shiping Zhang]]"
  - "[[Christopher Nemarich]]"
  - "[[J. Alan Simmons]]"
  - "[[Jonathan C. Silverstein]]"
published:
created: 2026-10-06
description: "bioRxiv - the preprint server for biology, operated by openRxiv, a nonprofit organization dedicated to advancing scientific communication"
tags:
  - "clippings"
---
New Results

[View ORCID Profile](http://orcid.org/0000-0002-3302-4610) Deanne M. Taylor, Aditya M. Lahiri, Taha Mohseni Ahooyi, Benjamin Stear, Yuanchao Zhang, Asif Chinwalla, Shiping Zhang, Christopher Nemarich, J. Alan Simmons, Jonathan C. Silverstein

doi: https://doi.org/10.64898/2026.09.26.754400

This article is a preprint and has not been certified by peer review \[[what does this mean?](https://www.biorxiv.org/about/FAQ#unrefereed)\].

## Abstract

Biomedical knowledge graphs can connect information across genes, phenotypes, tissues, pathways, experiments, and clinical resources, but they are difficult to query correctly without detailed knowledge of the graph. Large language models can help write Cypher, yet a query focused on a bioinformatics task that looks reasonable may still use the wrong identifier, relationship direction, source, intermediate node, or output unit. We developed ddkg.skill, an Agent Skill for querying the NIH Common Fund Data Ecosystem Data Distillery Knowledge Graph (DDKG). Rather than a simple markdown prompt, ddkg.skill contains a controller, a compositional library of DDKG-specific references and structured tables, primary documentation, validated query patterns, a routing table, and a script that checks the internal links among these materials. The skill build for the December 2025 DDKG release contains 38 bundled files and 239 routing relationships and is identified by checksum so users can state the exact build used to compose a query. The evaluation reported here was performed separately on an earlier build with 38 files and 227 routing entries. In that orthogonal nine-test evaluation against a live December 2025 DDKG instance, five of seven tests targeting sources absent from the worked examples produced correct executed results. The evaluation also exposed a failed query, a cross-source comparison that was not biologically well posed, and errors in the skill's own reference material that informed later revisions. The skill guides an AI through entity resolution, graph inspection, query construction, and validation for biomedical and bioinformatics queries, while keeping the DDKG itself as the source of returned results. This design provides a portable and versioned method for giving general-purpose AI systems practical knowledge of a complex biomedical knowledge graph to empower complex bioinformatics data integration.

### Competing Interest Statement

The authors have declared no competing interest.

## Funder Information Declared

National Institutes of Health, https://ror.org/045p44t13, U24OD038422

Copyright

The copyright holder for this preprint is the author/funder, who has granted bioRxiv a license to display the preprint in perpetuity. It is made available under a [CC-BY 4.0 International license](http://creativecommons.org/licenses/by/4.0/).

bioRxiv and medRxiv thank the following for their generous financial support:

> The Chan Zuckerberg Initiative, Cold Spring Harbor Laboratory, the Sergey Brin Family Foundation, California Institute of Technology, Centre National de la Recherche Scientifique, Fred Hutchinson Cancer Center, Imperial College London, Massachusetts Institute of Technology, Stanford University, The University of Edinburgh, University of Washington, and Vrije Universiteit Amsterdam.

[Donate to openRxiv](https://www.zeffy.com/en-US/donation-form/donate-to-make-a-difference-10981)

[Back to top](#page)

[Previous](https://www.biorxiv.org/content/10.64898/2026.10.01.756004v1 "Zoogeochemical engineers: Galápagos giant tortoises link terrestrial and freshwater ecosystems through sediment transport and nutrient dynamics") [Next](https://www.biorxiv.org/content/10.64898/2026.09.28.755239v1 "Monothiol glutaredoxin DaGrxB couples iron homeostasis with redox balance to orchestrate development and virulence in the peach shoot blight fungus Diaporthe amygdali")

Posted October 02, 2026.

[Email](https://www.biorxiv.org/ "Email this Article")

ddkg.skill: A Compositional Agent Skill for Translating Biomedical and Bioinformatics Questions into Cypher for the Data Distillery Knowledge Graph

Deanne M. Taylor, Aditya M. Lahiri, Taha Mohseni Ahooyi, Benjamin Stear, Yuanchao Zhang, Asif Chinwalla, Shiping Zhang, Christopher Nemarich, J. Alan Simmons, Jonathan C. Silverstein

bioRxiv 2026.09.26.754400; doi: https://doi.org/10.64898/2026.09.26.754400

This article is a preprint and has not been certified by peer review \[[what does this mean?](https://www.biorxiv.org/about/FAQ#unrefereed)\].

Copy

[![Twitter logo](https://www.biorxiv.org/sites/all/modules/highwire/highwire/images/twitter.png)](https://www.biorxiv.org/highwire_log/share/twitter?link=http%3A%2F%2Ftwitter.com%2Fshare%3Furl%3Dhttps%253A%2F%2Fwww.biorxiv.org%2Fcontent%2F10.64898%2F2026.09.26.754400v1%26text%3Dddkg.skill%253A%2520A%2520Compositional%2520Agent%2520Skill%2520for%2520Translating%2520Biomedical%2520and%2520Bioinformatics%2520Questions%2520into%2520Cypher%2520for%2520the%2520Data%2520Distillery%2520Knowledge%2520Graph "Share this on Twitter") [![LinkedIn logo](https://www.biorxiv.org/sites/all/modules/highwire/highwire/images/linkedin-32px.png)](https://www.biorxiv.org/highwire_log/share/linkedin?link=http%3A%2F%2Fwww.linkedin.com%2FshareArticle%3Fmini%3Dtrue%26url%3Dhttps%253A%2F%2Fwww.biorxiv.org%2Fcontent%2F10.64898%2F2026.09.26.754400v1%26title%3Dddkg.skill%253A%2520A%2520Compositional%2520Agent%2520Skill%2520for%2520Translating%2520Biomedical%2520and%2520Bioinformatics%2520Questions%2520into%2520Cypher%2520for%2520the%2520Data%2520Distillery%2520Knowledge%2520Graph%26summary%3D%26source%3DbioRxiv "Publish this post to LinkedIn")

[Citation Tools](https://www.biorxiv.org/ "Citation Tools")

## Subject Area

- ```html
	Bioinformatics
	```

Reviews and Context