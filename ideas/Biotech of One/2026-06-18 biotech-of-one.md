---
type: idea
date: 2026-06-18
mode: challenge
status: promoted-to-project
tags: [idea, comp-bio, drug-discovery, agents, strategy, c-level, small-molecules]
---

# Biotech of the future — constrained inference + generative small-molecule chemistry, closed loop

## The idea
Thought exercise — not a literal "biotech of 1," and not a "shrink the comp team" play. Real framing: in the age of agentic AI, what does the biotech of the future look like with the goal of getting **better drugs to market faster**? Diogo explicitly rejects agentic systems that just do automation. The "happy place" is agents that help with **judgment** problems — disease area selection, new modalities, rethinking how existing data is used, or how better data is collected. Direct context: Abio. Indirect context: C-level positioning thesis at FSP.

**Diogo's pick (of the four happy places):** *Data usage / re-mining historical data.*

## What's load-bearing
- **Goal:** better drugs, faster — NOT cost reduction, NOT compression of the comp team.
- **Strategy:** expansion / redirection, not automation.
- **Agents for judgment, not execution.** This contradicts current consensus (agents = good at execution, weak at original judgment).
- **Named failure mode (Diogo's commit):** Novelty bias in modality choice. The field chases shiny new tech (spatial transcriptomics, single-cell proteomics) because it's more fundable / publishable / demoable, not because old data was exhausted. Decades of microarray + bulk RNA-seq + clinical data still carry residual signal that modern ML methods can extract.
- **Implied claim:** The next wave of drug targets / phenotype explanations is hidden in data the field has moved past, and modern agent-driven re-mining can surface them.

## Strongest case for

### The thesis (current crisp form)
> Cellarity failed at an **abstraction-level mismatch** — ML predicted molecules that revert transcriptional signatures, but chemistry develops drugs against **molecular targets**. The biotech-of-the-future bet: use signatures as *input*, but project them to causal targets via multi-omics + graph/network reasoning (Selventa-style, modernized), then hand chemistry a *target* with the signature as supporting evidence rather than the deliverable.

### Supporting points
- The Cellarity failure was concrete and Diogo lived it: head of chemistry rejected on (1) compounds were shit, and (2) you can't develop a drug against a transcriptional signature — only against a target.
- Diogo's instinct (proteomics + graph/network representation à la Selventa) is the right shape of the missing layer.
- **Q1 answered (Selventa unlock):** LLM + MCPs + structured biology databases (BioGRID, STRING, proteomics DBs) provides the reasoning + tool-augmented-constraints layer that Selventa lacked. The unlock is LLM reasoning trained on massive data, constrained by biological evidence via tooling.
- **Q2 answered (scope):** Indication → druggable target list with causal support. Chemistry happens downstream. Clean boundary.
- Diogo notes this is "essentially the target prioritization play at [[Abiologics Home|Abiologics]], almost" — meaning the operational shape is similar to work he already runs. The **almost** is the unresolved delta and is load-bearing for whether this is C-level positioning or "scale up what we do."

### Pipeline shape (current best statement)
Indication / disease hypothesis → multi-omics + KG reasoning (LLM + MCPs + biological-evidence constraints, Zitnik-style with RWE) → causally-supported druggable target list → generative chemistry (contrastive learning / generative AI) for small-molecule assets → wet-lab validation → closed loop back to constraints layer.

### Crisp thesis (final form after 8 rounds of challenge)
> A new venture. Indication-first, with RWE-driven prioritization of targets within indications where the standard of care has specific, documented failure modes. Agent system: LLM + MCPs + structured biology databases + RWE → causally-supported targets → generative small-molecule chemistry → closed-loop validation. Competitive claim: **better-in-class drugs in indications the AI-bio incumbents are ignoring** because they are chasing oncology, I/O, and obesity. The integration of RWE-driven indication selection + better-in-class positioning is the moat.

### Q1 answer (committed): constraints + asset
The distinctness claim is the *combination* of (a) constraints — Zitnik-style multi-omics + RWE + LLM inference for target prioritization — and (b) asset — generative chemistry on top (contrastive learning, generative AI) for the molecules. Closed-loop. Requires chemist mindset shift to accept generatively-designed compounds as developable.

### Q2 answer (committed): small molecules
Small molecules as the modality. Economics make more sense (better margins, lower COGS), properties can be tuned (internalization, half-life, ADME), expansion to other modalities later if tech permits. **NOT Abio's current modality** — this is a key reframe of the thesis identity.

### Final commit (exchange 8)
- **Thesis identity:** New venture. Founder mode. Not an Abio pivot. Not just a positioning artifact.
- **Moat:** Indication-first with RWE prioritization of targets within those indications. Positioning: "better drug than what you're taking" — go to indications with existing standard of care but documented RWE failure modes.
- **Coherent integration:** RWE specifically surfaces which subgroups fail current therapy, which adverse events are disabling, where off-label use signals unmet niches. The constraints layer identifies new targets that address those specific failure modes. This is genuinely the RWE × target-discovery integration that incumbents have not built cleanly.

## Strongest case against
- **This is NOT Abio.** Small-molecule pick decouples this thesis from Abio's current modality (designed proteins / peptides). Three readings are now live, with very different implications:
  - Partner-meeting positioning artifact (low commitment, useful for FSP positioning + C-level)
  - Abio pivot argument (high friction — contradicts the modality thesis Abio was funded on; Mike Hamill conversation)
  - Founder thesis for what comes after Abio / FSP (different conversation entirely)
  Diogo has not committed to which.
- **Most crowded sector in AI-bio.** Generative chemistry for small molecules has 8+ well-funded competitors with significant head starts: Isomorphic Labs, Recursion+Exscientia (merged), Iambic, Generate, Insilico Medicine, Schrödinger, Atomwise, Cradle, Anagenex. Some have Google's capital. Some have decades of FEP / docking infrastructure. Some have wet-lab-at-scale.
- **"Constraints + asset, closed loop" is directional, not yet a moat.** The thesis needs a specific differentiator. Candidates (Diogo must commit):
  - Indication-first integration (target *and* molecule from indication input — none of the leaders have made this cleanly)
  - RWE-aware target prioritization (genuinely under-used in current small-molecule AI)
  - Closed-loop cycle time at days, not weeks
  - Proprietary data (what data would the system have that competitors don't?)
- **The chemist mindset shift is still hand-wavy.** Real blockage isn't "accept AI molecules" — chemists already use AI tools. It's "trust the AI when it disagrees with chemistry intuition." That's a calibration problem (evidence cadence, failure tolerance, human-on-the-loop discipline), not a cultural reset. Needs operationalization.
- **"Causal" still risks slippage.** LLM + KG reasoning is largely associative dressed as causal. Real causal claims require perturbation data + explicit intervention modeling.
- **Selventa unlock argument still partially under-defended.** Diogo answered with "LLM + MCPs + databases" but didn't pick which specific 2026 capability (LLM relation extraction, proteomics depth, foundation-model reasoning, compute) does the heavy lifting. Lower priority now that the thesis has moved on, but still a gap.

## Open questions (remaining before promotion)

1. **What is this thesis *for*?** Pick one (or explicitly hold multiple with a trigger to decide):
   - Partner-meeting positioning artifact at FSP
   - Argument that Abio should pivot / extend to small molecules
   - Founder thesis for what comes after Abio
2. **What's the specific moat in a crowded sector?** Indication-first integration / RWE-aware prioritization / fast closed-loop cycle / proprietary data — or a specific combination. Without a sharp answer, this loses to better-funded incumbents.

### Lower-priority opens
- Chemist mindset shift — operationalize as a calibration / evidence-cadence problem, not a cultural reset.
- Causal vs. associative reasoning — is associative-with-evidence enough at prioritization, or does the system need explicit intervention modeling?
- Selventa unlock — which specific 2026 capability does the heavy lifting (LLM extraction / proteomics depth / FM reasoning / compute)?

## Whitespace check
- **Now that the modality pick is small molecules, the whitespace argument weakens significantly.** Generative chemistry for small molecules is the most crowded AI-bio sector (8+ well-funded competitors with head starts).
- **Where whitespace might still exist:** the *vertical integration* from indication → target → asset in a single coherent system. Most current leaders do parts of this:
  - Isomorphic / Iambic / Schrödinger — strong on chemistry, weaker on target discovery
  - BenevolentAI — strong on target side, weaker on chemistry
  - Recursion+Exscientia — broader but post-merger integration is still in progress
  - No dominant player has cleanly integrated RWE + multi-omics-constrained target prioritization + generative chemistry + closed-loop validation in one system.
- **The whitespace, if real, is the integration play.** That's also the hardest version to execute — requires data across both stacks, wet lab across both stacks, and team capability across both stacks.
- **Caveat:** "we'll integrate two crowded sectors better than incumbents" is a thesis that's easier to write than to defend. Diogo needs to be precise about WHY the integrated play is genuinely better than two best-in-class point solutions stitched together.

## Next steps

### Primary unresolved gap to address in the next artifact
**The RWE data path.** Real-world data is the moat in this version of the thesis — and it is gated. Three reads, each with very different implications for what the company is in year one:
- **Build:** Acquire de-identified data and structure it yourself. Capital-intensive, slow, but Diogo owns the moat.
- **Buy access:** Partner with an RWE aggregator (Optum, IQVIA, Truveta, HealthVerity). Fast but the moat lives with the aggregator.
- **Co-build with a payer or provider system:** Hardest to execute, most defensible. The patient-driven differentiation becomes a real moat.

### Secondary question for the memo
**Where does this venture live?** New FL-numbered Flagship spinout (Mike + Raffi network, shorter capital path, Diogo retains FSP equity) or external (cleaner founder economics, harder fundraise, requires eventual departure). Different conversations, different timing relative to the C-level positioning push.

### Next action — handoff to Sarah
Convert this note into a **2-page founder thesis memo**. Audience: future Diogo, 6-12 months from now, deciding whether to act. Primary unresolved item: the data path (above). Don't write an investor pitch yet — that's premature. Write the version that helps Diogo decide whether this is worth doing at all.

### Pre-memo reading (for Diogo)
- Recent **Marinka Zitnik** papers on multi-omics + RWE integration.
- **Isomorphic Labs, Recursion+Exscientia, Iambic** recent disclosures — current state of the crowded sector; what gaps does the integration thesis genuinely fill?
- **BenevolentAI** post-mortem — closest analog on the target-discovery side.
- **An RWE-for-drug-discovery overview** to confirm or refute the under-utilization claim.
- **One existing "better-in-class" winner** case study (Madrigal / Vertex / Insmed) — what made the better-drug strategy work?

### Wake-up triggers
- A specific paper / FM disclosure shows the constraints layer working in a published case study.
- Diogo's C-level positioning push at FSP needs the memo to anchor a partner conversation.
- A competitor (Isomorphic, Recursion+Exscientia) makes a public move that validates or kills the integration thesis.
- Conversation with Mike Hamill organically opens the door to "what would FL112 look like?"

## Status
- [ ] open
- [ ] parked
- [ ] killed
- [x] promoted-to-project (2026-06-18, after 8 rounds of Plato challenge)
