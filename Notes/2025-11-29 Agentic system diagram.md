---
tags:
  - quick
  - x2
  - ideas
  - explorations
  - compbio
  - ai
Follow up:
---

It's in mermaid. I may need to do it in Lucid or PPT.

---
### 🧠 Note


flowchart LR
  subgraph Phase_A["Phase A – Understand & Gather"]
    A1["A1 ExecContext"] --> A2["A2 Metabolic Profile"]
    A2 --> A3["A3 Mechanism Mapper"]
    A3 --> A14["A14 Priors Miner"]
    A14 --> Evidence["EvidenceIndex"]
  end

  subgraph Phase_B["Phase B – Generate & Score"]
    Evidence --> A4["A4 Formulation Design"]
    A4 --> Val["B.1b Dose-Prior Validation"]
    Val --> A17["A17 Competition/Synergy"]
    A17 --> Critic1["A4 Critic (Expert 1)"]
    Critic1 <-->|"peer debate"| Critic2["Expert 2"]
    Critic2 --> ConsensusCritic["Consensus Critique"]
    ConsensusCritic --> Refinement["A4 Refinement"]
    Refinement --> A10["A10 Variant Generator"]
    A10 --> Cand["CandidateSet"]
    Cand --> Score["Scoring + Feasibility Seeds"]
    Score --> Gate1["Gate #1 Shortlist"]
  end

  Gate1 --> Phase_C

  subgraph Phase_C["Phase C – Govern & Finalize"]
    Gate1 --> A13["A13 Dose Policy"]
    Gate1 --> A15["A15 Feasibility"]
    A13 --> SafetyBundle["Safety Bundle"]
    A15 --> SafetyBundle
    SafetyBundle --> A7["A7 Dosing"]
    SafetyBundle --> A16["A16 Supplement Facts"]
    SafetyBundle --> A11["A11 BOM"]
    A7 & A16 & A11 --> Gate2["Gate #2 Safety/Claims"]
    Gate2 --> Decision["DecisionPacket"]
  end

  SafetyBundle --> A9["Gate #3 A9 Red-Team\n(contrarian)"]
  A9 -->|penalties| Score

  subgraph Market_Launch["Market Debates & Launch Surface"]
    Decision --> A20["A20 Market Analysis"]
    A20 --> DebateMS["Strategist 1 ↔ 2 Debate"]
    DebateMS --> Consensus["Consensus Strategy"]
    Consensus --> DebateFM["Formulator ↔ Market Strategist"]
    DebateFM --> JointPlan["Joint GTM Plan"]
    Consensus --> A21["A21 Branding"]
    Consensus --> A22["A22 PR / IR"]
    Consensus --> A23["A23 GTM Roadmap"]
    JointPlan --> A21
    JointPlan --> A22
    JointPlan --> A23
  end