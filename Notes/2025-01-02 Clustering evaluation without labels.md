---
tags:
  - compbio
  - data_science
  - ml
  - learning
Follow up:
---


---
## 🧠 Note


Evaluating clustering quality is usually difficult since we have no labels. Thus, we must rely on intrinsic measures to determine clustering quality.

Here are three metrics I commonly use:



**1) Silhouette coefficient:**

Here's the core idea:

If the average distance to all data points in the same cluster is small...

...but that to another cluster is large...

...this indicates that the clusters are well separated and somewhat "reliable."



! 



It is measured as follows:

For every data point:

* A → average distance to all other points within its cluster.
* B → average distance to all points in the nearest cluster.
* score = (B-A)/max(B, A)

Next, compute the average of all scores to get the overall clustering score.

If B is much greater than A, then score=1 and it indicates the clusters are well separated.

Measuring it across a range of centroids (k) can reveal which clustering results are most promising:

! 





[2) Calinski-Harabasz Index](https://click.convertkit-mail2.com/r8umlwpn6guoh39dme2t2hd79mn66s7/z2hghnh3mll59rtp/aHR0cHM6Ly9zY2lraXQtbGVhcm4ub3JnL3N0YWJsZS9tb2R1bGVzL2NsdXN0ZXJpbmcuaHRtbCNjYWxpbnNraS1oYXJhYmFzei1pbmRleA==)

The run-time of Silhouette score grows quadratically with total data points.

Calinski-Harabasz Index handles this, while being similar to Silhouette score.

! 



Here’s how it is measured:

* A → sum of squared distance between centroids and the dataset's center.
* B → sum of squared distance between all points and their specific centroid.
* Metric is computed as A/B (with an additional scaling factor).

If A is much greater than B, then score>>1 and it indicates the clusters are well separated.

Calinski-Harabasz Index makes the same intuitive sense as the Silhouette Coefficient while being much faster to compute.



[3) DBCV](https://click.convertkit-mail2.com/r8umlwpn6guoh39dme2t2hd79mn66s7/p8heh9hzpqqrklfq/aHR0cHM6Ly9naXRodWIuY29tL2NocmlzdG9waGVyamVubmVzcy9EQkNW)

Silhouette score and Calinski-Harabasz index are typically higher for globular (spherical in the case of 3D) clusters.

Thus, using them on density-based clustering can produce misleading results.

DBCV (density-based clustering validation) solves this, and it computes two values:

* The density **within** a cluster.
* The density overlap **between** clusters.

A high density within a cluster and a low density overlap between clusters indicate good clustering results. The effectiveness of DBCV is evident from the image below:

! 

As depicted above:

* The clustering output of KMeans is worse, but its Silhouette score is still higher than that of Density-based clustering.
* With DBCV, the score for the clustering output of KMeans is worse, and that of density-based clustering is higher.



That said, here, we covered centroid-based and density-based evaluation.

* You can read about Distributed-based clustering and its evaluation here: [Gaussian Mixture Models (GMMs)](https://click.convertkit-mail2.com/r8umlwpn6guoh39dme2t2hd79mn66s7/x0hph6hw4qqk87i5/aHR0cHM6Ly93d3cuZGFpbHlkb3Nlb2Zkcy5jb20vZ2F1c3NpYW4tbWl4dHVyZS1tb2RlbHMtZ21tLw==).
* Also, you can read about DBSCAN++ here: [DBSCAN++: The Faster and Scalable Alternative to DBSCAN Clustering](https://click.convertkit-mail2.com/r8umlwpn6guoh39dme2t2hd79mn66s7/6qheh8h7399xvpto/aHR0cHM6Ly93d3cuZGFpbHlkb3Nlb2Zkcy5jb20vZGJzY2FuLXRoZS1mYXN0ZXItYW5kLXNjYWxhYmxlLWFsdGVybmF0aXZlLXRvLWRic2Nhbi1jbHVzdGVyaW5nLw==).

👉 Over to you: What are some other ways to evaluate clustering performance in such situations?



---
## ✅ Action Items
