---
Date: 2025-08-18
tags:
  - abiologics
  - interviews
Role: Protein designer
---

  

**0:00–1:00 | Warm start (1 min)**  
**Q0.** Give me your two-sentence story and your last design win—what metric moved and by how much?  
**Listen for:** crisp impact (e.g., Kd → nM, Tm +°C, expression ↑x-fold), their role, iteration count. 

**Red flag:** vague “we improved things.”

  

- phd comp chem 
- Micropepi technologies incorporated (based in France) 
- Over 1M peptides for protein targets

  

  

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

  

- depends on methods and tools
- PepMLM (Duke U) -> based only on target sequence
- Get prediction from AF/ESM/Rosetta
- Homology modeling
- RFdiffusion/ProteinMPNN (newer tools coming out)
- Bindcraft

  

  

  

**Q2.** Where do you encode developability (solubility, stability, aggregation, immunogenicity) in the loop?  
**Strong:** 

- property constraints during generation (charge, hydropathy, patchiness), 

- post-hoc predictors (AggScore, NetMHC screens), 

- pI windows, cysteine/disulfide policy, expression system awareness. 

**Red flag:** “we check that later in the lab.”

  

- bias the patterns of ProteinMPNN inverse folding
- avoid a lot of disulfide bonds
- Filter designs based on some metrics that conform to design rules

  

  

**Q3.** Interface energetics—tell me a case where predicted metrics agreed _or_ lied vs BLI Kd.  
**Strong:** 

- Rosetta ddG/I_sc, packing density, contact order, H-bond networks, Δburied SASA; 

- calibration thinking, error modes (AF2 hallucinated helices, backbone strain). 

**Red flag:** equating high pLDDT with affinity.

  

- select top candidates for experiment (ddG, pLDDT)

  

  

**6:00–11:00 | SOTA tools & data integration (5 min)**  
**Q4.** RFdiffusion vs hallucination vs scaffold-based—when do you choose which, and what knobs matter?  
**Strong:** 

- conditioning, fixed/partial backbone, symmetry, loss/temperature/step count trade-offs, epitope targeting, linker design.

  

- scaffold methods: only redesign interface

- do partial diffusion on specific areas
- Do partial diffusion, denoise it, and do de novo design

  

  

  

**Q5.** Show me one iteration where HDX-MS/BLI/CD/Cryo-EM changed the design.  
**Strong:** 

- HDX to map epitope/allostery → redesign interface; 

- BLI kinetics shaping on-/off-rates; 

- CD verifying fold; 

- Cryo-EM density guiding loop re-modeling. 

**Red flag:** can’t tie assay readouts to a concrete design edit.

  

- look at the interactions in the model
- What is interacting with the target? -> keep parts of the design constant, redesign other areas

  

  

**Q6.** MD: signal or noise? What protocols do you trust and why?  
**Strong:** 

- timescale realism, side-chain/loop relaxation, water placement, enhanced sampling (REMD/metadynamics) sparingly; 

- MD as _sanity/edge-case_ tool, not oracle. 

**Red flag:** “We MD everything for stability.”

  

- MD can be useful, but depends on how you went to spend time on comp side before experiments
- Costly, take time
- No trust in MMGBSA -> not a good estimate
- Likes free energy perturbations
- Enhanced sampling methods can be better
- These are good methods for comparison between structures
- In the world of ML, there are a lot of ideas to not use MD or rely on it extensively

  

  

  

**Q8.** Miniproteins <100 aa—what routinely breaks in expression/QC and how do you debug?  
**Strong:** 

- periplasm vs cytoplasm vs cell-free; 

- disulfide management; 

- purification pain points; 

- LC-MS, DSF/Tm, protease susceptibility; 

- redesign tactics (hydrophobe pruning, charge redistribution).

  

- not a true experimentalist 

  

  

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

  

- bunch of sequences to order or synthesize 
- Depends on how much detail they want
- Structure of binders, what areas do we think are binding, what patterns of binding, what areas of interface make
- Includes positive controls at Micropep, would consider negative designs

  

  

  

**Q12.** AF2 says high confidence; BLI says junk. Next move?  
**Strong:** 

- trust hierarchy (empirical first), check expression/folding, redesign interface hotspots, alter assay format, pursue alternative epitope; 

- clear kill bar. 

**Red flag:** “rerun AF2.”

  

- if it’s only design, start over
- Compares differences between models if he has a few
- Would look at other metrics

  

  

**25:00–30:00 | Candidate Q&A (5 min)**  
**What** **_you_** **want to hear in their questions:** data scale & access, pipeline/tooling maturity (versioning, registries), assay throughput, autonomy/decision speed, cross-functional cadence, typical iteration count, definition of “ship,” IP stance. Lack of curiosity here is a smell.

  

  

  

  

**Quick scorecard (6 axes, 1–5)**

1. **Design depth (de novo/miniproteins/binders):** 1=theory only; 5=multiple shipped designs with numbers.

2. 4

3. **Tool fluency (RFdiffusion/ProteinMPNN/AF2/Rosetta, etc.):** 1=name-drops; 5=operational mastery + parameters.

4. 5

5. **Biophysics integration (BLI/CD/HDX-MS/Cryo-EM):** 1=knows acronyms; 5=uses data to steer iterations.

6. 2

7. **Developability mindset:** 1=afterthought; 5=constraints baked into generation & selection.

8. 4

9. **Execution & platform thinking:** 1=artisan; 5=DOE, LIMS, feedback-learning loops, clear kill criteria.

10. **Communication & collaboration:** 1=vague; 5=concise artifacts, clean handoffs, conflict resolution.

11. 3

  

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