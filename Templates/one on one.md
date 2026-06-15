---
Follow up:
tags:
  - 1v1
---
<% tp.file.rename(tp.date.now("YYYY-MM-DD") + " person") %>
---
## 💬 To Discuss

### Asks and Tasks

> [!check] Tasks
> ```dataview
> task
> FROM ...
> WHERE !completed
> ```
> 


> [!NOTE] Previous notes
> ```dataview
> LIST
> FROM ...
> WHERE follow-up = true | file.ctime > (date(now) - dur(7 days))
> ```
> 


---
## ✍️ Notes and Action Items


