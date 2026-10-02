---
title: "Can LLMs design proteins?"
source: "https://www.adaptyvbio.com/blog/agents-vs-humans"
author:
published: 2026-05-13
created: 2026-10-02
description: "After a busy few weeks of binding assays, we're ready to release the results from the muni × Adaptyv TREM2 hackathon. 16 teams designed binders against TREM2 in a single day in San Francisco: 10 human teams and 6 fully autonomous AI agents, 141 designs total, top 100 by Boltz-2 ipSAE to the wet lab. Out of these, 37 were binders. Agents tied humans on hit rate and binding affinity distribution, with the best human binder at 1.11 nM and best agent at 3.64 nM, and all six LLM agents independently picked the same design tool."
tags:
  - "clippings"
---
![Can LLMs design proteins? ](https://www.adaptyvbio.com/api/notion-image?pageId=3595ca69-e7be-80b5-ab85-d6e3e6841cbb&dpl=dpl_Bsaio4WCaxexwfMbmiLzvhdcoFwz)

/Article

/TL;DR

- \-16 teams (10 human, 6 fully autonomous AI agents) submitted 141 designs against the TREM2 target in a single day in San Francisco. We selected the top 100 by Boltz-2 ipSAE for wet-lab validation.
- \-37 / 100 lab-tested designs bound their target, while 11 did not express and 52 did not bind.
- \-Humans yielded 25/65 (38.5%) binders and agents had 12/35 (34.3%).
- \-The best human binder was 17\_MRAZS\_mosaic at 1.11 nM via Mosaic, with the best agent binder 132\_GPT\_5\_2\_PXDesign at 3.64 nM via PXDesign.
- \-All six LLM agents independently picked PXDesign, hinting towards a tool monoculture.

**… or how AI agents tied 10 human teams at designing TREM2 binders.**

After a busy few weeks of binding assays, we're ready to release the results from the **muni × Adaptyv TREM2 hackathon**, in which 10 human teams and 6 fully autonomous AI (LLM) agents working end-to-end on [muni's](https://www.muni.bio/) platform designed binders against TREM2, a target implicated in Alzheimer’s disease. This [took place in San Francisco, in a single day](https://luma.com/a6t92ohv). Participants contributed 141 designs in total, with the top 100 by Boltz-2 ipSAE going to the wet lab. Today, all results are [live on Proteinbase](https://proteinbase.com/collections/adaptyv-x-muni-hackathon-ai-agents-vs-humans). We will further showcase some interesting findings throughout this hackathon and, of course, tell you which team (humans or agents) won it. Or, even more surprising, that both teams in fact *tied*.

![Blog image](https://www.adaptyvbio.com/api/notion-image?blockId=35e5ca69-e7be-801c-b3cb-d9518e406100&dpl=dpl_Bsaio4WCaxexwfMbmiLzvhdcoFwz)

Blog image

### What the hackathon was, and who showed up

[muni](https://www.muni.bio/) is the platform the agent teams ran on, a sandboxed environment in which an AI agent gets a target sequence, budget, and tool access. It is then expected to design proteins without a human supervising it. First, let’s define what an (LLM) "Agent" is: it means a state-of-the-art language model (think ChatGPT or Claude), with access to tools (via a [Model Context Protocol or MCP](https://modelcontextprotocol.io/docs/getting-started/intro)), with a single starting prompt. In this hackathon, the agent picked the tools, built a pipeline, ranked its own outputs, and submitted the final 10, which is to say it does *not* mean “an LLM was asked to randomly generate 10 sequences”. All agents ran autonomously on muni.

The rules were straightforward: at most 10 designs per team, all designs targeting the TREM2 IgSF V-set domain, sequences required to be at least 10 amino acids different from any known therapeutic. 16 teams participated, contributing 141 designs to the pooled submissions table. Ten of those were humans (with 81 designs across them) and six were autonomous agents, namely Claude Sonnet 4.6, Qwen 3.5 Plus, Grok 4.1 Fast, Gemini 3.1 Pro, GLM 5, and GPT 5.2 (with 60 designs).

### Meeting the target: TREM2

We picked TREM2 because it's a hard, therapeutically relevant target that the field hasn't "solved” (yet). Structurally, as a transmembrane protein, it is composed of an extracellular “V-set” domain, which is the main region for ligand binding, a stalk region (connecting the V-set to the membrane), a transmembrane domain, and a cytoplasmic tail inside the cell. Biologically, it acts as a sensor of lipid debris and cell damage in the brain and further [activates the microglia (brain’s immune cells) to clear out neurotoxic β-amyloid (Aβ) peptides](https://www.nature.com/articles/s41577-023-00837-1). These peptides form the amyloid plaques specific to with Alzheimer’s disease (AD).

There are some therapeutics targeting TREM2 in ongoing pipelines, but most missed the mark. For example, Alector and AbbVie's [AL002](https://www.alzforum.org/therapeutics/al002) missed its [primary trial endpoint](https://www.nature.com/articles/s41591-025-03816-2) in November 2024 with a humanised antibody that bound the disordered stalk rather than the V-set of TREM2. Another binder is Novartis's [VHB937](https://www.alzforum.org/therapeutics/vhb937) targets the V-set directly and is the structurally distinct successor, currently in Phase 2 for early AD. The V-set is therefore open territory for *de novo* binders, and we wanted to see what the community could do against it in a single day.

As an insight into how we develop these challenges, the choice was also more practical, as we wanted to work on an Alzheimer’s target with muni’s founder, Kat. We'd been discussing about α-synuclein (forming protein deposits also characteristic of AD) for two weeks and dropped it once we agreed monomeric α-syn (easy to express in cell-free) is not the disease-driving species. Thus TREM2 was the right kind of “expressible and meaningful”.

![Blog image](https://www.adaptyvbio.com/api/notion-image?blockId=35e5ca69-e7be-804d-8e28-cfc1c6197514&dpl=dpl_Bsaio4WCaxexwfMbmiLzvhdcoFwz)

Blog image

Every team received [this brief](https://docs.google.com/document/d/19VqpJOuA2K4yoDsGjvu1a3p_IdsliDLNAEVPi6GCjvE/edit?tab=t.0#heading=h.wt2e6rd7n2oc) at the start of the day, with the full target context, structural input, and design constraints.

### Selecting the top 100 via ipSAE

We ranked all 141 designs by [Boltz-2 ipSAE\_d0res](https://www.biorxiv.org/content/10.1101/2025.02.10.637595v2), with pae\_cutoff = 15.0 and dist\_cutoff = 15.0, then sent the top 100 to the wet lab. We chose ipSAE because it is the [cleanest published](https://www.biorxiv.org/content/10.1101/2025.08.14.670059v2) [*in silico*](https://www.biorxiv.org/content/10.1101/2025.08.14.670059v2) [filter](https://www.biorxiv.org/content/10.1101/2025.08.14.670059v2) we have for binder triage right now, and because we ran the same metric for the [Nipah competition](https://proteinbase.com/collections/nipah-binder-competition-results) the numbers are comparable round-to-round.

One important thing to flag is that the top 100 selection split 65 human / 35 agent, even though the submission split was 81 / 60. Agents lost 25 of 60 designs at the *in silico* cut whilst humans lost only 16 of 81. It seems humans were more capable at maximizing the ipSAE score, which we attribute to just running the design jobs for longer than an agent with limited context size.

![Blog image](https://www.adaptyvbio.com/api/notion-image?blockId=35e5ca69-e7be-80fd-9afe-dfd27f5ab553&dpl=dpl_Bsaio4WCaxexwfMbmiLzvhdcoFwz)

Blog image

### We expected a clear winner, and yet we got a tie

When looking at the per-cohort performance (humans vs agents), we had initially expected one cohort to come out ahead and we did not get that for hit-rates, nor for the binding affinity distributions.

We see a 38.5% (humans) versus 34.3% (agents) gap in the hit-rates, with a bootstrap 95% CI of \[-14.7, +23.5\] points. Statistically, this is a null, also confirmed by a Fisher’s exact test. The pK\_D distributions among binders look the same too, with a median pK\_D of 7.04 (~92 nM) for humans and 6.98 (~106 nM) for agents (Mann-Whitney p = 0.75). Thus, when looking at hit rates and on affinities, the two cohorts look identical.

![Blog image](https://www.adaptyvbio.com/api/notion-image?blockId=35e5ca69-e7be-8066-87ad-d0ca19501c99&dpl=dpl_Bsaio4WCaxexwfMbmiLzvhdcoFwz)

Blog image

The cohorts separate at the top and at the bottom of the ranking. At the top, the best human binder (MRAZS's 17\_MRAZS\_mosaic) sits at 1.11 nM, although the best agent binder (132\_GPT\_5\_2\_PXDesign) sits at 3.64 nM, about 3× weaker. Three of the top four binders overall come from MRAZS, all using the same tool (more on that below). At the bottom of the ranking, 19% of agent designs failed to express versus only 7% for humans.

![Blog image](https://www.adaptyvbio.com/api/notion-image?blockId=35e5ca69-e7be-8096-9ee7-de2d6f3b449b&dpl=dpl_Bsaio4WCaxexwfMbmiLzvhdcoFwz)

Blog image

### Per-team performance

The cohort tie hides a lot of variance, especially among the agents. Agent hit rates spanned from GPT 5.2 at 57.1% (4 of 7 lab-tested designs) down to Gemini 3.1 Pro at 0% (0 of 6), with Claude Sonnet 4.6 second among agents at 50.0% (4 of 8). The human teams clustered tighter, with MRAZS topping the table at 62.5% (5 of 8) and a long tail of teams clustered between 20% and 40%. The two best per-team hit rates (MRAZS 62.5%, GPT 5.2 57.1%) sit within a coin flip of each other on this N, although the affinity gap remains quite visible at the top.

![Blog image](https://www.adaptyvbio.com/api/notion-image?blockId=35e5ca69-e7be-807b-a400-db892da5276b&dpl=dpl_Bsaio4WCaxexwfMbmiLzvhdcoFwz)

Blog image

Two things stand out in these tables. First, we see that the agent variance is wide: GPT 5.2 ran nearly an order of magnitude better than Gemini 3.1 Pro on the same PXDesign-led toolkit, thus the agent monoculture (down below) is not the whole story. Even with the same primary tool, agents differ a lot in how they use it. Second, hit rate does not perfectly track the best K\_D, as BraiNSEY's 40% hit rate paired with 1.91 nM is arguably the strongest portfolio after MRAZS, although crow and EuroBros also hit 40% with much weaker best binders.

Overall, we see a 37% hit-rate and 89% expression. A quick history on community hit rates helps frame what 37% on TREM2 actually means. Our [first EGFR competition](https://proteinbase.com/collections/adaptyv-egfr-competition-round-1) (2024) hit 2.5% pooled, then [Round 2](https://proteinbase.com/collections/adaptyv-egfr-competition-round-2) yielded 13.2%. The [Nipah competition](https://proteinbase.com/collections/nipah-binder-competition-results) (January 2026) hit 9.6% on a harder viral glycoprotein, with the top 10 all in single-digit nM. For broader context, [BindCraft](https://github.com/martinpacesa/BindCraft) reported 25% on CD45 (the closest published TREM2-like Ig-like domain), while another method designed cyclic peptides and yielded. As such, 37% on TREM2 in a one-day hackathon sits at the high end of what current methods report on like-for-like targets, and we sit firmly above the "1-in-10" rule of thumb that defined the post-AlphaFold era. That bar gets pushed up every six months now (an equivalent to Moor’s law for binder hit-rates).

### The tool monoculture

One of the most interesting patterns we noticed throughout this hackathon was the **tool monoculture,** where agents converged on a single tool and the human teams explored a lot more. Participants were encouraged to use the muni platform for their designs, similar to the agents, with most tools (except Escalante Bio’s Mosaic) being available.

Every one of the six LLM agents independently picked [PXDesign](https://www.biorxiv.org/content/10.1101/2025.08.20.671066v1) as their primary design tool, which is to say PXDesign accounted for 53% of all agent submissions and 27 of the 35 agent designs that made the top 100 (out of 38 PXDesign designs in the top 100 in total, with only 11 coming from a single human team using it as part of their stack). Of the top 10 agent binders, 10 of 10 are PXDesign, and agents converged on an overall smaller pool of models despite being given the same toolbox on muni (except Mosaic).

![Blog image](https://www.adaptyvbio.com/api/notion-image?blockId=35f5ca69-e7be-8016-8076-cf060728ad69&dpl=dpl_Bsaio4WCaxexwfMbmiLzvhdcoFwz)

Blog image

PXDesign won the agent vote for many of the same reasons it would win a human one, namely because it is recent, and published with strong claimed hit rates (17–82% depending on target). Whether the agents found it via post-training-cutoff knowledge, by querying muni’s available tools, or via web search ended up being less important, as they all converged on the same recently-marketed tool, and used it well.

The humans, in contrast, spread their bets. The team that won, MRAZS, used [Mosaic](https://github.com/escalante-bio/mosaic), a JAX composite-objective wrapper around Boltz/AF2/Protenix/ProteinMPNN/ESM maintained by [Escalante Bio](https://escalante.bio/). Three of the top four binders here are from MRAZS using Mosaic, and the team that [won the Nipah competition's](https://blog.escalante.bio/winning-the-de-novo-portion-of-the-adaptyv-nipah-binder-competition/) [*in silico*](https://blog.escalante.bio/winning-the-de-novo-portion-of-the-adaptyv-nipah-binder-competition/) [portion](https://blog.escalante.bio/winning-the-de-novo-portion-of-the-adaptyv-nipah-binder-competition/) with a 90% hit rate also used Mosaic.

The convergence shows up in the sequences as well**.** Within-cohort sequence diversity is tighter for agents than humans, with median pairwise identity 28.1% (agent) versus 22.4% (human) and Mann-Whitney p = 0.0002, which means agents make designs that look more like each other. Across the full corpus, 23.3% of all amino acids are alanine, although the five PXDesign-heavy agent teams (Claude Sonnet 4.6, Qwen 3.5 Plus, Grok 4.1 Fast, Gemini 3.1 Pro, GLM 5, and GPT 5.2) run alanine-fraction medians from 0.27 to 0.46, well above the human teams’ medians.

### Per-tool hit rates

It is also worth zooming in on how each tool performed in the wet lab. The table below pools across both cohorts.

**Per-tool hit rates (pooled across humans and agents).**

| Tool | Lab-tested | Binders | Hit rate | Best K\_D |
| --- | --- | --- | --- | --- |
| Mosaic | 6 | 4 | **66.7%** | **1.11 nM** |
| PXDesign | 38 | 20 | 52.6% | 3.64 nM |
| BindCraft | 2 | 1 | 50.0% | 1.91 nM |
| AFHallucination | 8 | 4 | 50.0% | 86.5 nM |
| RFDiffusion | 26 | 6 | 23.1% | 591.8 nM |
| BoltzGen | 5 | 1 | 20.0% | 1.15 µM |
| Foundry (RFdiffusion3) | 9 | 1 | 11.1% | 21.7 nM |
| PPIFLOW | 5 | 0 | 0% | n/a |
| RFPeptides | 1 | 0 | 0% | n/a |

Two things stand out. First, Mosaic tops the table at 66.7% (4 of 6), although all 6 designs came from MRAZS, so we are really measuring one team’s craft with one tool on n = 6. Second, PXDesign at 52.6% (20 of 38) is the only tool that has a high hit rate with a meaningfully large denominator, meaning this results generalizes quite well. Splitting these results by cohort is even more interesting.

**PXDesign hit rate split by cohort.**

| Cohort | Lab-tested | Binders | Hit rate | Best K\_D |
| --- | --- | --- | --- | --- |
| PXDesign · agents | 27 | 12 | 44.4% | **3.64 nM** |
| PXDesign · humans | 11 | 8 | **72.7%** | 12.47 nM |

Humans running PXDesign yield 72.7% binders, although the tightest PXDesign binder came from an agent (GPT 5.2 at 3.64 nM). On the same tool, humans found more binders, but the agent that fully committed to the tool found the rarest one. Tool choice clearly is not the whole story, and how you operate the tool and how much you sample matters once you have picked it. This is exactly the per-agent variance we have been pointing at in the earlier section.

### Where we go from here

Some things we will be following up on:

**The community paper.** Kat and the muni team are leading a writeup that frames this hackathon as the first head-to-head between fully-autonomous agents and humans on a real wet-lab binder design task.

**Adaptyv API × muni agents.** The Adaptyv [public API](https://www.adaptyvbio.com/blog/adaptyv-api) gives you and your agents access to our wet lab (binding measurements, expression, costs, structured results, all programmatically), and we're working with the muni team to integrate it into muni's [autoresearch-CLI](https://www.muni.bio/research/muni-makeover-cli-autoresearch). muni’s autoreseach implement’s Karpathy’s idea for [an autonomous LLM for scientific discovery](https://github.com/karpathy/autoresearch), but in the context of protein design and optimizing tools and in silico scores. We want the agent to run a real DBTL loop with budget controls (design 10, submit, get KDs back, redesign). That is the version of this hackathon where the agent picks the tool *and* learns from the wet-lab result before its next try, which we aim to run in the future. We will be testing a couple of the TREM2 binders from muni's autoresearch-CLI and you can read more about it [here](https://www.muni.bio/research/muni-makeover-cli-autoresearch).

### Acknowledgements + data release

Thanks to everyone who showed up, namely the 16 teams (MRAZS, 1000Tokens, BraiNSEY, EuroBros, crow, StanFold, BART bio, NovoFy, DeNovo, Marcel, plus the 6 agents - Claude Sonnet 4.6, Qwen 3.5 Plus, Grok 4.1 Fast, Gemini 3.1 Pro, GLM 5, and GPT 5.2 ) and the [muni](https://www.muni.bio/) team for running the hackathon (Kat especially).

Designs and binding data are on [Proteinbase](https://proteinbase.com/collections/adaptyv-x-muni-hackathon-ai-agents-vs-humans), open-sourced under ODC-BY. Feel free to browse it and use it in your next binder design campaign.

If you're building agents and want them to design proteins through a real wet lab on the other side of an API call, [reach out](mailto:support@adaptyvbio.com).

— Tudor, for the Adaptyv team