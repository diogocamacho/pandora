---
Date: 2025-08-20
tags:
  - abiologics
  - interviews
Role: Protein designer
---





**0:00–1:00 | Warm start (1 min)**  
**Q0.** Give me your two-sentence story and your last design win—what metric moved and by how much?  
**Listen for:** crisp impact (e.g., Kd → nM, Tm +°C, expression ↑x-fold), their role, iteration count. 

**Red flag:** vague “we improved things.”

  

- interest in design from postdoc

- Selection in microbes
- “Needles in haystack”
- Design came from observations of postdoc work in relation to what AF was showing

- VLP project @ Moderna

- From no signal at all to significant signal

  

  

**1:00–6:00 | Core design instincts (5 min)**  
**Q1.** New target, no solved structure yet. How do you design a mini-binder end-to-end?  
**Strong signals:** 

- target/epitope framing; 
- AF2/ESMFold for initial models; 
- RFdiffusion or scaffold/hallucination strategy; 
- ProteinMPNN for sequence; 
- Rosetta/Boltz filters (ddG, I_sc, buried SASA, unsatisfied polar); 
- negative design/off-targets; diversity vs exploitation; 
- kill criteria. 

**Red flag:** tool name-dropping without sequencing rationale.

- we need a structure -> AF3/rosetta-fold/boltz
- Learn everything we can
- Move into mini-binder design (rfdiffusion, bindcraft)
- Very folds with AF/ESM
- benchmarking
- Move into energetic, physical models, binding predictions (MOE, Rosetta, Boltz2)

  

  

  

**Q2.** Where do you encode developability (solubility, stability, aggregation, immunogenicity) in the loop?  
**Strong:** 

- property constraints during generation (charge, hydropathy, patchiness), 
- post-hoc predictors (AggScore, NetMHC screens), 
- pI windows, cysteine/disulfide policy, expression system awareness. 

**Red flag:** “we check that later in the lab.”

- Bindcraft for solubility (it’s built in)
- Filtering after designs (use data to train smaller models)
- MHC binder filter

  
**Q3.** Interface energetics—tell me a case where predicted metrics agreed _or_ lied vs BLI Kd.  
**Strong:** 

- Rosetta ddG/I_sc, packing density, contact order, H-bond networks, Δburied SASA; 
- calibration thinking, error modes (AF2 hallucinated helices, backbone strain). 

**Red flag:** equating high pLDDT with affinity.

  

[NOTE: added MD simulations question here] 

- fine tuning, model refinement
- Diversity sampling



**6:00–11:00 | SOTA tools & data integration (5 min)**  
**Q4.** RFdiffusion vs hallucination vs scaffold-based—when do you choose which, and what knobs matter?  
**Strong:** 

- conditioning, fixed/partial backbone, symmetry, loss/temperature/step count trade-offs, epitope targeting, linker design.
- homology structure -> scaffold models. We know a lot on the protein, we have a lot of data
- RFdiffusion -> getting new backbones

  
  

**Q8.** Miniproteins <100 aa—what routinely breaks in expression/QC and how do you debug?  
**Strong:** 

- periplasm vs cytoplasm vs cell-free; 
- disulfide management; 
- purification pain points; 
- LC-MS, DSF/Tm, protease susceptibility; 
- redesign tactics (hydrophobe pruning, charge redistribution).

  

- not as true experimentalist 

  

  

**16:00–21:00 | Execution & throughput (5 min)**  
**Q9.** Design-to-data velocity: cycle time, batch size, and diversity strategy?  
**Strong:** 

- DOE, barcoded libraries, plate throughput, LIMS/registry, adaptive sampling (learn-to-rank or Bayesian) from assay feedback; explicit cycle times. 

**Red flag:** no numbers.

  

  

**Q10.** Failure post-mortem—what flopped and what changed in the next round?  
**Strong:** 

- hypothesis → falsification → changed constraint/score/assay; humility + ownership; measurable delta next cycle.

  

**21:00–25:00 | Teaming & comms (4 min)**  
**Q11.** Day-1 handoff: exactly what do you give wet-lab?  
**Strong:** ranked sequences with metadata (structures, scores, risk tiers), assay plan, success criteria, controls, negative designs. 

**Red flag:** “a FASTA.”

  

- sequences
- Relative target 
- No cluttering of the data

  

  

  

**25:00–30:00 | Candidate Q&A (5 min)**  
**What** **_you_** **want to hear in their questions:** data scale & access, pipeline/tooling maturity (versioning, registries), assay throughput, autonomy/decision speed, cross-functional cadence, typical iteration count, definition of “ship,” IP stance. Lack of curiosity here is a smell.

  

  

  

  

**Quick scorecard (6 axes, 1–5)**

1. **Design depth (de novo/miniproteins/binders):** 1=theory only; 5=multiple shipped designs with numbers.
2. **Tool fluency (RFdiffusion/ProteinMPNN/AF2/Rosetta, etc.):** 1=name-drops; 5=operational mastery + parameters.
3. **Biophysics integration (BLI/CD/HDX-MS/Cryo-EM):** 1=knows acronyms; 5=uses data to steer iterations.
4. **Developability mindset:** 1=afterthought; 5=constraints baked into generation & selection.
5. **Execution & platform thinking:** 1=artisan; 5=DOE, LIMS, feedback-learning loops, clear kill criteria.
6. **Communication & collaboration:** 1=vague; 5=concise artifacts, clean handoffs, conflict resolution.

  

**Scoring guide:**

- **5:** Could lead a campaign here tomorrow.
- **4:** Strong IC; minor mentorship needed on one axis.
- **3:** Trains up within 3–6 months with guidance.
- **2:** Tool tourist; risky for fast-cycle env.
- **1:** No evidence of shipped design loops.

  

**Anti-signals to watch for**

- Conflates structure prediction with design; treats pLDDT as affinity.
- Over-reliance on MD as validator.
- No quantitative outcomes; no iteration counts.
- Cannot explain negative design/off-target strategy.
- Hand-waves developability.
- “We” did everything—no personal decisions.
- No evidence of platform habits (registries, versioning, DOE).