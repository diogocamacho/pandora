---
type: exploration-hypothesis
created: 2026-10-03
evidence_supporting: 0
evidence_challenging: 0
evidence_last: 2026-10-03
tags: [exploration, hypothesis, what-if, protein-design, scoring-functions, ai-drug-discovery, pipeline-optimization]
related_ideas: ["[[2026-06-18 biotech-of-one]]", "[[💡 Antimicrobial peptides]]"]
---

# What if scoring function selection, not generative model quality, explains most variance in de novo binder design success?

## The question
The field has invested heavily in better generative models for protein design. But if scoring function selection — specifically which computational filter is used to triage candidates — explains most of the variance in wet-lab hit rate, then the optimization target is wrong. Pipeline architecture matters more than the model that produces sequences.

## It turns out that…
Anthropic's binder campaign achieved ~26% hit rates not because of superior LLM reasoning but because the prompt hardcoded ESMFold2 as the scoring function — a tool released only months prior and not yet widely adopted [[Has Anthropic solved the peptide-binder design problem?]] [[Anthropic has not solved the peptide-binder design problem, but maybe bi[o]hub has]]. Brandon Frenz broke down explicitly: ESMFold2 is both faster and more accurate than AlphaFold3 for binder scoring, and that choice alone explains the edge. Separately, in the TREM2 hackathon pitting 10 human teams against 6 AI agents, all six LLM agents independently converged on PXDesign as their tool of choice [[Can LLMs design proteins?]] — a tool monoculture emerging not from coordination but from scoring the same outputs the same way. The field's generative models are converging; the scoring layer is not.

## Why it matters if true
If scoring function selection is the dominant lever — more than the generative model, more than compute budget — then the monetizable asset is the ability to quickly identify the optimal scoring pipeline for any target before committing GPU spend. A design campaign that costs $200 with the right scoring sequence vs. $20,000 with the wrong one is a 100x efficiency wedge. Companies running standard AlphaFold3-based evaluation pipelines are burning budget on suboptimal triage. The platform play: run a scored benchmark across N scoring function combinations in silico for a new target, then commit compute to the winner.

## Key uncertainties
- ESMFold2's demonstrated edge is primarily on TREM2 and the Anthropic benchmark targets — does it generalize across diverse target classes, including membrane proteins and disordered epitopes?
- Optimal scoring pipelines might be so target-specific that no single winner emerges across a portfolio, making the "pipeline search" step itself the expensive bottleneck
- If ESMFold2 becomes the new standard, the edge is transient — the question becomes whether there is always a next scoring function to find, or whether the field converges

## Connections
- [[Can LLMs design proteins?]] — TREM2 hackathon showing tool monoculture among AI agents
- [[Has Anthropic solved the peptide-binder design problem?]] — initial analysis of why Claude succeeded
- [[Anthropic has not solved the peptide-binder design problem, but maybe bi[o]hub has]] — ESMFold2 as the actual differentiator
- [[2026-06-18 biotech-of-one]] — protein design capability as infrastructure for one-person biotech

## Supporting evidence

## Challenges & counterpoints
