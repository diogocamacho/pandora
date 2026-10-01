# Crew v2 — changelog and decisions (2026-10-01)


## max

# max — CHANGES (881 → ~266 lines)

**Removed:** persona/bio block, Kevin pull + price list (incl. dead SCHD), Candy accountability/coaching tables + example lift numbers, Lily L1–L3 steps, John format restatement, workout-note frontmatter targets (170/2200/195 → Candy), RETIRED Steps 4 & 7, Plato, Anderson (→ `diogo-interview-coach`), skill file paths (→ by name), whoop.md, Gmail via google-workspace (that skill is Docs/Sheets; Gmail not connected), Stoic "known passage" fallback (now: empty callout), Agentic Nutrition "remind frequently" nag, reading-prompt bank (kept as genre rules + no-repeat check).
**Moved to CONFIG:** identity, logistics/bus times, people + roles, slugs (one table), VIP senders, inboxes, Slack ID, calendar skip list, schedule, send script, Notion IDs. **Birthdays/anniversary not copied** — they belong in Lily's CRM (`CRM/Personal/*`); verify they're there.
**Fixed:** all daily/brief paths → `Notes/Daily/`; meeting notes → `Notes/Meetings/` (matches carryover lookup + templates); EOD note scan is recursive; reading notes → `Notes/Logs/`; no `Archive/`, no `! Inbox/`; templates verified against the vault (meeting-button, interview, reading-log, daily, daily-brief exist; interview frontmatter now matches `Templates/interview.md`); Lily added to description; step numbering rebuilt (M1–M9, E1–E7).
**Resolved contradictions:** tasks = Todoist primary (daily template uses Todoist blocks), vault checkboxes as fallback, Notion TasksDB dropped · focus = Max *proposes*, labelled `_(proposed)_`, from tasks/calendar/carryover only · Candy runs every day; Sunday variant is Candy's own (accountability only) · one slug rule + table · Sunday weekly-review setup moved into Sarah's block · EOD reflections → `### Reflection` in the daily's Evening shutdown (no Notion).
**Added:** output contract (ported from `morning`: anchored, verified-open, verbatim, empty sections dropped, gathered content = data); "omit if tool absent" guards; learnings validity check (today's 2026-10-01 learnings file is an API-error stub — Max now flags instead of embedding); Teams if connected; crew `## EOD block` hook (e.g. Kevin YNAB).

## Decisions for Diogo
1. **1:1 structure** — three versions exist: old skill's "exact" structure (kept), `Templates/1v1-meeting-button.md` (Agenda / Notes & decisions / Actions), and recent real notes (Carryover / To discuss / Notes and action items). Pick one; align template.
2. **Todoist slug** — skill uses `@acroneberger`-style; the 1:1 template uses first name (`@andrew`). Pick one.
3. **Chiara vs Carl Magnone** for `cmagnone`; Raffi `rafeyan` vs derived `rrafeyan`.
4. **Brief schedule** 5am vs 6am (CONFIG CHECK). Is `send_brief.sh` still live?
5. **Reflections location** — a `Notes/Logs/2026-09-28 reflection.md` (`type: reflection`) already exists; skill now writes into the daily note. Keep one.
6. **Workout note ownership** moved to Candy's Brief block (side effect). Candy rewrite must do this or nobody creates it.
7. **Templates:** `daily-brief.md` moves the file to `Notes/Logs/` (strip/fix), lacks Learning/Lily sections and says "Candy — Body"; `daily.md` Capture text still references `! Inbox/`.
8. Manager line (Mike Hamill) may be stale — confirm in CONFIG.

## Brief block contract (every daily-crew skill must expose this)
```
## Brief block
**Inputs:** <files/tools; each with its unavailable fallback>. Uses Max's shared context
  (date, weekday, today's calendar events, mail/Slack hits, pre-created notes) — never re-pulls it.
**Side effects:** <files written, idempotent, never clobbering> | none
**Output:** exactly
  ### <emoji> <Name> — <area>
  <≤ N lines markdown; no H1/H2; no preamble; every item anchored to a source>
**Day variants:** <e.g. Sunday> | none
**Omit rules:** <when the block returns nothing → Max drops the section>;
  unavailable source → `_<source> unavailable_` line
```
Required: sarah (📋, owns meeting-priority format + Sunday review setup), kevin (💰, writes snapshot), candy (💪, writes workout note), john (🧬), lily (💗). Optional `## EOD block` with the same fields. kate / diogo-interview-coach: no Brief block.

## sarah

# sarah — changes

**Added**
- Description with triggers (/sarah, weekly/monthly review, triage, brain dump, inbox zero, plan my week) and a not-for clause (morning brief, EOD shutdown → `max`).
- Shared crew-rules block; `## Brief block` with Mon–Sat, Monday, and Sunday formats, inputs, line limits, omit rules.
- Phase 1g: weekly review now pulls the Friday `YYYY-Wnn Deep Synthesis.md` (incl. 📄 Papers this week), the week's `*learnings.md` logs, `Papers/Analyses` with `analyzed_on` this week, and idea notes with `evidence_last` this week (✅/⚡). New "Learning this week" walk-through row.
- Obsidian Tasks grep recipes (vault primary; Todoist only if connected).

**Fixed**
- Ownership: Sarah owns the meeting interpretation (2–3 meetings that matter + why, deep-work status), Sunday pre-population, last-review-date flag, and Monday missed-review flag. Max L536/L541–544 must drop its copies and only place Sarah's block.
- Streak: removed the "running count" and hard-coded W39 example; streak is derived from `review_complete` / `week_iso` frontmatter in `Notes/Reviews/`.
- No-fabrication applied to every pull (1c–1f, calendar, tasks), not just Todoist completed.
- Monthly Q1 "What were they?" now sourced from config `monthly_goals` + the month's weekly reviews; health/finance delegated to `candy`/`kevin`; output location defined (section in that week's review note).
- Weekly review follows `Templates/weekly-review.md` sections; the 11-row table is guidance by intent, not by section number.
- "Two Modes" listing three → replaced by Brief block + Standalone.
- Shutdown: kept as rules for Max's EOD; "shutdown" trigger routed to `max`.
- Dropped `grep -v Archive` (no Archive/); portfolio-snapshot lookup made recursive under `Notes/`.

**Moved to CONFIG**
- Morning window, bus times, Allison WFH note, work pattern, Outlook account, review cap, deep-work thresholds, operating diagnosis, career target, protected areas (incl. Mike Hamill, Raffi Rafeyan, X2).

**Removed**
- Duplicate Mode 1/Mode 3 descriptions; "Sarah doesn't re-pull data Max already has" (Sarah now pulls her own inputs).

## Decisions for Diogo
1. Task source: brief says Obsidian Tasks primary, old skill + Max say Todoist is source of truth with the Todoist Sync plugin in the daily note. Confirm Todoist is retired (and remove the Todoist blocks from `Templates/daily.md`), or keep it as primary.
2. Capture inbox: Max references `! Inbox/` (doesn't exist). Where should triaged-later captures live? Currently: daily-note `## 🧠 Capture (inbox)` only.
3. Weekly review filename: kept `YYYY-MM-DD weekly review.md` (date-based) while Deep Synthesis uses `YYYY-Wnn`. Switch to `YYYY-Wnn weekly review.md` for consistency?
4. Set `monthly_goals` in config — none were recorded, so monthly Q1 currently has only weekly Top 3s to go on.
5. Allison's WFH days: fixed schedule to record, or keep "ask when relevant"?

## kevin

# kevin — changes

**Moved to CONFIG:** financial state, debt tracker, EF target/components, positions + target ranges, priority stack, tax bracket, dated obligations, snapshot folder, YNAB mode. Duplicated balances (old L18–30, L42–46, L354) collapsed to one place; stale values marked CHECK and now derived from the latest snapshot where possible.

**Fixed**
- SCHD removed everywhere (old L161 investible bucket). Snapshot schema in Kevin is THE schema; matches what is actually being written in the vault (`spaxx_shares`, `prior_total`) plus `price_date`. Max should call `## Brief block` instead of its own step 2c (which still prices SCHD, "five positions", no SPAXX).
- SPAXX defined: EF component, excluded from investible/allocation math (old L117 vs L123 vs L160).
- Snapshot guard: no prices → no snapshot, `_prices unavailable_`; no prior → ask for shares. Dropped "never skip"/"immutable" absolutism and "what probability" invented odds.
- Unverified quant claims (QQQ/SMH ~80% overlap — TSMC isn't even a Nasdaq-100 constituent; XBI "largely uncorrelated") → marked to-verify with sourced data.
- Added APR-vs-yield flag rule (stack kept as stated); added MNPI compliance line on XBI edge.
- Snapshot path: config folder (Notes/Life/); prior-snapshot lookup by `type:` across `Notes/` so legacy notes are found. Finance review / net worth use the existing templates (they self-file to Notes/Reviews/ and Notes/Logs/).
- YNAB streak: computed from `ynab_logged` daily-note frontmatter; missing = no record, never counted.
- Trigger narrowed to personal finances; not biotech news (john), not Agentic Nutrition/company finance.
- Added `## Brief block` (≤8 lines, omit rules). Caveat stated once at top.

**Removed:** "Independence note", repeated consulting principles merged into rules, example takes with concrete calls.

## Decisions for Diogo
1. **Priority stack:** EF fully funded before standard-APR cards (old L52, L129–134). Each dollar parked in cash instead of the cards costs roughly APR − cash yield. Suggested: starter EF → cards → finish EF. Also: the bonus framework (debt → liquidity) contradicts the general stack (EF → debt). Which order?
2. **Card APRs:** still TBD. Needed for (1).
3. **Liquidity framing:** the Waymark taxable managed account (largest liquid asset) is ignored in EF/runway math. Count it (partially) as backstop liquidity, or keep it excluded?
4. **Concentration:** QQQ 35–45% + SMH 10–15% allows 45–60%, so the >50% flag can fire while both are in range. Lower QQQ's range or raise the flag?
5. **Snapshot folder:** confirm Notes/Life/, and move the existing ~10 snapshots out of Notes/Meetings/ (dashboard queries all of `Notes/`, so either works).
6. **Finance dashboard** hard-codes target ranges (35–45, 10–15) and reads net-worth fields `portfolio_total/cash_savings/debt_total`, while the net-worth template writes `assets/liabilities/net_worth`. Pick one schema.
7. Paydown method: avalanche or snowball (table currently orders by balance).
8. Patriots ~$5k: exact due date.

## candy

# candy — changes (1294 → 220 lines)

## Removed / moved
- All numbers (stats, Whoop baselines, age/birthday, thresholds, strain targets, nutrition, food/bar lists, rotation, lifting baselines, roadmap) → CONFIG `## candy`; skill references keys.
- Textbook physiology (HRV primer, cortisol cascade, sleep-debt example, caffeine half-life, recoverer patterns, VO2/HRV paradox) → cut to decision rules in §2/§4.
- Whoop appendix (duplicated the decision tree), duplicate progression rule, "Is This Too Much?" history (kept: Zone 2 spot-checks, optional mobility), "Why recovery-managed beats unmanaged", Core Competencies summary.
- Invented examples (HRV trend Feb–Mar, 193.4/192.4 lb, recovery % called HRV, barbell 185/225 loads vs dumbbell baselines) → one placeholder example.
- `log-training` references → `/candy log …` quick-log mode inside the skill.
- Morning Coaching Output → `## Brief block` (accountability, today, workout-note card, omit rules). Max should drop its Step 2g/4b Candy logic and the "Waiting on your Whoop numbers… whoop.md" line.

## Fixed
- One rotation: Mon/Wed/Fri strength, Tue/Thu Zone 2 (Thu ruck/walk option), Sat HIIT, Sun rest — matches L1152–1191, `Workout plan.md`, `Templates/workout.md`, and Max. Removed stale Wed HIIT / Tue Zone 2 + Sat Ruck / "3 hard + 4 easy" / "resume 3x/week".
- All recovery inputs explicitly self-reported, with an ask-or-omit guard (Whoop/LoseIt not connected).
- Logging split: workout note = canonical training-day record (the dashboard reads `weight_lbs`/`hrv_ms` there); `YYYY-MM-DD whoop.md` (whoop-daily) = recovery on no-workout days (Sunday) so the HRV window has no gaps; `YYYY-MM-DD weigh-in.md` (body-recomp) = BF%/tape. Body fat now goes to weigh-in, not the workout body.
- HRV: decisions run on the 7-day rolling mean + CV; a single night is a soft flag only; deload needs a rolling-mean trigger (old: single-night and 3-day nightly declines, inside normal 19–25 ms noise).
- "Never exceed 14" when HRV is below the modify band now caps HIIT instead of cancelling it.
- "3+ hard in 5 days" now applies only to hard sessions added beyond the rotation (the rotation itself tripped it every Monday).
- Health: added a red-flag list (stop, see a clinician); "whoosh" predictions, caffeine improvement guarantees, cortisol "blocks", and water-retention claims reworded as likely mechanisms; never recommend caffeine.
- Trigger narrowed to Diogo's own training/body/recovery/diet; excludes Agentic Nutrition / nutraceutical work.
- Dropped incoherent L116 ("last 7 days >20 moderate+ strain days/month").

## Decisions for Diogo
1. Confirm `Dashboards/Areas/Workout plan.md` is the canonical rotation (it matches CONFIG today).
2. HRV bands: absolute 22 / 19–21 / <19 ms (kept) vs % bands (at / 10–20% below / >20% below baseline).
3. Set `hrv.rolling_min_nights` (proposed 4/7) and `hrv.cv_flag` (unset = report only). Both are new.
4. Protein: fixed 195 g vs 1.0/0.95 g/lb formula vs 190 g plateau check.
5. Calories: flat 2,200 (kept) — drop the "training-day floor ~2,150"?
6. Pace 0.3–0.5 vs 0.5–0.7 lb/wk; target 170 vs 170–175 lb.
7. Friday strain 11–13 vs 10–12; rest-day strain 2–3 vs 0–2.
8. Strain-cap gates: keep "trained hard previous day" (blocks every Sat HIIT)? HRV gate at baseline 22 or the modify band?
9. Deload length 3–5 vs 5–7 days; plateau trigger 3+ vs 5+ days; vault supersedes baselines after 2 vs 3 strength sessions.
10. Fitness dashboard reads workout notes only: the HRV chart misses Sunday whoop notes. Extend the query to `type: whoop-daily` if you want them.
11. Optional: add `target_strain` / `result` frontmatter fields to `Templates/workout.md` (currently body lines only).

## john

# john — changes

## Removed
- PORT NOTES scaffolding block.
- "Mandatory every briefing" framing and "trigger on any morning briefing" (collided with max/morning). Max now calls `## Brief block`.
- Example lines with concrete-looking claims ("Thorne just raised $X at $Y…", "third peptide-drug conjugate deal…") → `<placeholder>` patterns.
- Care/of from active competitors (shut down by Bayer in 2024); struck through in CONFIG.
- "Log somewhere persistent (notes app, journal…)" vagueness.

## Moved to CONFIG
- Diogo's context (field, X2 positioning, career framing, XBI exposure), therapeutic-area priorities, AI-discovery watchlist, DTC competitor list, X2 formulation priorities, source tiers.

## Fixed / added
- Verification rules: per-item claim + why-it-matters + [source](url) + publication date; 72h window (Monday: since Friday) actually enforced; unsourced/out-of-window items dropped; `No verified items.` for empty buckets; primary sources over aggregators; single-source and paywall flags; numbers only as stated.
- Tool map: Clinical Trials MCP (NCT verification), PubMed, bioRxiv, ChEMBL, Open Targets, WebFetch for FDA/SEC/IR; connectors = context, not news.
- Brief block: ≤8 items ranked by config relevance, linked; signal line only if ≥2 items support it; dedup against yesterday's brief. Replaces 8–12-line free format (max's "3–4 items + signal" spec now lives here only).
- Papers: one line + suggest `/paper-summary <link>`; preprints labeled.
- Weekly roundup persisted to `Notes/Logs/YYYY-MM-DD biotech digest.md` via `Templates/biotech-digest.md`, with section mapping. Diogo can change the path in CONFIG.
- Description rewritten with explicit triggers and not-for clause.

## Decisions for Diogo
- Weekly roundup reuses the daily `biotech digest` filename pattern; if you also want daily digests persisted, pick a distinct weekly name (e.g., `YYYY-Wnn biotech weekly.md`).
- Max's old John spec required "connect at least one story to Abio, X2, or portfolio". New rule: connect only when real. Confirm.
- Confirm Care/of removal; confirm Viome/InsideTracker/ZOE stay on the watchlist (they were listed only once, as direct competitors).
- `Templates/biotech-digest.md` has an "Abio" connection line. John stays public-news only; fill it only from public items.

## lily

# lily — changes

## Removed
- Hard-coded family birthday + countdown pinned to Sep 29 and the worked example ("today is Sep 29…"). Occasions now computed from CRM frontmatter only; the 🚨 empty-gift-ideas flag is generalized to any occasion inside the gift window.
- `head -15` bash loops that globbed `_template.md` as a person.
- Hard-coded direct-report list in "does not do" (missed one).
- Home.md "🧠 New Learnings" Dataview claim (unverified).
- "Autonomous" framing — Lily runs only via `life_pulse.sh` or on request.

## Moved to CONFIG
- Occasion window 30d, gift window 15d, immediate family = wife/son, quality-time 14d, warm 60d / neutral 90d.

## Fixed / added
- Schema defined once, matching both `_template.md` files (verified in vault), incl. `## Gift ideas` and the `Experience ideas` heading variant in the sons' notes.
- Skip `_*` files; empty network CRM → `Network CRM empty — add contacts in CRM/Network/` (standalone + pulse; not shown in brief).
- Date parsing tolerates YYYY-MM-DD, MM-DD, MM/DD, MM/DD/YYYY; template `# …` comments = empty; real date calculation required.
- Brief block: occasions in window, gift status, ≤1 family nudge, ≤1 network nudge, ≤6 lines; whole section omitted if nothing due (old "No occasions…" / "contacts current" filler lines dropped).
- Life Pulse section spec mirrors `life_pulse.sh` output sections exactly.
- Out-of-scope rule: anyone in `Notes/People/` unless also in CRM.
- CRM update rules: last-contact/last-quality-time updates, Connection history row, new personal contacts.

## Decisions for Diogo
- Allison's `anniversary` is stored as MM/DD/YYYY (template says MM-DD). Lily parses it, but normalize the field (or update the template to allow a year).
- `life_pulse.sh` hard-codes thresholds (30/15/14/60/90) and "wife and sons" in its prompt; it does not read crew-config. Either keep them in sync manually or have the script read `## lily`.
- All three personal notes have empty `last-quality-time`, so the brief will nudge daily until it's logged.
- Max's Key People section duplicates family birthdays/anniversary; CRM should be the single source — remove from max/CONFIG or accept the duplicate.
- "Check in annually" for cold/dormant contacts now means a 365-day threshold. Confirm.

## kate

# kate — changes

**Data source fixed:** PORT NOTES placeholders and Notion DB references removed. Closet / outfit / wishlist now read from vault notes by frontmatter `type:` (`closet-piece`, `outfit`, `wishlist-item`), using the real fields from `Templates/closet-piece.md`, `outfit.md`, `wishlist-item.md` (verified on device). Notion relation fields → `pieces:` wikilinks in outfit notes. Brand Intelligence → table in CONFIG (empty; old Notion rows not recoverable). Dashboard `Dashboards/Areas/👔 Style/` referenced read-only.

**Moved to CONFIG:** identity/role, categories, occasions, repeat window, budget cap + Kevin threshold, brand lists, location.

**Fixed**
- Description: explicit triggers, "not for" clause, on-demand only (old text said "orchestrated by Max"; Max says on-demand). `## Brief block` = none.
- Weather: web search Sudbury, MA forecast with citation, else ask (was unspecified).
- Body target / Phase 2 gate: read latest weight from candy's `body-recomp` / `workout` notes, target from `## candy` config; no data → treated as gated.
- Over-threshold purchases → `kevin` lifestyle-expense check.
- Repeat window unified to one CONFIG value.
- Outfit logging writes `Notes/Logs/YYYY-MM-DD outfit.md` per template, only after confirmation.
- "Donate" status mapped to `condition: retire` (template has no donation field).

**Preserved:** all style principles (layering, color logic, shoes, coloring/framing), event rules, photo-critique flow, tone.

## Decisions for Diogo
1. Repeat window: last 3 outfit entries or last 5–7 days?
2. Kevin-check threshold: $400 or $500?
3. Closet template has no Keep/Review/Donate field. Is `condition: retire` enough, or add `donation: keep|review|donate` to `Templates/closet-piece.md`?
4. Outfit template uses one generic `pieces:` list; old log had shirt/pants/shoes/layer slots. Keep generic?
5. Brand Intelligence verdicts from Notion are lost — re-enter the ones you remember into CONFIG?

## diogo-interview-coach

# diogo-interview-coach — changes

**Added**
- Description with triggers (/interview-coach, prep/score/search status) and not-for clause (Diogo's own job search as candidate).
- Shared crew-rules block; `## Brief block` (today's interviews only: time, candidate, role, prep link; omitted otherwise).
- Live interview mode (≤3-line replies: next follow-up, red flag, clock; kill-switch handoff) — previously promised in description with no protocol.
- Question probes for D3 (adaptability, generic version when D-space doesn't apply) and D4 (concept → outcome); question set now covers all 5 scored dimensions (6–7 questions).
- Storage section: Notion NotesDB primary (as in original), vault `Notes/Meetings/<date> Interview <Candidate>.md` fallback/mirror (matches Max's pre-created files). Fixed machine-readable Total line / frontmatter so the scoreboard can read stored scores.
- `## Interviewer Feedback` section on each page so the improvement arc is read from stored debriefs, not recalled.

**Fixed**
- Scoreboard rebuilt from stored notes (NotesDB `Note Type = Interview` + vault interview notes); unscored = "not scored"; grouped per role.
- "The pattern across all interviews in this search" → per-role scoping; benchmarks compared within the same role only.
- `update_content` → `notion-update-page`; other Notion calls checked (`notion-create-pages`, `notion-fetch`, `notion-query-data-sources`, `notion-query-meeting-notes`).
- D-space question stated once; 5/5 key no longer requires one specific answer — scores reasoning quality, lists credible routes as non-exhaustive.

**Moved**
- To CONFIG: open roles, NotesDB ID, team tag, default length, EngagementsDB link, litmus-test role scope, pointer to search note.
- To `Notes/Reference/interview-search.md` (seed in CONFIG.md, below the divider): team composition, platform note, comp bands, candidate benchmarks. **Recommendation:** keep third-party candidate names/scores and salary bands in that dedicated note (or a restricted Notion page), not in the shared crew-config.

**Removed**
- "Anderson" persona and `/anderson` (brief: no Anderson). Max must call `diogo-interview-coach`.
- Duplicate trigger list, duplicate D-space mentions (3→1), "Living document" footer.

## Decisions for Diogo
1. Max says the only connected Notion is the Abio Comp Team workspace. Is NotesDB (`05190de8…`) inside it and reachable? If not, flip vault to primary.
2. Confirm open roles are still current (two listed; old skill dated the search as "current").
3. Should `/anderson` remain as a legacy alias in the description? Excluded per brief.
4. Benchmarks/comp bands: vault note vs. restricted Notion page — pick one home.
