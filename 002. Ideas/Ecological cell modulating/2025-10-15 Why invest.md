---
tags:
  - ideas
---


## 🧠 Thought/note

Following up on [[2025-10-15 Novelty of ecological modeling]]:

> [!question]
> but this makes it less white space and less attractive to investors, no? what is my why now for therapeutics based on this idea, and what are my "it turns out..." that support it?

Short answer: this is **more investable now**, not less. You’re not selling another single-pathway drug—you’re selling a **control system for living tissues** (measure → model → steer). The whitespace isn’t in “LV equations”; it’s in (i) new **ecology-native biomarkers** from spatial data, (ii) **dosing-as-drug** engines, and (iii) **interaction-modulating** interventions. Those three have fresh technical and clinical tailwinds.

# Why now

1. **Measurement finally caught up.** High-plex spatial proteomics/transcriptomics and lineage tracing can read out cellular neighborhoods and interaction patterns from routine FFPE—fast enough for trial workflows. Spatial proteomics looks particularly clinic-ready and scalable. [Nature+2Nature+2](https://www.nature.com/articles/s41587-024-02543-2.pdf?utm_source=chatgpt.com)
    
2. **Clinical precedents exist for “ecology-first” control.** Adaptive therapy in metastatic prostate cancer showed improved outcomes and lower costs by **steering competition** between sensitive and resistant clones—proof that managing interactions beats max-kill. [moffitt+1](https://www.moffitt.org/newsroom/news-releases/moffitt-study-shows-adaptive-therapy-improves-outcomes-reduces-care-costs-for-prostate-cancer-patients/?utm_source=chatgpt.com)
    
3. **Closed-loop medicine is mainstream elsewhere.** Artificial-pancreas systems (model-predictive control) won RCTs and FDA support. The dosing algorithm is part of the therapy—exactly the concept you need in oncology/fibrosis. [New England Journal of Medicine+1](https://www.nejm.org/doi/pdf/10.1056/NEJMoa2004736?utm_source=chatgpt.com)
    
4. **Status quo leaves value on the table.** ICIs still help a minority in many solid tumors; antifibrotics rarely reverse disease. That gap is a wedge for ecological biomarkers + dosing engines that personalize _when/how much_ rather than _what_. [BioMed Central+1](https://ehoonline.biomedcentral.com/articles/10.1186/s40164-023-00372-8?utm_source=chatgpt.com)
    
5. **Regulatory wind at your back.** FDA/ASCO are explicitly pushing model-informed dose optimization; that legitimizes “algorithm + label” development paths. [ASCO Journals](https://ascopubs.org/doi/pdfdirect/10.1200/JCO-25-00488?utm_source=chatgpt.com)
    

# Your “it turns out…” (surprising, investor-sticky facts)

- **Competition can be therapeutic.** Letting sensitive clones suppress resistant ones—by _withholding_ drug at the right times—can extend control vs. continuous dosing. That’s not theory; it’s in-human pilot data. [moffitt](https://www.moffitt.org/newsroom/news-releases/moffitt-study-shows-adaptive-therapy-improves-outcomes-reduces-care-costs-for-prostate-cancer-patients/?utm_source=chatgpt.com)
- **Spatial organization predicts outcomes.** “Compartmentalized” immune–tumor architectures in TNBC correlate with survival; spatial phenotypes are prognostic across cancers. Ecology beats bulk abundance. [Cell+1](https://www.cell.com/fulltext/S0092-8674%2818%2931100-0?utm_source=chatgpt.com)
- **Resources are levers, not background.** Many tumors prefer **lactate** as a carbon source (public-good metabolism). Meanwhile **arginine** availability gates T-cell function. Resource terms belong in the model—and the intervention list. [Cell+1](https://www.cell.com/cell/fulltext/S0092-8674%2817%2931068-1?utm_source=chatgpt.com)
- **Mechanics rewires fate.** Matrix stiffness pushes stem cells across lineage boundaries—hard evidence for niche construction as a driver you can drug (ECM-softening, crosslinkase block). [Cell](https://www.cell.com/cell/fulltext/S0092-8674%2806%2900961-5?utm_source=chatgpt.com)
- **Tissues show tipping-point physics you can detect.** Early-warning signals (rising variance, slowing recovery) are measurable from single-cell ensembles and physiology—useful for pre-empting flares or scarring. [PLOS+1](https://journals.plos.org/plosbiology/article/file?id=10.1371%2Fjournal.pbio.2000640&type=printable&utm_source=chatgpt.com)
- **Ecological therapy already has a clinical win.** FMT cures recurrent _C. difficile_ at ~90% in RCTs; FDA carved a regulatory path. Ecosystem engineering can be medicine. [New England Journal of Medicine+1](https://www.nejm.org/doi/pdf/10.1056/NEJMoa1205037?utm_source=chatgpt.com)
- **gLV isn’t hand-wavy—at scale it forecasts real biotic systems.** Microbiome platforms (e.g., MDSINE) learned interaction networks and made predictions; the community is now porting GLV to heterogeneous tumors. [BioMed Central+1](https://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-0980-6?utm_source=chatgpt.com)
- **Dosing is a drug.** RL/MPC can beat fixed schedules in calibrated tumor models—software defines the therapeutic effect. [AACR Journals](https://aacrjournals.org/cancerres/article/84/11/1929/745515/Mathematical-Model-Driven-Deep-Learning-Enables?utm_source=chatgpt.com)

# Therapeutic wedge (credible in 18–36 months)

1. **Ecology biomarkers for trial stratification.** From a single pretreatment slide, output: diversity indices, neighborhood motifs, and predator–prey balance scores that predict response or rebound. Start in TNBC, CRC, and prostate; sell as a **CLIA test + software readout** to pharma trials. [Cell+1](https://www.cell.com/fulltext/S0092-8674%2818%2931100-0?utm_source=chatgpt.com)
2. **Adaptive dosing co-therapy for an approved drug.** Replicate and extend the prostate adaptive-therapy play with a prospective, model-guided schedule (abiraterone or an ICI) + minimal marker panel for feedback. Primary endpoint: time-to-progression vs. SoC dosing. [moffitt](https://www.moffitt.org/newsroom/news-releases/moffitt-study-shows-adaptive-therapy-improves-outcomes-reduces-care-costs-for-prostate-cancer-patients/?utm_source=chatgpt.com)
3. **Regeneration over scar** in skin or lung: macrophage- and fibroblast-focused interaction modulators (resource + mechanics levers) with early-warning monitoring to time pulses before crossing the fibrosis threshold. [Nature+1](https://www.nature.com/articles/s41580-024-00715-1.pdf?utm_source=chatgpt.com)

# Moat

- **Data flywheel:** longitudinal _ecology-labeled_ tissue (spatial + outcomes) few others collect.
- **Controllers:** validated dosing policies (DRL/MPC) tied to mechanistic gLV/consumer-resource models—hard to copy without the same measurement loop. [AACR Journals](https://aacrjournals.org/cancerres/article/84/11/1929/745515/Mathematical-Model-Driven-Deep-Learning-Enables?utm_source=chatgpt.com)
- **Regulatory positioning:** align with dose-optimization guidance; path to combination labels where the **algorithm** is part of the therapeutic.

# Investor-grade story

You’re not competing with target X companies. You’re building the **first platform that measures and controls interaction structure**—a new axis of efficacy orthogonal to “better binders.” The de-risking assets above (biomarker → dosing engine → interaction drug) give a stepwise value ladder with real shots on goal.