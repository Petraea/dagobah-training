layout: true
class: inverse, middle, large

---
class: special
# First steps for a "production" Galaxy server

slides by @natefoo

.footnote[\#usegalaxy / @galaxyproject]

---
# Production server

* Used by multiple people
* Designed to be resilient, scalable
* Designed to be easily managed

---
# Major initial decisions

* Where to install Galaxy
* Where to store Galaxy datasets
* Database location

---
# Where to install Galaxy

* Must be at same path on cluster - more on this in cluster sessions
* For this course, `/srv/galaxy/server`

---
# Where to store Galaxy datasets

* Must be at same path on cluster
* Consider future scalability
* For this course, `/srv/galaxy/data`

---
# Best practices

* Run as an **unprivileged user**
* When possible, separate *code* from *data* and *configs*
* Write protect code and configs

---
# Exercise

[Galaxy production first steps - Exercise](https://github.com/gvlproject/dagobah-training/blob/master/sessions/03-production-basics/ex1-first-steps.md)
