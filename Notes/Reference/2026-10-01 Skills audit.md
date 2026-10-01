---
date: 2026-10-01
type: reference
tags: [skills, crew, audit]
---

# Skills audit (2026-10-01)

These are the account-synced copies, i.e. what Cowork actually loads. Your local `~/.claude/skills` couldn't be read because the app blocks access to it, so it may differ. Anthropic's stock skills (docx, pdf, pptx, xlsx, skill-creator, google-workspace, import-memory) were not reviewed. Line numbers refer to the synced SKILL.md files.

## System-level issues (fix these first)

1. **No single source of truth.** The same targets, positions, training rotation, people and dates are hard-coded in several skills, and the copies already disagree:
   - Positions: SCHD was sold according to Kevin (L22, L59), but Kevin's own L161 and Max L204/L217 still price it.
   - Nutrition and weight targets differ between Candy, Max's workout frontmatter and Kate.
   - Candy contains three different weekly schedules.
   Fix: put the data in vault files (e.g. `Notes/Reference/crew-config.md` plus the Finance and Fitness dashboards) and have the skills read it.
2. **Unclear architecture.** Max says "foundation, read first" and loads every crew skill (about 3,500 lines of context) before doing anything. Candy and Kevin say they are fully standalone, yet their text contains Max's brief spec. Fix: crew skills are standalone and each exports a small "brief block" spec; Max only sequences them and defines the output contract (target ~300 lines).
3. **Fabrication guards are uneven.** Max and Lily have "omit, don't invent" rules. John, Candy, Kevin's snapshot step, the interview-coach scoreboard and Sarah's streak counter do not. Fix: one shared rule in every skill: if the source tool or file is missing, say it's unavailable or omit the section, and never estimate. John items need a URL and a date.
4. **Phantom and misnamed skills.**
   - `/anderson` is really `diogo-interview-coach`.
   - Plato doesn't exist.
   - `log-training` doesn't exist, though Candy's description and L997 point to it.
   - Max loads crew skills from `/Users/dcamacho/.claude/skills/...` (L164) and also from a `~/work/personal/...trainer` path (L297).
   Fix: refer to skills by their real names.
5. **Three skills claim the morning brief.** `max` writes it to the vault, `morning` (an Anthropic example) renders HTML, and John's description says "trigger on any morning briefing". Fix: John and Lily are called only by Max; `morning` only on an explicit `/morning`, or retire it.
6. **Path drift.**
   - Max writes daily notes to the `Notes/` root and relies on Templater to move them into `Notes/Daily/` (fragile).
   - Meeting notes are created in `Notes/` but carryover looks in `Notes/Meetings/`.
   - `Archive/` and `! Inbox/` are referenced but don't exist.
   - Kevin writes snapshots to `Notes/`, while the existing portfolio notes are in `Notes/Life/`.
   - Lily's globs read `_template.md` as if it were a person.
7. **Third-party and sensitive data inside prompts.** The interview coach has candidate names, scores, salary bands and open roles. Lily has a family birthday plus a hard-coded countdown. Kevin has balances. Candy has health metrics. These load into every session and go stale. Move them to vault or Notion data.

## Per skill

| Skill | Verdict | Top fixes |
|---|---|---|
| **max** (881 lines) | Restructure | Build one path table; fix Meetings/ carryover; remove the Plato and Anderson names and the RETIRED steps; resolve contradictions (Todoist vs Obsidian Tasks vs Notion; 5am vs 6am; "doesn't invent a focus" vs proposing Top 3; two clashing slug tables); omit the Stoic quote if the fetch fails; stop the EOD reflection writing to an unreachable Notion collection; add "omit if tool absent" for Gmail and Todoist |
| **sarah** | Tune | Add trigger phrases; settle who owns "shutdown" (Sarah or Max); Sarah owns the brief's meeting-priority format, which Max currently contradicts; derive the review streak from `review_complete` frontmatter; feed the Friday Deep Synthesis into weekly review section 10 |
| **morning** | Retire or rescope | Duplicates Max's data pulls; its recurring task would run a second scheduler; uses sandbox paths. Its grounding rules (every item anchored to a tool result, verbatim quotes, empty sections dropped) are the best in the set, so port them to Max |
| **candy** (1,294 lines) | Restructure | Keep one rotation table; define each threshold once (two HRV schemes; pace and calorie numbers conflict); add a missing-data guard (Whoop isn't connected, yet the text assumes Whoop data); gate on 7-day rolling HRV, not a single night; add a red-flag list of symptoms that mean seeing a clinician; state physiology claims as mechanisms, not certainties; cut the textbook physiology sections (~50% shorter); create `log-training` or remove references to it; narrow the trigger so it doesn't catch Agentic Nutrition or nutraceutical questions |
| **kevin** | Tune | Re-check the priority order: the full emergency fund currently comes before high-APR card debt, which usually costs money (worth confirming with your advisor); allocation ranges can exceed the skill's own concentration flag; keep SPAXX out of investible math; add a missing-data guard to the snapshot; drop the invented probabilities; move balances to vault data; add a material-nonpublic-information line next to the "professional edge" XBI thesis |
| **kate** | Tune (doesn't work as written) | No data source: the leftover port-note placeholders sit next to "always query"; point it at the closet-piece, outfit and wishlist-item notes and `Dashboards/Areas/👔 Style/`; add trigger phrases; name a weather source; route big purchases through Kevin |
| **john** | Restructure | Require a URL and date on every item; 72h freshness; write "No verified items" when there are none; use the Clinical Trials, bioRxiv, PubMed and ChEMBL connectors instead of web search alone; Care/of shut down in 2024, so drop it; move the watchlist to a vault note; save the weekly roundup with `Templates/biotech-digest.md` |
| **lily** | Tune | Delete the hard-coded birthday and countdown (L103); skip files starting with `_`; when the network CRM is empty, say so rather than printing "contacts current"; align the schema with `_template.md` (the "Gift ideas" section isn't defined) |
| **diogo-interview-coach** | Restructure | Move candidates, scores and comp bands out of the prompt; state "Diogo is the interviewer; not for his own job search"; build the scoreboard from stored notes; fix the tool name (`notion-update-page`); questions probe 3 dimensions but scoring has 5; remove the duplicated D-space test and its overly narrow answer key |
| **writing-style** | Tune | Narrow the "not / rather than" scan so it doesn't strip scientific negations; replace "add a concrete specific" with "never add a specific that isn't in the source material"; keep any hedge the evidence requires; precedence rule: brand and template formatting win on visuals, writing-style wins on sentences; the `d.` sign-off only where its own table says so |
| **flagship-pptx-style** | Tune | Teal and `E2E8F0` are off-palette; the divider bar conflicts with "no accent lines"; allow sentence-case titles and a mostly-paragraph slide; make the "Confidential" footer a parameter; Neue Haas will trip the pptx skill's overflow QA |
| **paper-summary** | New | Watch the first runs |
