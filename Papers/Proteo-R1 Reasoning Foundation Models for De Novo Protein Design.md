---
title: "Proteo-R1: Reasoning Foundation Models for De Novo Protein Design"
source: "https://arxiv.org/abs/2605.02937"
author:
  - "[[Fang Wu]]"
  - "[[Weihao Xuan]]"
  - "[[Heli Qi]]"
  - "[[Hanqun Cao]]"
  - "[[Heng-Jui Chang]]"
  - "[[Zeqi Zhou]]"
  - "[[Haokai Zhao]]"
  - "[[Ma Jian]]"
  - "[[Carl Ma]]"
  - "[[Yu-Chi Cheng]]"
  - "[[Kuan Pang]]"
  - "[[Xiangru Tang]]"
  - "[[Zehong Wang]]"
  - "[[Guanlue Li]]"
  - "[[Hanchen Wang]]"
  - "[[Kejun Ying]]"
  - "[[Pan Lu]]"
  - "[[Chiho Im]]"
  - "[[Seungju Han]]"
  - "[[Peng Xia]]"
  - "[[Tinson Xu]]"
  - "[[Yinxi Li]]"
  - "[[Deyao Zhu]]"
  - "[[Pheng-Ann Heng]]"
  - "[[Naoto Yokoya]]"
  - "[[Masashi Sugiyama]]"
  - "[[Li Erran Li]]"
  - "[[Jure Leskovec]]"
  - "[[Yejin Choi]]"
published:
created: 2026-10-02
description: "Abstract page for arXiv paper 2605.02937: Proteo-R1: Reasoning Foundation Models for De Novo Protein Design"
tags:
  - "clippings"
---
## Computer Science > Machine Learning

## Title:Proteo-R1: Reasoning Foundation Models for De Novo Protein Design

Authors:[Fang Wu](https://arxiv.org/search/cs?searchtype=author&query=Wu,+F), [Weihao Xuan](https://arxiv.org/search/cs?searchtype=author&query=Xuan,+W), [Heli Qi](https://arxiv.org/search/cs?searchtype=author&query=Qi,+H), [Hanqun Cao](https://arxiv.org/search/cs?searchtype=author&query=Cao,+H), [Heng-Jui Chang](https://arxiv.org/search/cs?searchtype=author&query=Chang,+H), [Zeqi Zhou](https://arxiv.org/search/cs?searchtype=author&query=Zhou,+Z), [Haokai Zhao](https://arxiv.org/search/cs?searchtype=author&query=Zhao,+H), [Ma Jian](https://arxiv.org/search/cs?searchtype=author&query=Jian,+M), [Carl Ma](https://arxiv.org/search/cs?searchtype=author&query=Ma,+C), [Yu-Chi Cheng](https://arxiv.org/search/cs?searchtype=author&query=Cheng,+Y), [Kuan Pang](https://arxiv.org/search/cs?searchtype=author&query=Pang,+K), [Xiangru Tang](https://arxiv.org/search/cs?searchtype=author&query=Tang,+X), [Zehong Wang](https://arxiv.org/search/cs?searchtype=author&query=Wang,+Z), [Guanlue Li](https://arxiv.org/search/cs?searchtype=author&query=Li,+G), [Hanchen Wang](https://arxiv.org/search/cs?searchtype=author&query=Wang,+H), [Kejun Ying](https://arxiv.org/search/cs?searchtype=author&query=Ying,+K), [Pan Lu](https://arxiv.org/search/cs?searchtype=author&query=Lu,+P), [Chiho Im](https://arxiv.org/search/cs?searchtype=author&query=Im,+C), [Seungju Han](https://arxiv.org/search/cs?searchtype=author&query=Han,+S), [Peng Xia](https://arxiv.org/search/cs?searchtype=author&query=Xia,+P), [Tinson Xu](https://arxiv.org/search/cs?searchtype=author&query=Xu,+T), [Yinxi Li](https://arxiv.org/search/cs?searchtype=author&query=Li,+Y), [Deyao Zhu](https://arxiv.org/search/cs?searchtype=author&query=Zhu,+D), [Pheng-Ann Heng](https://arxiv.org/search/cs?searchtype=author&query=Heng,+P), [Naoto Yokoya](https://arxiv.org/search/cs?searchtype=author&query=Yokoya,+N), [Masashi Sugiyama](https://arxiv.org/search/cs?searchtype=author&query=Sugiyama,+M), [Li Erran Li](https://arxiv.org/search/cs?searchtype=author&query=Li,+L+E), [Jure Leskovec](https://arxiv.org/search/cs?searchtype=author&query=Leskovec,+J), [Yejin Choi](https://arxiv.org/search/cs?searchtype=author&query=Choi,+Y)

[View PDF](https://arxiv.org/pdf/2605.02937) [HTML (experimental)](https://arxiv.org/html/2605.02937v2)

> Abstract:Deep learning in de novo protein design has achieved atomic-level fidelity. However, existing models remain largely non-deliberative: they directly synthesize molecular geometries without explicitly reasoning about which residues or interactions are functionally essential. As a result, design decisions are entangled with continuous sampling dynamics, limiting interpretability, controllability, and systematic reuse of biochemical knowledge. We introduce Proteo-R1, a reasoning-guided protein design framework that explicitly decouples molecular understanding from geometric generation. Proteo-R1 adopts a dual-expert architecture in which a multimodal large language model (MLLM) serves as an understanding expert, analyzing protein sequences, structures, and textual context to identify key functional residues that govern binding and specificity. These residue-level decisions are then passed as hard constraints to a separate diffusion-based generation expert, which performs conditional co-design while respecting the fixed interaction anchors. This factorization mirrors how human experts approach molecular engineering: first, reasoning about critical interactions, then optimizing geometry subject to those constraints. By operationalizing reasoning as explicit residue-level commitments rather than latent textual guidance, Proteo-R1 achieves stable, interpretable, and modular integration of LLM reasoning with state-of-the-art geometric generative models. Code, data, and demos are available at [this https URL](https://smiles724.github.io/r1/).

| Subjects: | Machine Learning (cs.LG); Artificial Intelligence (cs.AI); Computational Engineering, Finance, and Science (cs.CE) |
| --- | --- |
| Cite as: | [arXiv:2605.02937](https://arxiv.org/abs/2605.02937) \[cs.LG\] |
|  | (or [arXiv:2605.02937v2](https://arxiv.org/abs/2605.02937v2) \[cs.LG\] for this version) |
|  | [https://doi.org/10.48550/arXiv.2605.02937](https://doi.org/10.48550/arXiv.2605.02937) |
| Journal reference: | ICML 2026 |

## Submission history

From: Fang Wu \[[view email](https://arxiv.org/show-email/4059ca63/2605.02937)\]  
**[\[v1\]](https://arxiv.org/abs/2605.02937v1)** Fri, 1 May 2026 06:52:27 UTC (570 KB)  
**\[v2\]** Mon, 10 Aug 2026 22:53:11 UTC (567 KB)

[Which authors of this paper are endorsers?](https://arxiv.org/auth/show-endorsers/2605.02937) | Disable MathJax ([What is MathJax?](https://info.arxiv.org/help/mathjax.html))