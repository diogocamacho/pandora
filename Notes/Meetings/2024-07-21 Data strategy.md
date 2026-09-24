---
tags:
  - datastrategy
  - biotech
  - compbio
  - strategy
Follow up:
---

As you put together your newest idea into a company form, following all of the recommendations that authors like **Stephanie Wisner** have, one of the questions that you will be asked by investors and other biotech executives is “what is your data strategy?”

Here, I would like to tackle that. I will lean on a variety of reports and posts from people that I have followed over the years, together with my own experience and how I like to think about data strategy for a biotech company, from the early days when all you have is that crazy idea to the much larger 25-person company with a couple of assets in different stages of development and a computational team handling all things “data”. So let’s dive in.

# Data strategy by Microsoft Copilot
To start off the post I wanted to do something silly. I went into [Copilot](https://www.bing.com/chat?q=Microsoft+Copilot&FORM=hpcodx) and asked it to define data strategy for a biotech for me:

Not too shabby. Don’t start making your slide deck on data strategy on this alone, but it’s a good start. The main takeaways are, of course, that you need to think about the data in your company as a valuable asset (I would argue the **most valuable** asset), so how you handle it, from security to acquisition to how it will be processed and used by your analytics teams should be front and center. The sooner you think about it, the biggest return on (data) investment and the biggest impact you can have.

# FAIR enough
Grounding all of your strategic thinking around data needs to be the FAIR acronym. Data needs to be **F**indable, **A**ccessible, **I**nteroperable, and **R**eusable. After all, you don’t want to have data lying around somewhere, in some external drive somewhere, collecting literal dust, and just squander away the hard earned funding that you got, do you? I strongly recommend reading [Mark Wilkinson et al](https://www.nature.com/articles/sdata201618) on the driving principles of FAIR data, and while I will not use all of their discussion points here, it is a key manuscript to read if you are a data scientist/computational biologist or someone in charge of everything data at your organization.

So what does make data to be **FAIR**? When you think about what the four letters of the acronym mean, it essentially highlights that there needs to be a cohesive nomenclature for your data. In data terms, you will have unique identifiers for the data, descriptive metadata (to tie things to different experimental arms), you need to make the data accessible through a scalable resource (pet peeve: sharepoint is not data strategy. neither is egnyte). As you build your vocabulary for data sources, the same vocabulary is carried through your data repositories, linking the many different data that you will have. 

As you make data FAIR, you will be able to map data points from different experiments together, which in turn can empower your data analyses teams (your computational biology or machine learning team, for example) to piece together models and analyses work flows that are continuously evolving as new data is generated. In a data rich world you don’t want your analytics to lag behind and look at last year’s data without considering what else have your learned since.

There is a lot more to unpack and sharpen as you make your data FAIR, but this process is a sure bet in defining your data strategy.

# Tools, tools, everywhere
A recent post from **Dean Lee** highlighted the massive environment of tools we have today to help us track, analyze, collate, and manage our data. While it is an impressive set of tools, there is, of course, a time and place for all of them. In fact, I will argue that, as you define what you want to do with your data, you will land on a handfull of them, and that a handful of them is indeed all you need. And, broadly speaking, what would those tools be:

* A database to store your data (this is an obvious one). And by data we mean **all** data, not just R&D. To truly empower a data-centric organization, every datum needs to make it into the database, and different constrains can be placed in what has restricted access versus not;
* A means to catalog your data: LIMS systems or eLNs go here.
* A means to acquire data: automation workflows for direct data acquisition from lab instruments, pipelines to access externally available data sets
* A means to process your data: nextflow pipelines, flowjo instances, image processing tools
* A means to analyze your data: Jupyter notebooks, Posit servers, all running through AWS compute, is a good start;
* A means to visualize your data: R Shiny or Dash dashboards, providing no-code solutions to the entire organization to visualize the data

These are just broad strokes on how you need to think about your data. As you build your infrastructure, you don’t have to put everything in place right away, as long as you maintain the focus on the data being FAIR and the ability for your computational environment to be scalable. Graph data bases, AWS’ elastic file system, and the like, when carefully thought of, can give you enough flexibility, while helping you remain scalable.

# This, that, and the other thing
Your data is FAIR, you have chosen your tools, you have optimized your computational environment. Now comes the hard part: making sure that, as your comparny grows, your data strategy stays true, while scalable. We have all been in cases in which our database architecture changes, in which tools become obsolete, or better compute resources become available. However, if your data strategy remains strong and well defined, these changes should not come with increased headaches or complete revamping of what you had put together. 

And that is the premise of a strong data strategy: flexibility to accomodate business and environment challenges and needs, while ensuring minimal disruption of the established data principles. If you started off by building a SQL database to store all of your data but you met a truly engaging and convincing rep that sold you a state of the art graph database, nothing about your data strategy changes other than swapping one tool for another. 

# Data strategy and Computational Biology + ML
The last consideration for your data strategy, even if seemingly tangential, is how your data strategy will help your computational biology and machine learning teams. Both disciplines demand data at the whim of the analyst. You just got another genome sequenced? You finally got the results from the protein modification you predicted? You collected the latest in vivo data for your lead molecule? With well defined data workflows, nomenclature, notification systems, and visualization tools, these data go straigth from your instruments or your CROs to your database, a notification to the analytics teams is triggered, an analyses workflow is triggered, and within a short period of time your computational biologist and/or your machine learning scientist will be sitting with their biology/chemistry counterpart looking at the data together, designing the next round of analyses and experiments, and generating additional insights. This seems idyllic, but this data centric approach to biotech and drug discovery is key to continuously advance innovation and the identification of new therapies for patients. 

# Additional reading
If you like this topic, some cool resources: 

* [Data Strategy to Support Pharmaceutical Operations](https://www.americanpharmaceuticalreview.com/Featured-Articles/576966-Pioneering-a-Data-Strategy-to-Support-Pharmaceutical-Operations-and-Technology/)
* [Digital Transformation](https://www2.deloitte.com/us/en/insights/industry/life-sciences/biopharma-digital-transformation.html)
* [Biotech startup guide to data and communication](https://medium.com/@jfeala/the-biotech-startups-guide-to-data-and-communication-tools-dd4a3ba014c8)


# Closing thoughts
When you build your data organization, it is fundamental to ensure that the analytics teams (from Computational Biology to Machine Learning, Business Analytics, G&A, and Finance) have the most up to date data to inform on the research and business needs. As you think about your data and how to make the best of it to bring all the success you want to your venture, just keep in mind that making the data FAIR is not a data strategy, neither is putting together pipelines between a disjointed set of tools and computational frameworks. Your data strategy needs to be well thought out, needs to be scalable, and needs to address the current and future needs of the organization. Put some thought into it and you will be a data tsar in no time! 



Happy Computing! 