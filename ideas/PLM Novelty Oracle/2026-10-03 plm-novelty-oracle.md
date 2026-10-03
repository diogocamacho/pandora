---
type: exploration-hypothesis
created: 2026-10-03
evidence_supporting: 0
evidence_challenging: 0
evidence_last: 2026-10-03
tags: [exploration, hypothesis, what-if, protein-language-models, novel-function, protein-engineering, antimicrobial-peptides]
related_ideas: ["[[💡 Antimicrobial peptides]]", "[[2026-06-18 biotech-of-one]]", "[[2026-09-24 Property prediction models]]"]
---

# What if protein language model "low scores" are a positive directional signal for discovering new-to-nature function?

## The question
Every computational protein design campaign uses pLM scores to filter candidates — high pLM score means keep, low means discard. What if this is exactly backwards for any design objective involving genuinely new function? The pLM's penalty for a mutation might be precisely the evidence that the mutation escapes the current functional attractor — which is what you want when you're engineering new-to-nature capability.

## It turns out that…
Berry et al. (2026) showed systematically that PSSM − pLM outperforms pLM alone at identifying function-expanding mutations across multiple proteins [[Protein language models are overly constrained by covariation]]. The pLM penalizes covariation-violating mutations because it was trained on naturally occurring, viable proteins — which means it learned to preserve existing function, not discover new one. The signal that violates covariation context but appears in evolutionary data (PSSM) is the mutation most likely to escape functional constraints. Separately, Wilke's lab benchmarked 200+ datasets and found zero-shot pLM predictions are systematically uncorrelated — or anti-correlated — with function-enhancing mutations for novel-to-nature tasks [[How useful are zero-shot predictions of mutational effects?]]. The field is using pLMs to filter out exactly the candidates it needs.

## Why it matters if true
This is a platform-level inversion. Every current protein design effort uses pLM scores as positive selection criteria. If the PSSM − pLM dissonance signal is the correct oracle for novel function, a design platform built around that signal has a structural advantage over anything running standard pLM-guided generation/selection. The specific application domain: designing antimicrobial peptides and novel enzymes that need to perform functions not represented in natural protein space — exactly the new-to-nature regime where standard pLMs fail. If you're building D-backbone miniature binders (which are structurally foreign to any natural evolutionary context), the pLM's opinion may be even less predictive — and its disagreement with evolutionary priors even more informative.

## Key uncertainties
- The PSSM − pLM signal has been validated for natural L-amino acid proteins; does it transfer to D-backbone or other chemically non-natural scaffolds where the evolutionary record is absent?
- Accessible multiple sequence alignments for novel therapeutic targets may be too sparse for accurate PSSM construction — the signal only works where evolutionary coverage exists
- Candidates scoring high on PSSM − pLM may systematically fail on structural stability (Berry et al. showed this is a risk); a third filter combining stability prediction would be needed

## Connections
- [[Protein language models are overly constrained by covariation]] — Berry et al. primary evidence
- [[How useful are zero-shot predictions of mutational effects?]] — Woolley et al. benchmarking confirming the limitation
- [[💡 Antimicrobial peptides]] — direct application domain: new-to-nature antimicrobial function
- [[2026-06-18 biotech-of-one]] — protein design platform applicability

## Supporting evidence

## Challenges & counterpoints
