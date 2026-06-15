> [!tip] 📁 Templates
> Templater templates. Don't edit these unless you know what `<% %>` blocks do. Buttons in dashboards reference these by basename (no `.md` extension).

---

## Daily + meetings

| Template | Use |
|---|---|
| [[daily]] | Daily landing page (GTD-style, auto-loaded by Daily Notes plugin) |
| [[meeting_note]] | Generic meeting note |
| [[one on one]] | 1:1 meeting note |
| [[interview]] | Interview note (Anderson) |
| [[journaling]] | Journal entry |
| [[quick note]] | Ad-hoc note |

## Capture buttons (scripted)

These contain Templater script that prompts + creates the file directly. Invoked via Buttons-plugin buttons on dashboards.

| Template | Use |
|---|---|
| [[quick-note-button]] | Quick capture → `Notes/` |
| [[meeting-button]] | New meeting → `Notes/` |
| [[1v1-meeting-button]] | New 1:1 → `Notes/` |
| [[create-idea]] | New idea → `Notes/💡 <name>/` |
| [[create-work-project]] | New project → `Dashboards/Projects/<name>/` |

## Tracker schemas (Areas dashboards depend on these)

| Template | Frontmatter `type` | Backing dashboard |
|---|---|---|
| [[net-worth-snapshot]] | `net-worth-snapshot` | 💰 Finance |
| [[finance-review]] | `finance-review` | 💰 Finance |
| [[whoop-daily]] | `whoop-daily` | 💪 Fitness |
| [[workout]] | `workout` | 💪 Fitness |
| [[body-recomp]] | `body-recomp` | 💪 Fitness |
| [[closet-piece]] | `closet-piece` | 👔 Style |
| [[outfit]] | `outfit` | 👔 Style |
| [[wishlist-item]] | `wishlist-item` | 👔 Style |

## Reference

| Template | Use |
|---|---|
| [[idea]] | Idea page skeleton |
| [[idea-home]] | Idea home (folder note) |
| [[learning]] | Learning note |
| [[paper or book]] | Paper / book summary |
| [[gpt_prompt]] | GPT prompt scratchpad |
| [[work-project-home]] | Project home skeleton |
| [[SundAI Digest]] | Weekly SundAI digest |
