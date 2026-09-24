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

  

- Postdoc at NIH

  

  

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

  

- From sequence -> seq sim metrics
- Find homology seq to that sequence with homology modeling
- If no homologous, AF2/Rosetta
- MD simulation after 
- Mutagenesis experiments

  

  

**Q2.** Where do you encode developability (solubility, stability, aggregation, immunogenicity) in the loop?  
**Strong:** 

- property constraints during generation (charge, hydropathy, patchiness), 

- post-hoc predictors (AggScore, NetMHC screens), 

- pI windows, cysteine/disulfide policy, expression system awareness. 

**Red flag:** “we check that later in the lab.”

  

- Use AggScore

  

  

**Q3.** Interface energetics—tell me a case where predicted metrics agreed _or_ lied vs BLI Kd.  
**Strong:** 

- Rosetta ddG/I_sc, packing density, contact order, H-bond networks, Δburied SASA; 

- calibration thinking, error modes (AF2 hallucinated helices, backbone strain). 

**Red flag:** equating high pLDDT with affinity.

  

- Designed several soluble proteins for CAR-T
- Predicted methods don’t always match
- Does his own differential analyses to see what went wrong
- Revisits workflow to see what went wrong

  

  

**6:00–11:00 | SOTA tools & data integration (5 min)**  
**Q4.** RFdiffusion vs hallucination vs scaffold-based—when do you choose which, and what knobs matter?  
**Strong:** 

- conditioning, fixed/partial backbone, symmetry, loss/temperature/step count trade-offs, epitope targeting, linker design.

  

- ProteinMPNN -> from coordinates get sequence
- From sequence you go into AF3, constrains based on sequence and structure

  

  

**Q5.** Show me one iteration where HDX-MS/BLI/CD/Cryo-EM changed the design.  
**Strong:** 

- HDX to map epitope/allostery → redesign interface; 

- BLI kinetics shaping on-/off-rates; 

- CD verifying fold; 

- Cryo-EM density guiding loop re-modeling. 

**Red flag:** can’t tie assay readouts to a concrete design edit.

  

- did not answer question -> I don’t know where he’s going
- Very vague answer on getting experimental data to go back to computational work

  

  

**Q6.** MD: signal or noise? What protocols do you trust and why?  
**Strong:** 

- timescale realism, side-chain/loop relaxation, water placement, enhanced sampling (REMD/metadynamics) sparingly; 

- MD as _sanity/edge-case_ tool, not oracle. 

**Red flag:** “We MD everything for stability.”

  

- Uses for different geometries and conformations to guide design

  

  

**11:00–16:00 | Non-canonical & constraints (5 min)**  
**Q7.** Talk me through a non-canonical residue or stapling design you shipped.  
**Strong:** 

- residue libraries/params, scoring adaptation (Rosetta params, tokenization for ncAAs), synthetic feasibility, click/staple geometry constraints, assay plan.

  

**Q8.** Miniproteins <100 aa—what routinely breaks in expression/QC and how do you debug?  
**Strong:** 

- periplasm vs cytoplasm vs cell-free; 

- disulfide management; 

- purification pain points; 

- LC-MS, DSF/Tm, protease susceptibility; 

- redesign tactics (hydrophobe pruning, charge redistribution).

  

- did not hear my specifications of a mini binder

  

  

**Q10.** Failure post-mortem—what flopped and what changed in the next round?  
**Strong:** 

- hypothesis → falsification → changed constraint/score/assay; humility + ownership; measurable delta next cycle.

  

- which residues did not work well?
- Find binding pattern of things that did not work, goes back to workflow

  

  

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