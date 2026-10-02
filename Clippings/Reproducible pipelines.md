---
title: "Reproducible pipelines"
source: "https://blog.genesmindsmachines.com/p/creating-reproducible-data-analysis?utm_source=post-email-title&publication_id=5419410&post_id=192019087&utm_campaign=email-post-title&isFreemail=true&r=2uxm8r&triedRedirect=true&utm_medium=email"
author:
  - "[[Claus Wilke]]"
published: 2026-03-27
created: 2026-10-02
description: "There was a discussion recently on Bluesky about reproducible data analysis pipelines."
tags:
  - "clippings"
---
There was a discussion recently on Bluesky about reproducible data analysis pipelines. This is a complex topic, and it’s difficult to do it justice in a bunch of 300 character posts. So I thought I’d take the opportunity to collect my thoughts on this topic in a longer-form article.

The discussion started with this post by Darren Dahly:

<iframe src="https://embed.bsky.app/embed/did:plc:3zyo4iakhqs47bttjalqgbk7/app.bsky.feed.post/3mhs6ndgvx22q?id=27295820038978746" width="100%" frameborder="0"></iframe>

To which I replied:

<iframe src="https://embed.bsky.app/embed/did:plc:v4fio6clr4zz64lhdkre7zph/app.bsky.feed.post/3mht4oqhtls2f?id=8813019454474085" width="100%" frameborder="0"></iframe>

I believe the difference between Darren’s position and mine boils down to what an ideal analysis pipeline should look like (Darren’s perspective) versus what actually works or doesn’t work in practice, in particular when supervising students who may still be learning the ropes (my perspective). I am all in favor of fully reproducible pipelines that can go from raw data to final figures. And yet, I’ve seen this approach go wrong in so many ways that I tend to actively discourage my students from pursuing it, at least in the strict way as expressed by Darren where there are no intermediate datasets and the pipeline always has to be run from the very top to make any changes anywhere.

First, there are a few immediate issues that I’ve seen crop up way too many times, and that I alluded to in my Bluesky post.[^1] One is slow turn-around time for minor changes. I’ve seen way too many students struggle with requests for small modifications to their figures. I ask a student to replace violins with boxplots, or to swap the x and the y axis, and it takes them an afternoon because they have to run everything from the top—and possibly multiple times—until the revised figure looks right. Another is gigantic data files that are difficult to archive or share. I’ve seen students keep raw log files from simulations, literally hundreds of gigabytes of data, but not store the handful of final values they had extracted from these log files.

Second, I believe intermediate files improve reproducibility, because pipelines break and an intermediate file is always better than a pipeline that no longer runs. Why do pipelines break? For one, students and postdocs, even the experienced ones, fail to anticipate the many ways in which code may no longer work in the future, and as a consequence their “fully reproducible” pipelines contain hidden dependencies that can be difficult to satisfy in the future. And also, nearly everything breaks eventually. Will your carefully crafted fully reproducible docker image still work in 20 years? Does it depend on some service that may no longer be available then?

All of these issues can be avoided if you make it a habit to always store the final processed data, right before plotting. And to ensure reproducibility, you can read it right back in after saving. Here is an example in Python:

```markup
import pandas as pd

# create your final data by whatever means necessary
final_data_for_plotting = ...
# write the final data frame to csv
final_data_for_plotting.to_csv('final_data.csv', index=False)

# --- if using Jupyter, start a new cell here ---

# read the data back in
final_data_for_plotting = pd.read_csv('final_data.csv')
# place your plotting code here
...
```

I think Darren knows this, because in a later post he wrote:

<iframe src="https://embed.bsky.app/embed/did:plc:3zyo4iakhqs47bttjalqgbk7/app.bsky.feed.post/3mhsj67pi3k22?id=7433049800838027" width="100%" frameborder="0"></iframe>

This is an R version of my Python example of saving the data and immediately reloading it.

In this context, however, I have to point out that I normally recommend against language-specific, binary data-dump formats such as.RData in R or.pickle in Python. Stick to simple text files that are interchangeable and can be read by anything. Comma-separated values (.csv) is good. You can gzip the file if it’s too large. There is nothing quite as infuriating as somebody sending you an.RData file when you’re exclusively working in Python or a.pickle file when you’re exclusively working in R. And again, think 20 years into the future. Will the language-specific dump file that may seem so convenient today still be your preferred choice, when maybe you haven’t used the relevant software in years and don’t have it readily accessible or no longer remember how it works? By contrast, a.csv file can be opened in Excel if necessary. And, if it’s stored in a GitHub repository, we don’t need to open it at all, we can just look at it in the browser.

In terms of organizing your pipeline, it’s generally a good idea to place all the figure generation code into a separate notebook or script, so that you can test that it runs standalone and doesn’t require any variables you may have generated earlier in the pipeline and forgot to write to disk. I also would like to point out that notebooks invite reproducibility issues, as they encourage out of order execution (you run three cells, then you go back up and make an edit and run a prior cell again, then you run the next cell three times, etc.). So, at the end of every working session with a notebook, you should clear all results, restart the kernel, and run everything from top to bottom to make sure the notebook is still self-contained and internally consistent.

Now, if you want to be super fancy, you can use something like [Snakemake](https://snakemake.readthedocs.io/en/stable/) to build a dependency graph that allows you to rerun the pipeline while caching all intermediate results that haven’t changed based on your most recent code edits. In this setup, I would definitely recommend having one or more separate script(s) just for the figures. If you’re primarily an R user, you can also consider the [{targets}](https://docs.ropensci.org/targets/) package, which provides a similar tool for the R ecosystem.

Tools such as Snakemake or {targets} work great, but they can present a bit of a learning curve and a meaningful amount of overhead to set up for any given project. If you routinely write long analysis pipelines consisting of many interdependent steps, it is probably worth it for you to go through the effort of learning these tools. But if you’re only analyzing data occasionally, or if your pipelines aren’t that complex, you’re probably better off just saving the final datasets right before plotting.

In summary, whatever you do, think about whether your analysis pipeline and/or intermediate results will still be accessible 20 years down the road. This may seem unimaginably far in the future, but I can guarantee you that if you stick around long enough somebody will ask you for data from 20 years ago. I recently wrote a paper where I needed data from a paper I had written 13 years earlier. I still had the project file from the interactive plotting software I had used at the time, but I no longer had the software. Fortunately that software used a text-based format and I could open the project file in a text editor and extract the data. This saved my day, but it would have been so much better had I saved the data in CSV format at the time. So do this going forward. Your future self will thank you for it.

### More from Genes, Minds, Machines

[^1]: I would like to emphasize that the problems arise because students try to be extra careful and aim to write reproducible pipelines that go from the raw data all the way to the final figures. And in the process, they create secondary problems that they didn’t anticipate.