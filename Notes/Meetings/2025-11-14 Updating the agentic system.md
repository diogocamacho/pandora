---
tags:
  - x2
  - ideas
  - explorations
  - ai
Follow up:
---

---
### 🧠 Note

We had a conversation on Slack on some conditions that could be added to the agentic system to expand the product offerings. Below are the instructions I added to Cursor. 



# CursorAI Implementation Instructions for Generalized Non-Rx Formulation System

## Goal

Extend the agentic system to propose **non-therapeutic formulations** across multiple dosage forms — beverages (20oz), gummies, capsules, and powder packets — with realistic manufacturability, taste modeling, and DSLD/DSID-compliant ingredient priors. The system must output a per-dose **Supplement Facts** panel instead of a memo.

---

## Core Additions

### 1. Dosage Form Generalization

Add a **Dosage Form Selector** agent to propose form factor based on product goals, ingredient feasibility, and sensory constraints.

Forms to support:

- **Beverage (20oz)** — 591 mL, flavored, with liquid-soluble actives.
    
- **Gummy** — 2–5g solids per unit, flavor masking required.
    
- **Capsule** — 0, 00, 1 capsule sizes; limited fill volume.
    
- **Powder Packet** — 10–20g, instantized for mixing.
    

---

### 2. New Agent Contracts

#### **A13_DosePolicy.md**

Defines sub-therapeutic, non-Rx dose limits per ingredient.

- Input: `candidate_formulation`, `policy` (non-Rx, sub-therapeutic)
    
- Output: adjusted formulation, list of violations, status
    

#### **A14_PriorsMiner.md**

Ingests DSLD/DSID data to set dose priors per ingredient × form.

- Input: `category`, `dosage_forms`, `ingredients_of_interest`
    
- Output: percentile priors (p5, p50, p95), product examples
    

#### **A15_FormFeasibility.md**

Evaluates palatability, form-factor limits, and basic COGS.

- Models bitterness, acidity, and sweetness load.
    
- Checks fill density, solids %, and manufacturable range per form.
    
- Outputs taste adjustments (sweeteners/flavorants), cost, and pass/fail status.
    

#### **A16_SupplementFactsSynthesizer.md**

Renders a regulatory-style Supplement Facts label per-dose.

- Input: final formulation, dosage form, serving description, claims
    
- Output: Markdown + SVG panel with ingredient list, amounts, and warnings
    

---

### 3. Data & Configs

#### `/config/dose_policies/non_rx_subtherapeutic.json`

Stores ingredient-specific maximums per dose.

```json
{
  "default_max_per_dose_mg": 9999,
  "ingredient_overrides": {
    "caffeine": { "max_per_dose_mg": 200 },
    "nicotinamide riboside": { "max_per_dose_mg": 300 }
  }
}
```

#### `/data/ingredients_vocab.csv`

Maps ingredient aliases for normalization.

#### `/data/taste_coeffs.csv`

Defines taste coefficients per ingredient: bitterness, sourness, sweetness offsets.

#### `/data/suppliers/catalog_example.csv`

Ingredient availability, cost, and lead time.

---

### 4. Orchestration Changes

1. Add `select_dosage_form()` to auto-choose between beverage, gummy, capsule, or powder based on feasibility and ingredient solubility.
    
2. Call flow:
    
    - `A14` → generate priors
        
    - `A5` → propose formulation (bounded by priors)
        
    - `A13` → enforce non-Rx dose policy
        
    - `A15` → check taste, form-factor, and cost
        
    - `A16` → generate Supplement Facts label
        
3. If `A15` fails → re-run A5 with taste/cost penalties.
    

---

### 5. Streamlit UI Updates

- **Inputs:**
    
    - Dosage form (auto/manual)
        
    - Non-Rx policy (toggle)
        
    - Target COGS slider
        
    - Servings per container
        
- **Outputs:**
    
    - Tab 1: **Supplement Facts** (Markdown + SVG)
        
    - Tab 2: **Feasibility** (taste + cost breakdown)
        
    - Tab 3: **Priors** (dose distributions by form)
        

---

### 6. Validation Enhancements

Add new schemas for A13–A16. Validate that:

- A13 never allows dose > policy cap.
    
- A15 includes taste + cost data.
    
- A16 outputs compliant Supplement Facts fields.
    

---

### 7. Tests

- `test_a13.py`: Dose clamping and policy edge cases
    
- `test_a14.py`: DSLD/DSID percentile accuracy
    
- `test_a15.py`: Taste + cost feasibility boundaries
    
- `test_a16.py`: Label completeness and field checks
    

---

### 8. Default Preset Example (`presets/general_non_rx.json`)

```json
{
  "dosage_forms": ["beverage_20oz", "gummy", "capsule", "powder_packet"],
  "policy": {"non_rx": true, "dose_policy": "sub_therapeutic"},
  "targets": {"max_cogs_per_dose_usd": 1.0},
  "servings_per_container": 1
}
```

---

## Acceptance Criteria

- System generates valid non-Rx formulations across dosage forms.
    
- All outputs include a Supplement Facts panel per dose.
    
- Taste and manufacturability are automatically assessed.
    
- DSLD/DSID priors bound ingredient quantities.
    
- All new validation tests pass.
    

---

## Notes

- DSLD/DSID reflect market-declared amounts, not bioavailability.
    
- Taste heuristics are approximations; keep flags soft.
    
- Supplier data should include buffers and update periodically.
    

This structure ensures the AI generates realistic, compliant, and manufacturable non-Rx formulations that generalize beyond any specific ingredient or indication.