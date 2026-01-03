---
tags:
  - quick
  - x2
Follow up:
---

---
### 🧠 Note

```
# 1. Find a recent completed run
python3 scripts/test_agent.py list-runs --status completed

# 2. Test your changes
python3 scripts/test_agent.py test A13 <run_id> --no-cache --output result.json

# 3. Check the output
cat result.json | jq '.output.adjusted_formulation.constituents[].dose_bands_g_per_day'
```

### Agent names:

#### Phase A: Understand & Gather
- A1 - IndicationIngestor
- A2 - MetabolicProfiler
- A3 - MechanismMapper
- A14 - DosePriorsMiner

#### Phase B: Generate & Score
- A4 - FormulationDesigner
- A10 - VariantGenerator
- A15 - FeasibilityAnalyzer
- A17 - CompetitionSynergyChecker

#### Phase C: Govern & Finalize
- A7 - DosingSafetyPlanner
- A13 - DosePolicyEnforcer
- A16 - SupplementFactsSynthesizer
- A11 - CostingBOMBuilder

#### Launch & Marketing
- A20 - MarketAnalyzer
- A21 - LabelPackagingDesigner
- A22 - PRIRCampaignDesigner
- A23 - GTMRoadmapPlanner

#### Supporting Agents
- A26 - OutcomeAdequacyAgent (OAA)
- A25 - PerceivedBenefitAssessor
- MDAdvisor - MDAdvisor
- SPRDWriter - SPRDWriter
- Mixologist - Mixologist (A24)

#### Reserved/Future Agents (may not be fully configured)
- A5 - ScientificMemoComposer
- A6 - EvidenceLinker
- A8 - StudyDesigner
- A9 - QAConflictsAuditor
- A12 - StudySynopsisFormatter

---

## Viewer App Tabs → Artifacts → Testing Commands

### Phase A Artifacts

1.🔬 Scientific Rationale
	- Artifact: a5_scientific_memo (or a5_memo)
	- Agent: A5 (ScientificMemoComposer)
	- Phase: Phase C (generated after decision packet)
	- Test: python3 scripts/test_agent.py test A5 <run_id>

2.⚙️ Metabolic Profile + Mechanisms
	- Artifacts: a2_profile, a3_mechanisms, evidence_index
	- Agents: A2, A3, A6
	- Phase: Phase A
	- Test: python3 scripts/run_step.py phase-a --run-id-file file

3.💊 Proposed Formulation
	- Artifact: a4_formulation
	- Agent: A4 (FormulationDesigner)
	- Phase: Phase B
	- Test: python3 scripts/run_step.py phase-b --run-id-file file


### Phase C Artifacts

1.🏥 Clinical Translation to Product
	- Artifacts: md_advisor_pre, md_advisor
	- Agent: MD Advisor (runs pre-A4 and post-A4)
	- Phase: Phase A (pre) and Phase B (post)
	- Test: Check artifacts in Phase A/B results

2.💪 Perceived Benefits
	- Artifact: perceived_benefit
	- Agent: A25 (PerceivedBenefitAssessor)
	- Phase: Phase C
	- Test: python3 scripts/test_agent.py test A25 <run_id>

3.📋 Dosing + Facts
	- Artifacts:
	- a7_dosing (Dosing & Safety Planner)
	- time_horizon_phase_plan_detail (detailed phase plan)
	- a16_supplement_facts (or a16_label) (Supplement Facts)
	- Agents: A7, A16
	- Phase: Phase C
	- Test:
		- python3 scripts/test_agent.py test A7 <run_id>
		- python3 scripts/test_agent.py test A16 <run_id>

4.🏭 Manufacturing
	- Artifacts:
	- a11_costing (or a11_bom) (Bill of Materials)
	- mixologist (Flavor variants)
	- Agents: A11, A24 (Mixologist)
	- Phase: Phase C
	- Test:
		- python3 scripts/test_agent.py test A11 <run_id>
		- python3 scripts/test_agent.py test A24 <run_id>


### Launch & Marketing Artifacts

1 📊 Market Analysis
	- Artifacts:
	- a20_market (Market analysis)
	- a20_consensus_strategy (Consensus strategy)
	- a20_market_debate (Market debate)
	- a20_formulation_market_debate (Formulation × Market debate)
	- market_product_comparison (Product vs market comparison)
	- Agent: A20 (MarketAnalyzer)
	- Phase: Launch (optional)
	- Test: python3 scripts/test_agent.py test A20 <run_id>

2.💰 Pricing Strategy
	- Artifact: a20_market (contains pricing section)
	- Agent: A20 (MarketAnalyzer)
	- Phase: Launch (optional)
	- Test: Same as Market Analysis (A20)

3.📣 PR/IR Strategy
	- Artifact: product_launch_plan (contains pr_plan section)
	- Agent: A22 (PRIRCampaignDesigner)
	- Phase: Launch (optional)
	- Test: python3 scripts/test_agent.py test A22 <run_id>

4.🧭 Go-To-Market
	- Artifact: product_launch_plan (contains gtm_plan section)
	- Agent: A23 (GTMRoadmapPlanner)
	- Phase: Launch (optional)
	- Test: python3 scripts/test_agent.py test A23 <run_id>

5.🚀 Product Launch
	- Artifacts:
	- product_launch_plan (A21–A23 combined)
	- marketing_science_review (Marketing review)
	- Agents: A21, A22, A23, A5 (MarketingReviewer)
	- Phase: Launch (optional)
	- Test:
		- python3 scripts/test_agent.py test A21 <run_id>
		- python3 scripts/test_agent.py test A22 <run_id>
		- python3 scripts/test_agent.py test A23 <run_id>

---

## For my testing

Recent run (mTBI, days):
```
85f21c03-03bf-46a1-b05d-080c0d5ea04f
```


to see recommended doses (Phase B):
cat results.json | jq '.artifacts.a4_formulation.constituents[] | {name: .name, proposed_dose: .dose_bands_g_per_day.recommended}'






