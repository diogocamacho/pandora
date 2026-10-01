---
type: reference
tags: [crew, config]
updated: 2026-10-01
---

# Crew config

Single source of truth for the values the crew skills use (targets, positions, schedules, people, watchlists). Skills hold rules; this file holds data. Each skill reads its own `## <skill>` section. Edit values here, not in the skills.

Lines marked `<!-- CHECK: … -->` are conflicts carried over from the old skills — resolve them and delete the marker.

## max

### Identity & context
- name: Diogo Camacho
- role: Senior Principal, Computational Sciences at Flagship Pioneering (FSP)
- industry: Biotech / Drug Discovery
- career_target: VP-equivalent → C-level role at a drug discovery company
- age: 50
- location: Sudbury, MA
- strategic_priorities: Agentic Nutrition (X2) is a high-priority strategic exploration (C-level positioning, not reactive execution)
- goals (high level): career → C-level; systems → less reactive, more intentional; health and finance targets live in `## candy` and `## kevin`

### Daily logistics
- wake: 5:30–6:00am
- morning: Filipe bus 7:15, Pedro bus 7:45; on Allison's WFH days she handles drop-off (WFH schedule varies week to week — ask if relevant)
- afternoon buses: Filipe 2:30pm, Pedro 3:30pm
- evening: workout after work — standing commitment
- weekends: family time; reducing work bleed-in

### People
- Allison — wife; nurse practitioner
- Filipe — son
- Pedro — son
- Direct reports (Abiologics): Jeremy Amon, Beth Kartchner, Andrew Croneberger, Nitya Talasila
- Dan — direct report (listed in old email VIP list)
- Mike Hamill — Origination Partner at Flagship / Chief Innovation Officer at Abiologics (manager / career coach) <!-- CHECK: verify still current manager -->
- Raffi Rafeyan — Senior Principal at Flagship / President at FL110 (peer / career coach)
- Laura Maiorino — Senior Associate at Flagship
- Agentic Nutrition collaborators: Mike Hamill, Raffi Rafeyan, Laura Maiorino
- name_collisions: John (John Bradley, John Quackenbush, …) — ask which

### person_slugs (Todoist `@slug` + 1:1 tag)
| Person | slug |
|---|---|
| Andrew Croneberger | acroneberger |
| Beth Kartchner | bkartchner |
| Jeremy Amon | jamon |
| Nitya Talasila | ntalasila |
| Declan Evans | devans |
| Jiangchuan Ye | jye |
| Chiara Magnone | cmagnone <!-- CHECK: conflicting names "Chiara Magnone" vs "Carl Magnone" (old skill second table + Templates/1v1-meeting-button.md) --> |
| Mike Hamill | mhamill |
| Raffi Rafeyan | rafeyan <!-- CHECK: derivation rule would give rrafeyan --> |

### Comms
- work_inbox: dcamacho@flagshippioneering.com (Outlook, Microsoft 365)
- personal_inbox: diogo.camacho.2008@gmail.com (Gmail — not connected in Cowork)
- slack_user_id: U07PXEPBXJP
- vip_senders: Jeremy, Beth, Andrew, Nitya, Dan (direct reports); Mike Hamill; Raffi Rafeyan; Laura Maiorino; external stakeholders
- personal mail filter: surface only time-sensitive (deliveries, appointments, bills, school/family), real people (not no-reply), Agentic Nutrition / FL110 / FL111 side work

### Calendar
- calendar_skip: commute, workout-related blocks (not the workout itself), family time, bus drop-off, lunch (unless it is the meeting), deep-work holds, standing standups ≤15 min

### Schedule & delivery
- brief_schedule: 06:27 daily — Cowork scheduled task (not a LaunchAgent)
- send_brief.script: /Users/dcamacho/.claude/scripts/send_brief.sh <!-- CHECK: still used by the 06:27 scheduled task? -->
- send_brief.html_path: /tmp/daily_brief.html
- send_brief.recipient: dcamacho@flagshippioneering.com

### Notion
- science_workspace (read-only, science context): https://www.notion.so/1ae043d22fe3809f9e45ca74fed5dc88
- personal Notion (TasksDB, NotesDB, Daily Log, Portfolio Price Log, Dashboard DMC, Nighttime Reflections collection://1a6ab3c7-43d4-442e-af6b-d60b529c0926): not reachable — retired as a target


## sarah

### Daily constraints
- morning_window: 5:30–7:45am
- school_buses: Filipe 7:15, Pedro 7:45
- evening_workout: non-negotiable — protect the block always
- allison_wfh: affects morning logistics — ask when relevant (no fixed days recorded)
- work_pattern: mostly in-office, meeting-heavy, limited naturally occurring deep work
- calendar_account: Outlook, dcamacho@flagshippioneering.com
- tasks_source: Obsidian Tasks in vault (primary); Todoist only if connected <!-- CHECK: old skill said Todoist is source of truth; new architecture sets vault primary -->

### Review
- weekly_review_day: Sunday, mid-morning after the family morning settles
- review_time_cap: 45–60 min hard cap (time warning at the 40-min mark)
- monthly_review: last Sunday of the month, 30-min add-on
- monthly_goals: <!-- not recorded in old skill — set at next monthly review -->

### Deep work
- deep_work_min_block: 90 min, at least one per day
- strategic_hours_min: 2–3 hours per week, protected on calendar

### Operating diagnosis
- Diogo captures inconsistently and reviews rarely. Make both easier and more habitual — not more complex. When in doubt, do less but do it consistently.

### Career target
- C-level move (career positioning check every weekly review)

### Protected areas (checked weekly)
1. Career positioning & visibility — writing, external presence, being seen by the right people for a C-level move. Target: ≥ 1 visible action per week.
2. Strategic thinking time — where the company is going and where Diogo fits. Target: strategic_hours_min.
3. Managing up and sideways — proactive, initiated relationship management with Mike Hamill, Raffi Rafeyan, and other key stakeholders.
4. Agentic Nutrition (X2) — needs its own time, not spare minutes. Flag if invisible for > 1 week.


## kevin

### Financial state
- last_updated: 2026-09-27
- household_income: $504k ($339k Diogo + $165k Allison)
- brokerage_total: ~$21,681 <!-- CHECK: stale; derive from latest portfolio-snapshot instead -->
- waymark_wealth_taxable_managed: $1,002,015
- diogo_401k: $53,277 (maxing contributions, ~2 yrs at current employer)
- allison_401k: TBD (~$53k est.; maxing contributions) <!-- CHECK: unconfirmed -->
- net_worth_estimate: ~$1,075k (excl. Allison 401k and PIUs)
- piu_note: Flagship equity — illiquid, career-linked, never in near-term math
- 401k_manager: financial advisor
- tax_bracket: 20% + 3.8% NIIT (dividends/LTCG in taxable)

### Debt tracker
| Debt | Balance | Rate | Expiry / Payoff | Priority |
|---|---|---|---|---|
| JetBlue CC | $9,800.78 | Standard APR (TBD) | N/A | 1 (largest balance) |
| Fidelity CC | $5,341.52 | Standard APR (TBD) | N/A | 2 |
- total_debt: $15,142
- zero_pct_promo_debt: none
- paydown_method: <!-- CHECK: old skill says "snowball or avalanche"; table orders by largest balance -->

### Emergency fund
- target: $30,000 (3 months expenses)
- components: SPAXX (brokerage) + lifestyle account
- lifestyle_account: $2,580
- current: $12,081 (SPAXX $9,501 + lifestyle $2,580) as of 2026-09-27 <!-- CHECK: stale; derive SPAXX from latest snapshot -->

### Excluded / earmarked accounts
- patriots_season_tickets_account: $695 (separate Fidelity account; ~$5k due February — not liquidity)

### Dated obligations (flag ≤90 days)
- Patriots season tickets: ~$5k, due February <!-- CHECK: exact date -->

### Priority stack (Diogo's stated order)
1. Credit-card debt first, so balances don't balloon (decided 2026-10-01). A 0% promo balance within 90 days of expiry jumps to the top.
2. Emergency fund to target
3. Any remaining debt
4. Annual bonus allocation — debt → liquidity → lifestyle (intentional) → investible remainder
5. Grow investment portfolio (aggressive) once 1–3 are satisfied
- current_phase: 1 (credit-card paydown — no new investment dollars)

### Positions (self-directed brokerage)
- positions: QQQ, SMH, VXUS, XBI + SPAXX (cash = EF component)
- retired: SPY (sold, consolidated into QQQ); SCHD (sold 2026-09-28); IWO (never bought)

| Ticker | Target range (% of investible, ex-SPAXX) | Rationale |
|---|---|---|
| QQQ | 35–45% | Core large-cap growth anchor |
| SMH | 10–15% (cap 15%) | AI/chip sector bet; don't crowd QQQ |
| VXUS | 10–15% | Geographic hedge — meaningful weight or don't bother |
| XBI | 10–15% (may run above on domain conviction) | Professional edge — conviction, not momentum |
- qqq_smh_concentration_flag: >50% of investible <!-- CHECK: ranges allow QQQ+SMH up to 60%, so the flag can fire inside targets -->
- rebalance_band: ±5 pts outside range
- defensive_sleeve_consider_above: >$200k investible

### Snapshots
- snapshot_folder: Notes/Life/ <!-- CHECK: existing snapshots are in Notes/Meetings/ -->
- finance_dashboard: Dashboards/Areas/💰 Finance/💰 Finance.md

### YNAB
- mode: rebuild
- reestablished_threshold: 10 consecutive days logged
- tracking: `ynab_logged: true|false` in daily note frontmatter


## candy

### stats
- current_weight_lbs: 199.1 (last updated 2026-09-27)
- target_weight_lbs: 170 <!-- CHECK: conflicting values 170 (Current Stats, workout template) vs 170-175 range (Recomposition Roadmap) in old skill -->
- goal_type: body recomposition (lower weight + visibly more muscular build), not pure weight loss
- bmr_cal: 2002 (measured)
- tdee_estimate_cal: 2400-2600
- age: 50; birthday: 11/19
- restat_after_lbs: 5 (recompute protein/calorie targets once weight moves ~5+ lbs from baseline)

### whoop_baseline (6-month averages as of 2026-09-09; self-reported, Whoop not connected)
- hrv_ms: 22
- hrv_normal_swing: 19-25 ms (estimated nightly swing)
- rhr_bpm: 62
- resp_rate_rpm: 15.0
- sleep_performance_pct: 90
- sleep_consistency_pct: 82
- whoop_age: 46.5 (chronological 50); pace_of_aging: 0.6x
- steps_per_day: 6842; steps_guideline: 8000-10000
- zone1_3_daily: 2:12 (h:mm)
- zone4_5_daily: 6 min
- avg_hr_bpm: 68

### hrv (applied to the 7-day rolling mean)
- full_at_or_above: 22 ms
- modify_band: 19-21 ms
- rest_below: 19 ms <!-- CHECK: conflicting values absolute bands 22/19-21/<19 ms (decision tree) vs percentage bands at baseline / 10-20% below / >20% below (Whoop appendix) in old skill -->
- collapse_pct: 20 (drop >20% below baseline, 3+ days)
- rolling_min_nights: 4 of 7 <!-- CHECK: new in v2, not in old skill — confirm -->
- cv_flag: unset <!-- CHECK: new in v2; old skill had no CV threshold — set a value or leave unset (report-only) -->

### recovery (Whoop recovery %, self-reported)
- green: 67-100
- yellow_upper: 50-66
- yellow_lower: 34-49
- red_below: 34
- no_failure_below: 50
- progression_hold_below: 60
- crash_from: 70; crash_to: 40 (≈30-point drop after one session)

### sleep
- debt_ok_h: <1
- debt_modify_h: 1-2
- debt_rest_h: >2
- catchup_h: 9
- context_good_h: 8
- context_poor_h: 7.5
- perf_optimal: 85
- perf_sufficient: 70-84

### rhr (delta vs baseline)
- monitor_delta: +2-3 bpm
- reduce_delta: +4-5 bpm
- illness_delta: +6 bpm

### intensity
- modify_pct: 85-90% of working weight

### strain (Whoop, self-reported)
- strength: 11-13
- strength_friday: 11-13 <!-- CHECK: conflicting values 11-13 (Friday prescription "same as Monday") vs 10-12 (weekly strain table) in old skill -->
- hiit: 13-15
- zone2_run: 6-8
- moderate: 9-11
- light_recovery: 4-6
- rest: 2-3 <!-- CHECK: conflicting values 2-3 (strain targets) vs 0-2 (Sunday in weekly table) in old skill -->
- deload_max: 6
- cap: 14
- cap_gates: HRV below 22 ms; recovery <60%; sleep debt >1 h; trained hard previous day <!-- CHECK: "HRV <22" (=baseline) blocks the HIIT target about half the time, and "trained hard previous day" blocks every Saturday HIIT after Friday strength; v2 skill applies the HRV gate to the 7-day mean modify band (cap, not cancel) -->

### deload
- standard: 5-7 days, walks only, strain <6, zero HIIT/strength/volume <!-- CHECK: conflicting values 3-5 days (Golden Rule / decision tree) vs 5-7 days (plateau, HRV collapse) vs 3-7 days (cortisol section) in old skill -->
- resume_when: HRV back to baseline for 2 consecutive days

### plateau
- min_days: 3 <!-- CHECK: conflicting values 3+ days (Plateau Diagnosis) vs 5+ days (Modification Rules) in old skill -->
- wait_days: <5
- deload_window: 5-7 days + HRV suppressed
- adjust_window: 7-14 days + HRV normal

### patterns
- short_sessions: 2+ in rolling 2 weeks
- lift_stall_sessions: 2 (flat or down)
- logging_gap: 3+ of last 7 days
- crash_per_week_deload: 2
- frequency_too_high: 4-5+ moderate+ days/week

### nutrition (Diogo's own diet)
- calories_target: 2200 (flat — not differentiated by session type; matches LoseIt setup) <!-- CHECK: conflicting values flat 2,200 vs "training-day floor ~2,150" in old skill -->
- deficit_cal: ~200-400/day
- protein_formula: 1.0 g/lb latest logged bodyweight on training days, 0.95 g/lb on rest days (decided 2026-10-01 — no fixed target; recompute from the latest `weight_lbs` every time)
- protein_plateau_check: weekly avg below the formula target
- calorie_plateau_check: 2000 (avg)
- crash_check_cal: 2100 (training day)
- refuel_trigger: recovery <48% for 2+ days
- refuel_cal: 2550-2700; refuel_protein_g: 220-240
- pace_lbs_per_week: 0.7-1.0 (decided 2026-10-01; weekly budget from `.scripts/candy_energy.py`, see energy) <!-- CHECK: at 2,200 cal the old skill estimated a 200-400 cal/day deficit (~0.4-0.8 lb/wk); reassess calories after 3 weeks of logged weights if pace runs under 0.7 -->
- stall_rule: pace <0.7 lb/wk for 3+ weeks with HRV stable → consider 2100 cal (don't drop protein)
- weekly_miss_flag_pct: 10
- water_oz: 100 daily
- creatine: 5 g daily (in scrambled eggs), no loading
- caffeine: decaf only, all day — heart-health reason; never recommend caffeine, do not speculate on the reason. Zero Diet Coke / energy drinks.
- portable: Fairlife in car, bars in gym bag; front-load breakfast 40-50 g
- whole_food: hard-boiled eggs (2-3 = 12-18 g, 140-210 cal); Greek yogurt/skyr (1 cup = 15-20 g); cottage cheese (1 cup = 24-28 g); string cheese + turkey (140 cal, 19 g); beef jerky/biltong (2 oz = 20-30 g)
- bars: Pure Protein 200 cal/20 g/$1.25 (Walmart/Costco); ONE 220 cal/20 g/$1.80; Epic Meat 80-100 cal/12-15 g/$3 (need 2); Built Bar original 130 cal/17 g/$1.65 (Amazon)

### energy (weekly calorie budget — read by .scripts/candy_energy.py)
- kcal_per_lb: 3500
- window_days: 21; min_days: 14; min_weighins: 10; min_intake_days: 10
- step: 100 kcal/day (guardrail easing; max one calorie change per week)
- training_day_shift: +150 kcal on strength/HIIT days, balanced on Zone 2/rest (no day below bmr_cal)
- max_pct_bw: 1.0 (% bodyweight per week)

### rotation (default; mirrors `Dashboards/Areas/Workout plan.md` and `Templates/workout.md`) <!-- CHECK: confirm Workout plan.md is canonical -->
| Day | Session | Platform | Duration | Strain | Role |
|---|---|---|---|---|---|
| Mon | strength | iFit Casey Gilbert / John Peel dumbbell series | ~40 min | 11-13 | hard |
| Tue | run (Zone 2) | iFit treadmill or outdoor (Germany Series jog) | ~30 min | 6-8 | easy |
| Wed | strength | as Mon | ~40 min | 11-13 | hard |
| Thu | run (Zone 2) or outdoor ruck / Germany Series walk | — | ~30 min | 6-8 | easy |
| Fri | strength | as Mon | ~40 min | see strength_friday | hard |
| Sat | hiit | iFit F45 (John Peel F45 series) | ~45 min | 13-15 | hard+ |
| Sun | rest | — no workout note | — | rest | rest |
- planned_sessions: 6
- workout notes created Mon-Sat; none on Sunday

### run
- pace: 5-6 mph; duration: ~30 min; hr_ceiling: 120-135 bpm; strain: 6-8
### hiit
- duration: ~45 min; strain: 13-15; intensity: true intervals, zone 4-5 (>85% max HR)

### lifting
- increment_lbs: 5
- vault_supersedes_after: 3 strength sessions <!-- CHECK: conflicting values 3+ vs 2+ logged sessions in old skill -->
- first_logged_session: 2026-09-28

### lifting_baselines (calibration, approximate as of 2026-09-27 — replace with logged actuals)
- bench press (floor or bench): 40 lbs/hand
- rows: 40 lbs/hand
- curls: ~22 lbs/hand (range 20-25)
- tricep extensions: 30 lbs total
- DB deadlifts: 30 lbs/hand

### roadmap (projection, not guarantee; at 0.7-1.0 lb/wk, ~30-42 weeks from 199 lb to 170 lb; update every 8-10 weeks) <!-- CHECK: phase weight deltas below come from the old 0.5-0.7 lb/wk roadmap -->
- weeks 1-8 Foundation: establish baselines; HRV stable 20-22 ms; weight -4-6 lb (early weeks mostly water/glycogen) <!-- CHECK: old roadmap says "3x/week hard (Mon/Wed/Fri): HIIT, Strength, Volume" — superseded by current rotation -->
- weeks 9-18 Adaptation: HRV 22-24 ms; occasional strain 13-14; weight -5-7 lb; RHR -2-3 bpm
- weeks 19-30 Growth: HRV 24-26 ms; strength visibly up; weight -6-8 lb, scale may stall while composition changes
- weeks 31-40 Peak/Approach: HRV 26-28 ms; 4x/week hard only if HRV consistently >24 ms; reach target range
- totals: HRV 22 → 28-30 ms; VO2 max +12-15%; RHR -4-6 bpm


## john

### Diogo's context (for "why it matters")
- **Field:** computational protein/biologics design, active learning optimization loops, drug discovery
- **Agentic Nutrition (X2):** AI-driven formulation platform for DTC nutraceuticals. Powder packet format. Non-therapeutic. Botanicals as supporting (never hero) ingredients.
- **Career:** targeting C-level; industry knowledge across both biopharma AND consumer health is a leadership asset. Agentic Nutrition is a C-level positioning opportunity.
- **Portfolio:** XBI exposure — biotech sector health is personal (price detail is Kevin's).

### Therapeutic-area priorities
- oncology, immunology, metabolic, neurodegeneration, rare disease
- peptide and protein therapeutics: relevant, do not overweight

### AI / computational drug discovery watchlist
- Generate, Recursion, Absci, BigHat, Evotec AI, Isomorphic Labs

### X2 formulation priorities
- GLP-1 Support, PMS Support, Depression/Mood Support, Nursing Support
- Trend themes to watch: GLP-1 support supplements, adaptogens, functional mushrooms, women's health (PMS, nursing support), mood/mental health supplements

### DTC / nutraceutical competitor watchlist
- **Thorne** — closest comp. Science-backed, premium positioning, practitioner channel + DTC. Track product launches, clinical partnerships, any moves into AI-driven formulation.
- **AG1 (Athletic Greens)** — brand/marketing powerhouse in the powder format; relevant to X2's powder packet model.
- **Ritual** — transparent supply chain positioning, subscription DTC model.
- **Momentous** — partnered with Huberman Lab, performance-focused.
- **Seed** — microbiome play, science-forward brand positioning.
- **Viome, InsideTracker, ZOE** — personalization / testing-led nutrition.
- ~~Care/of~~ — removed: shut down by Bayer in 2024. <!-- CHECK: confirm removal -->

### Source tiers
- **Tier 1 biopharma (every run):** STAT News (statnews.com), Fierce Biotech (fiercebiotech.com), Endpoints News (endpointsnews.com), BioPharma Dive (biopharmadive.com)
- **Tier 1 nutraceutical/DTC (every run):** NutraIngredients (nutraingredients.com / nutraingredients-usa.com), Natural Products Insider (naturalproductsinsider.com), Nutrition Business Journal / New Hope Network, supplement coverage on FiercePharma or STAT
- **Tier 2 (major stories):** Bloomberg, Financial Times, Reuters Health, Nature Biotechnology news, TechCrunch / Business Insider (DTC health funding, launches)
- **Tier 3 (specificity):** bioRxiv / medRxiv, Derek Lowe "In the Pipeline", Examine.com (supplement science), ConsumerLab (product testing / quality)

### Persistence
- Weekly roundup path: `Notes/Logs/YYYY-MM-DD biotech digest.md` (template `Templates/biotech-digest.md`)


## lily

- **Occasion window:** 30 days
- **Gift window:** 15 days <!-- from max's old Lily spec and life_pulse.sh; not in old lily skill -->
- **Immediate family (quality-time tracking):** relationship = wife, son
- **Quality-time threshold:** 14 days
- **Network reconnect thresholds:** warm > 60 days; neutral > 90 days; cold / dormant: skip unless note says "check in annually"
- **Life Pulse:** `.scripts/life_pulse.sh`, launchd Sunday 18:00 → `Notes/Logs/YYYY-Wnn life pulse.md`


## kate

### Identity & fit
- role: Senior exec, biotech, mostly in-office
- aesthetic: "Distinguished executive who clearly lifts" — polished, intentional, European warmth, never loud
- fit_goal: wardrobe evolves toward target weight (42R fills out properly)
- target_weight: see `## candy`
- location_for_weather: Sudbury, MA

### Vocabulary
- categories: Layers, Shirts, Accessories, Chinos, Shoes, Outerwear, Jeans, T Shirt
- occasions: Weekend, Pitch, Office Day, WFH

### Rotation
- repeat_window: last 3 outfit entries <!-- CHECK: conflicting values "last 3 outfit log entries" vs "last 5–7 days" in old skill -->

### Budget
- upper_limit_per_piece: ~$400–500
- kevin_check_above: $400 <!-- CHECK: old skill gives a range ($400–500); confirm threshold -->

### Brands
- premium: Reiss
- workhorses: Charles Tyrwhitt, Bonobos, Brooks Brothers, Polo Ralph Lauren
- phase_2 (gated on target weight): Eton, John Smedley, Suitsupply, Incotex

### Brand intelligence
Verdicts: ✅ Buy, 🤔 Test First, ⏳ Phase 2, ❌ Skip. Old Notion entries were not ported — add rows as brands are evaluated.

| Brand | Category | Price range | Verdict | Where | Why |
|---|---|---|---|---|---|


## diogo-interview-coach

General, role-agnostic. No standing role list — the role comes from the JD / invite each time.
- notion_notesdb: collection://05190de8-9edc-41fb-8f0d-d9947545e2da (optional; vault notes are used if unset or unreachable)
- notion_note_type: Interview
- default_interview_length: 30 minutes
