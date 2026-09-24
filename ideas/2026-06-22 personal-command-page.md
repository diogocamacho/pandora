---
type: idea
date: 2026-06-22
mode: challenge
status: promoted-to-project
tags: [idea, strategy, ai-ml, agents]
---

# Personal command surface: unified information view with Claude as co-present context layer

## The idea
A local app that aggregates Diogo's live information streams — Gmail, Outlook, Google Calendar, Outlook Calendar, Obsidian pandora vault — into a single visual surface that is aesthetically his. Claude is embedded alongside it with context on whatever is currently displayed. GTD capture writes directly into the pandora vault. Not a productivity app, not Notion, not Obsidian alone — a personal home base where looking and talking to Claude happen in the same place.

## What's load-bearing
- The core value is **co-present context**: Claude knows what you've been looking at, without you having to paste it in.
- GTD capture must write into an existing system (pandora vault) — no new store, no split brain.
- Must run locally because Obsidian is on-disk; cloud-only won't work without a sync layer.
- The read surfaces (email, calendar) need live API access — OAuth for Gmail and Microsoft Graph.

## Strongest case for
- The gap is real: no existing tool unifies live email + calendar + local Obsidian vault + Claude context in one surface.
- Arc, Raycast, Sunsama, Akiflow all solve fragments — none solve this combination.
- GTD capture → pandora vault is clean: no new backbone, just a write interface to existing system.
- Architecture is clear: local app (Electron or local web server), Obsidian via file I/O, cloud APIs for email/calendar, Claude API for the context layer.

## Strongest case against
- Auth complexity: Gmail OAuth + Microsoft Graph OAuth is real overhead before anything looks good.
- Claude context cost: keeping the context window fed with what's on screen could get expensive at scale if not carefully scoped.
- Maintenance burden: two email APIs + two calendar APIs means four integration surfaces to keep live.

## Open questions
- Electron vs. local web server? Electron is more native-feeling; local server is simpler to build.
- How does Claude get context on what's displayed — full content or summaries? Needs a strategy to avoid runaway token cost.
- Does calendar show Google + Outlook merged into one view, or side-by-side?

## Whitespace check
Everyone building in this space (Arc, Raycast, Sunsama, Notion AI, Akiflow) is pulling you into *their* UX. Nobody has built a surface that is fully personal + has Claude embedded with live context on all your data streams. The "aesthetically mine" dimension is genuinely orthogonal.

## Next steps
- [ ] Decide: Electron vs. local web server (recommendation: start with local web server, simpler, upgrade later)
- [ ] Set up Gmail OAuth credentials
- [ ] Set up Microsoft Graph OAuth credentials
- [ ] Build skeleton: panes for email, calendar, Obsidian, GTD capture box
- [ ] Wire Claude API with context = current pane content
- [ ] GTD capture → append to pandora vault inbox or daily note

## Status
- [x] promoted-to-project
