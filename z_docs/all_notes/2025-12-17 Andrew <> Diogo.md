---
Follow up:
tags:
  - 1v1
  - abiologics
  - compbio
---

---
## 💬 To Discuss

### Asks and Tasks

> [!check] Tasks
> ```dataview
> task
> FROM #acroneberger 
> WHERE !completed
> ```
> 


> [!NOTE] Previous notes
> ```dataview
> LIST
> FROM #acroneberger 
> WHERE follow-up = true | file.ctime > (date(now) - dur(7 days))
> ```
> 


---
## ✍️ Notes and Action Items

#goals

- SQL db implemented in Q1 2026
	- it's impeding growth of pipeline
		- take a shortcut: but into the database radiance
			- advantage: re-use infrastructure code
		- will work with Nitya to build this out quickly
	- allows off of ideas that were previously built

- code consolidation
	- how do we do code? 
	- institutionalized repo

