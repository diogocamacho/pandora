---
Follow up: false
tags:
  - 1v1
  - abiologics
  - compbio
  - bkartchner
---

---
## 💬 To Discuss

### Asks and Tasks

> [!check] Tasks
> ```dataview
> task
> FROM #bkartchner 
> WHERE !completed
> ```
> 


> [!NOTE] Previous notes
> ```dataview
> LIST
> FROM #bkartchner 
> WHERE follow-up = true
> ```
> 


---
## ✍️ Notes and Action Items

- 2 programs per protein designer
	- doable, with caution on cycle planning
	- room for improvement on the registration / design phase of cycle planning
	- align with chemistry to not be a last minute decision on modifications etc

- cycle planning meeting
	- too many cooks in the kitchen
	- PL + designer

- concerns:
	- ariel: bottleneck to getting things done #mhamill 
		- did not do migration
		- has no access to any Abio infra
		- the way ariel handles information:
			- lot of background
			- small steps
		- andrew has done the same benchmark for ariel 5 times
		- supposed to put on pipeline designs on 12/16
			- 9 plates, 3 weeks in a row, 1 target per week 
			- questions
				- target aware MPNN vs rosetta comparison
					- interface design for MPNN
					- want to do multiple targets
					- 1 plate of heterochiral vs rosetta design interfaces
					- 1 plate: 6 heterochiral MPNN, 6 heterochiral Rosetta, 6 homochiral MPNN, 6 homochiral Rosetta
				- do the fixes on backbone geometry help? 
					- scaffold question for MPNN
					- nice data set, recoded everything but interface
					- run half a plate on the same backbone, to address this question
				- can we produce high affinity binders at all? 
					- 1 plate
					- run pipeline in homochiral 
			- data on heterochiral:
				- SCK would be by 8th or 9th of january 
