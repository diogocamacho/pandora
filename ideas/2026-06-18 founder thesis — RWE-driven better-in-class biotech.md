---
type: founder-thesis
date: 2026-06-18
status: draft-for-future-self
source: "[[2026-06-18 biotech-of-one]]"
tags: [founder-thesis, biotech, drug-discovery, ai-ml, rwe, small-molecules, c-level]
---

# Founder thesis — RWE-driven better-in-class biotech

> Companion to [[2026-06-18 biotech-of-one]] — the Plato session that surfaced this thesis after eight rounds of challenge. **Audience for this memo: future Diogo, 6-12 months from now, deciding whether to act.** This is not an investor pitch. It is the document that helps future-Diogo decide whether this is worth doing at all.

---

## Thesis (one sentence)

A new venture that uses LLM-augmented inference over multi-omics, structured biology, and real-world evidence to do **indication-first target prioritization**, then **generative small-molecule chemistry**, in a closed loop — with the explicit positioning of producing **better drugs than the current standard of care** in indications the AI-bio incumbents are ignoring.

---

## Why now

Three things have shifted since Selventa-era attempts at signature → causal-target inference failed:

1. **LLM-driven extraction of biological relations** at literature scale, with tool-augmented constraint enforcement (MCPs over BioGRID, STRING, proteomics databases, pathway resources). This replaces the hand-curation bottleneck that broke Selventa.
2. **Foundation models reasoning across data types** (genomics, proteomics, RWE) at a scale that hand-built knowledge graphs could not approach.
3. **Generative small-molecule chemistry** has matured enough that de novo design produces developable starting points, not just publications.

None of these alone makes the venture. The combination does.

---

## The bet — four layers

- **Layer 1 — Indication discovery.** RWE-driven analysis identifies indications where the current standard of care has documented failure modes: subgroups responding poorly, disabling adverse events, off-label drift, gaps between RCT efficacy and real-world effectiveness.
- **Layer 2 — Target inference.** LLM + structured biology + multi-omics produces causally-supported targets that specifically address the Layer 1 failure modes. Not "the next great target" — *the target that fixes the documented problem with the existing drug*.
- **Layer 3 — Asset generation.** Generative small-molecule chemistry (contrastive learning, structure-aware diffusion, graph generation) produces leads optimized for the property profile demanded by Layer 1 (better safety, faster onset, fewer DDIs, etc.).
- **Layer 4 — Closed loop.** Wet-lab validation feeds back into all three preceding layers — re-prioritizing indications, refining targets, retraining generative models.

**Output:** clinical-stage assets that are *better* than current SoC in indications incumbents have not picked.

---

## The moat

Not the AI stack — that is consensus. The moat is **the integration plus the RWE substrate**:

- RWE × target inference × better-in-class positioning is not cleanly executed by any current player.
- Generative chemistry leaders (Isomorphic, Iambic, Schrödinger) start from known targets, not from indications and RWE failure modes.
- Target-discovery players (BenevolentAI, parts of Recursion) don't have a generative chemistry arm or an explicit better-in-class lens.
- Combining indication selection + RWE + target inference + generative chemistry under one roof, with closed-loop validation, is the differentiator.

---

## What this is NOT

- **Not a platform play.** Platforms have struggled commercially; this is asset-generating from day one. The platform exists to feed the pipeline, not to be sold.
- **Not first-in-class.** Better-in-class. Lower discovery risk; higher commercial bar (have to beat SoC head-to-head eventually).
- **Not oncology, I/O, or obesity (initially).** Those are crowded by incumbents and by AI-bio competitors. The bet is on indications the AI-bio crowd has skipped — likely candidates include depression, hypertension, migraine, T2D outside GLP-1, NASH-adjacent fibrotic disease, chronic pain, autoimmune outside biologics — to be narrowed during indication-discovery work.

---

## The primary unresolved item: RWE data path

This is the single most consequential unknown. Three options, each with sharply different implications for what the company is in year one:

- **Buy access** (Optum, IQVIA, Truveta, HealthVerity, Komodo, Datavant). Fast. But the moat lives with the data vendor; the differentiator becomes commodity, and pricing power moves to the seller.
- **Build internally.** Acquire de-identified data and structure it. Capital-intensive, slow, but Diogo owns the moat.
- **Co-build with a hospital system.** *Mass General Brigham* is the obvious local play (Boston-based, world-class data infrastructure, existing Flagship relationships likely accessible). Hardest to execute, most defensible. Patient-driven differentiation becomes a real moat; the relationship is geographically and culturally aligned with Diogo's network.

**Current lean: co-build.** Hardest path, but it is the only one where RWE access *is* the moat rather than commodity input. Worth investigating before committing.

**Adjacent question worth a side investigation:** Mass General Brigham, Dana-Farber, [[Beth Kartchner|Beth]] Israel — all have research-grade EHR programs. Which one has the right combination of (a) willingness to commercial-partner, (b) data depth in the indications most likely to surface from Layer 1, and (c) cultural fit with a venture-backed startup?

---

## What would kill this

1. **Data path doesn't resolve.** Co-build conversations stall; buy-access economics make the moat impossible; build is intractable in any reasonable time frame.
2. **Generative chemistry commoditizes faster than integration becomes defensible.** The Layer 3 advantage erodes before Layers 1+2 produce wins.
3. **A current incumbent makes the integration play first.** Isomorphic + a credible RWE partnership; Recursion+Exscientia post-merger ships indication-first; BenevolentAI rebuilds with the generative arm. Any of these renders the bet derivative.
4. **Better-in-class commercial reality bites.** Payers refuse to pay premiums for marginal SoC improvements; me-better drugs face higher hurdles than projected. The economics that motivated the small-molecule pick stop working.

---

## Decision criteria for future Diogo

When this note is revisited (6 months by default, or earlier if a trigger fires), Diogo should be able to answer:

1. **Data path:** Has at least one option (buy / build / co-build) become tractable? If co-build is the path: has Mass General Brigham or a comparable system shown genuine interest?
2. **Capability shift:** Has a paper / disclosure / foundation-model release demonstrated the constraints layer working in a published, replicable case study?
3. **Competitive move:** Has a current AI-bio incumbent shipped a version of this that would render the bet irrelevant or derivative?
4. **Capital path:** Is there a credible route to fund 24 months of pre-asset work?

---

## Wake-up triggers (revisit earlier than 6 months if)

- A paper / FM disclosure shows the constraints layer working in a published case study.
- A competitor announces an integration play (RWE × generative chem in one stack).
- Mass General Brigham or another major system signals openness to a venture-style partnership.

---

## Provenance

This memo is a downstream artifact of the Plato session captured in [[2026-06-18 biotech-of-one]]. That note contains the eight rounds of challenge that pressure-tested the thesis — including the Cellarity / LINCS counter-evidence, the Selventa precedent, the competitive landscape, and the scope decisions. **Do not write the investor pitch from this memo yet** — write it from the same source if and when the decision criteria above resolve favorably.

This venture lives in Diogo's head and in pandora. Nothing more, for now.
