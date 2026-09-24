<%*
const name = await tp.system.prompt("Person name (e.g. 'Andrew Croneberger'):")
if (name) {
  await tp.file.rename(name)
  await tp.file.move(`Notes/People/${name}`)
}
%>---
type: person
name: 
person_tag:  # short tag, e.g. "acroneberger" — must match 1v1-meeting-button mapping
org: 
role: 
relationship:  # direct-report / peer / manager / external / family / friend
cadence_days:  # how often you should meet (number of days)
last_met:  # YYYY-MM-DD — auto-updates if you wire 1:1 button to write here
next_meeting:  # YYYY-MM-DD if scheduled
email: 
slack: 
tags: [person]
---

# <% tp.file.title %>

## About
- 

## Working with them
- Strengths: 
- Working style: 
- Tone & approach: 

## Past meetings
```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE contains(file.inlinks, this.file.link)
SORT file.name DESC
LIMIT 15
```

## Open loops (follow-ups)
```dataview
LIST WITHOUT ID file.link
FROM "Notes"
WHERE contains(file.inlinks, this.file.link) AND follow-up = true
SORT file.mtime DESC
```

## Personal notes
- 
