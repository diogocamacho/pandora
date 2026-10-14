---
type: paper-analysis
title: "Therefore I am. I Think"
doi: "10.48550/arXiv.2604.01202"
source: "https://arxiv.org/abs/2604.01202"
authors: ["Esakkivel Esakkiraja", "Sai Rajeswar", "Denis Akhiyarov", "Rajagopal Venkatesaramani"]
year: 2026
venue: "arXiv (preprint)"
peer_reviewed: false
clip: "[[Therefore I am. I Think]]"
analyzed_on: 2026-10-14
verdict: mixed
tldr: "A linear probe decodes a reasoning LLM's tool-call decision from pre-generation activations at >90% AUROC — before any reasoning token — and steering that direction flips behavior while the chain-of-thought rationalizes the flip; strong evidence that for binary tool-calling the decision often precedes the 'reasoning,' though the scope is narrow and the causal story rests on two models."
reviewer_divergence: minor
tags: [paper, interpretability, chain-of-thought, llm-reasoning, activation-steering, agentic-ai]
idea-supports:
idea-challenges:
---

# Therefore I am. I Think

## TL;DR & verdict
- **Main result:** A logistic-regression probe on pre-generation activations predicts whether a reasoning LLM will call a tool at >90% AUROC (>95% in 3 of 4 model/benchmark cells) *before the first reasoning token*; mean-difference activation steering of that direction flips the decision in 3–79% of cases, and an LLM-judge behavioral analysis finds the chain-of-thought then rationalizes (confabulates support for / overrides constraints toward) the flipped decision rather than resisting it.
- **Verdict — mixed:** The probing result is clean and the causal steering is a real step beyond correlation, but the evidential weight is narrow (2 models in the causal analysis, binary tool-call-vs-not, 2 benchmarks) and the headline "decide first, think second" generalizes further than the data (one decision type) licenses. Solid within scope; the framing overreaches.
- **Biggest author/reviewer divergence (minor):** The data-only read supports "pre-generation activations are highly predictive of the eventual binary decision" but treats the stronger claim — that the model has *committed* to an action before deliberating and the CoT is post-hoc — as partly interpretive; high decodability ≠ irreversible commitment, and steering flip rates vary enormously (3% to 79%) by model/benchmark/α.
- **Biggest weakness:** Scope. Binary tool-call decisions on two agentic benchmarks with two causally-analyzed open models; the behavioral "rationalization" labels come from LLM judges (Claude Sonnet 4.6, GPT-5.4) over 6 fuzzy categories, not human adjudication.
- **Why it matters:** For anyone deploying agentic LLMs (tool-calling, function-calling), this is direct evidence that the visible chain-of-thought is not a faithful log of how the action decision was made — a safety/interpretability warning with teeth, since the decision is partly pre-committed and the CoT can confabulate justification.

## Main idea
Reasoning LLMs emit a chain-of-thought before acting, and we tend to read that CoT as the deliberation that produced the action. This paper asks the causal-ordering question for a concrete decision — whether to call a tool: does the model think then decide, or decide then think? It trains linear probes on hidden activations at multiple layers and token positions (including a "pre_gen" position before any reasoning token) to decode the eventual tool-call decision, then uses mean-difference activation steering to perturb that decision direction and measures (a) how often behavior flips and (b) how the resulting CoT behaves (resists vs. rationalizes). The thesis: detectable, early-encoded action decisions shape the subsequent reasoning text, implying CoT is at least partly a post-hoc narration of a pre-formed choice.

## Key findings — claims ledger
| # | Claim | Evidence (fig/panel) | Grade | Reviewer | Confidence |
|---|-------|---------------------|-------|----------|------------|
| 1 | Pre-generation activations decode the tool-call decision at >90% AUROC (>95% in 3/4 cells) | Fig 2 | direct | agrees — decodability is solid | High |
| 2 | Pre_gen decisions agree with think_end decision >80% of the time | Results | direct | agrees | Medium-High |
| 3 | Steering the decision direction causally flips behavior (3–79%) | Table 1 | direct | agrees — but huge variance by model/benchmark/α | Medium |
| 4 | When flipped, CoT rationalizes rather than resists (confabulated support / constraint override) | LLM-judge analysis, Tables 2–4 | indirect | weaker — LLM-judge labels, fuzzy 6-class scheme | Medium |
| 5 | Steering inflates deliberation (reasoning tokens 1.05–2.30×) | Table 2 | direct | agrees | Medium-High |
| 6 | Therefore reasoning models "encode action choices before they begin to deliberate" | Synthesis | asserted | partly interpretive — decodable ≠ committed | Low-Medium |

## Methods audit
- **Models:** Causal analysis on **two** open reasoning models — Qwen3-4B and GLM-Z1-9B. GPT-OSS-20B appears in appendix only and is excluded from causal analysis (MoE architecture). Two models is thin for a general claim about "reasoning models."
- **Benchmarks:** When2Call (NVIDIA; 3,652 MC test + 300 LLM-judge examples; categories tool_call ~57% / direct ~12% / request_for_info ~14% / cannot_answer ~17%) and BFCL v3 (base+live; Irrelevance+Simple reduced to binary call/no-call). The task is deliberately collapsed to a **binary** decision.
- **Probe:** Logistic regression (BCE), layers sampled every 4–5 across depth, nine token positions from pre_gen through think_end; 5-fold stratified CV reported as AUROC; 100 held-out examples per model/direction/benchmark for steering eval. Standard, appropriate; no obvious leakage (CV + held-out).
- **Steering:** Mean-difference vector v = μ₊ − μ₋ from pre_gen activations, added as h' = h + αv; α ∈ {4,8,12} (Qwen/GPT-OSS) or {10,20,30} (GLM, higher norms). Simple, interpretable, standard technique.
- **Behavioral analysis:** Two LLM judges (Claude Sonnet 4.6, GPT-5.4), temperature 0, each pair judged twice with reversed order; 6 categories (seamless divergence, confabulated support, constraint override, inflated deliberation, decision instability, no meaningful difference). Inter-judge agreement reported as above a 1/36 random baseline (a weak bar for a 6-class scheme) with 7–38% disagreement depending on condition. The central "rationalization" finding therefore rests on automated, moderately-agreeing judgments over fuzzy categories, not human adjudication.
- **Stats / scope:** Flip rates reported as ranges across α, not with CIs; the attention-grabbing "7–79%" spans the full model×benchmark×α grid (e.g. GLM-Z1-9B BFCL injection: 21% at α=12, 79% at α=30; GLM When2Call as low as 3%). No formal limitations section.
- **Leakage check:** The probe could in principle pick up prompt features that trivially determine the answer (e.g. When2Call's category balance); the paper mitigates with the causal steering (which doesn't change the prompt) — the steering is what elevates this above a correlational probe.

## Independent reviewer
### Reviewer's conclusions (data only — Methods/Results/tables/figures, blind to abstract/intro/discussion)
1. A linear probe on pre-generation activations predicts the eventual binary tool-call decision at >90% AUROC across two models and two benchmarks (Fig 2), and pre_gen and think_end decisions agree >80% of the time. The decision is highly decodable before any reasoning text — robust.
2. Adding a mean-difference steering vector to pre_gen activations causally changes the decision in a highly variable fraction of cases (3–79%, Table 1), scaling with α and differing sharply by model and benchmark. The *existence* of a causal decision direction is supported; the *magnitude* is not a single number and is small (e.g. 3–11%) in some cells.
3. Steering increases reasoning-token counts (1.05–2.30×, Table 2) — the model talks more after being pushed.
4. LLM judges label flipped cases predominantly as confabulated-support / constraint-override rather than resistance (Tables 2–4), with inter-judge agreement above a trivial baseline but substantial disagreement (7–38%). This supports "CoT rationalizes flips" moderately, not strongly, given the judging methodology.
5. Cannot determine, from the data, that the model has *committed* to an action before deliberating in a strong sense: high pre_gen decodability is consistent with the prompt largely determining the answer and the activations reflecting that — "encoded" is well-supported, "decided before thinking" is a stronger reading than the binary-task data strictly establishes.
- **Most serious weaknesses:** two causal models; binary single-decision-type scope; LLM-judge-based behavioral labels; flip-rate variance undercuts a clean causal magnitude; no CIs.
- **Missing experiments:** human adjudication of the rationalization categories; more models and non-binary / multi-step agentic decisions; a test distinguishing "prompt determines answer, activations reflect it" from genuine early internal commitment.

### Authors vs reviewer
| Claim | Authors | Reviewer | Agreement |
|-------|---------|----------|-----------|
| Decision decodable pre-reasoning (>90% AUROC) | Core claim | Fully supported | agrees |
| Steering causally flips behavior | Core claim | Supported in existence; magnitude highly variable (3–79%) | agrees (with caveat) |
| CoT rationalizes rather than resists | Behavioral finding | Moderately supported; LLM-judge-dependent | weaker than claimed |
| Models encode choices "before they begin to deliberate" | Headline synthesis | "Encoded" yes; "decided-first" is partly interpretive | weaker / reframed |
| Generalizes to "reasoning models" | Framing | 2 causal models, binary task | reviewer narrows scope |

**Reviewer divergence summary: minor.** The decoding and steering results are agreed; divergence is the reviewer narrowing the generalization ("reasoning models" → binary tool-calling in two models) and softening the behavioral claim given the LLM-judge methodology.

## Adversarial context
### Steelman
The pairing of a predictive probe with causal steering is the right design — it defends against the "probes just read off correlates" critique by showing that perturbing the decoded direction *changes behavior*. The pre_gen decodability at >90% AUROC is a striking, clean result, and the finding that the CoT inflates and rationalizes after a forced flip is a genuinely useful and slightly unsettling observation for agentic-AI faithfulness.

### Red team
The scope is a single, binary decision (call a tool or not) in two open models on two benchmarks, yet the title and framing make a sweeping claim about reasoning and selfhood. The flip-rate "7–79%" headline is a range spanning a grid where some cells are 3%; cherry-reading the high end overstates the causal grip. The behavioral "rationalization" result — arguably the most interesting claim — is adjudicated by LLM judges over fuzzy categories with up to 38% disagreement, not humans.

### Alternative explanations
The whole pattern is consistent with the prompt largely determining the correct action, the model computing that early (as any competent system would), the activations encoding it, and the CoT being a mostly-faithful elaboration — with steering simply overriding a well-formed prior and the model then doing its best to stay coherent (which a judge reads as "rationalization"). Under this reading, "decide first, think second" is an overstatement of "the easy cases are decided early."

### Falsifying experiment
Stratify by problem difficulty and multi-step agentic tasks (not binary): if pre_gen decodability and the CoT-rationalization effect collapse on genuinely hard, multi-step decisions where the reasoning plausibly does the work — and hold only on trivially-determined binary calls — then the strong "CoT is post-hoc" thesis is falsified as a general property and reduces to a statement about easy decisions.

## Avenues to explore
- Directly relevant to agentic-platform design: if tool-call decisions are pre-committed and the CoT can confabulate justification, then CoT is not a trustworthy audit log for agent actions — argues for activation-level monitoring (probes) over CoT inspection for safety-critical tool use.
- Extend from binary to multi-step planning and to larger / closed models to test generality.
- A faithfulness benchmark: measure the gap between probed pre_gen decision and stated CoT justification as a per-model "rationalization score."

## Growing ideas
(No specific connection to current idea notes — this is an LLM-interpretability / CoT-faithfulness result; the vault's active threads are protein design, network biology, nanopore, and nutrition. Tangentially cautionary for any agentic / LLM-optimizer idea that trusts chain-of-thought as a faithful record, but no genuine support/challenge to a specific idea note.)
