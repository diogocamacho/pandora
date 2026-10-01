---
title: "String Seed of Thought: Prompting LLMs for Distribution-Faithful and Diverse Generation"
source: "https://arxiv.org/abs/2510.21150"
author:
  - "[[Kou Misaki]]"
  - "[[Takuya Akiba]]"
published:
created: 2026-10-01
description: "Abstract page for arXiv paper 2510.21150: String Seed of Thought: Prompting LLMs for Distribution-Faithful and Diverse Generation"
tags:
  - "clippings"
---
## Computer Science > Artificial Intelligence

## Title:String Seed of Thought: Prompting LLMs for Distribution-Faithful and Diverse Generation

Authors:[Kou Misaki](https://arxiv.org/search/cs?searchtype=author&query=Misaki,+K), [Takuya Akiba](https://arxiv.org/search/cs?searchtype=author&query=Akiba,+T)

[View PDF](https://arxiv.org/pdf/2510.21150) [HTML (experimental)](https://arxiv.org/html/2510.21150v3)

> Abstract:We introduce String Seed of Thought (SSoT), a novel prompting method for LLMs that improves Probabilistic Instruction Following (PIF). We define PIF as a task requiring an LLM to select its answer from a predefined set of options, each associated with a specific probability, such that the empirical distribution of the generated answers aligns with the target distribution when prompted multiple times. While LLMs excel at tasks with single, deterministic answers, they often fail at PIF, exhibiting biases problematic for applications requiring non-deterministic behaviors, such as human-behavior simulation, content diversification, and multiplayer games. It also harms the diversity of generated responses, a crucial factor in test-time scaling, by causing the outputs to collapse into a limited set of answers. To address this, we propose SSoT, a simple prompting method that instructs an LLM to first output a random string to generate sufficient entropy. SSoT also instructs the LLM to extract randomness by manipulating this string to derive a final answer, thereby preserving diversity while adhering to specific constraints. We demonstrate that SSoT significantly improves the PIF performance of LLMs, approaching the ideal performance of a pseudo-random number generator. Furthermore, our experiments on NoveltyBench show SSoT's benefits extend beyond closed-set tasks to open-ended tasks by enhancing response diversity.

| Comments: |  |
| --- | --- |
| Subjects: | Artificial Intelligence (cs.AI) |
| Cite as: | [arXiv:2510.21150](https://arxiv.org/abs/2510.21150) \[cs.AI\] |
|  | (or [arXiv:2510.21150v3](https://arxiv.org/abs/2510.21150v3) \[cs.AI\] for this version) |
|  | [https://doi.org/10.48550/arXiv.2510.21150](https://doi.org/10.48550/arXiv.2510.21150) |

## Submission history

From: Kou Misaki \[[view email](https://arxiv.org/show-email/5c845b56/2510.21150)\]  
**[\[v1\]](https://arxiv.org/abs/2510.21150v1)** Fri, 24 Oct 2025 04:43:50 UTC (770 KB)  
**[\[v2\]](https://arxiv.org/abs/2510.21150v2)** Fri, 7 Nov 2025 06:59:25 UTC (770 KB)  
**\[v3\]** Thu, 5 Feb 2026 19:46:51 UTC (806 KB)

[Which authors of this paper are endorsers?](https://arxiv.org/auth/show-endorsers/2510.21150) | Disable MathJax ([What is MathJax?](https://info.arxiv.org/help/mathjax.html))