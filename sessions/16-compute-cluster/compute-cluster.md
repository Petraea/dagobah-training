layout: true
class: inverse, top, large

---
class: special
# Connecting Galaxy to a compute cluster

slides by @natefoo

.footnote[\#usegalaxy / @galaxyproject]

---
# Why cluster?

Running jobs on the Galaxy server negatively impacts Galaxy UI performance

Even adding one other host helps

Can restart Galaxy without interrupting jobs

---
# Cluster options

- Slurm
- Condor
- Torque
- PBS Pro
- LSF
- SGE derivatives maybe?
- Any other [DRMAA](https://www.drmaa.org/)-supported DRM

---
class: smaller
# Cluster library stack

```
╔═════════════════════════════════════════════════════╗
║ Galaxy Job Handler (galaxy.jobs.handler)                       ║
╟─────────────────────────────────────────────────────╢
║ Galaxy DRMAA Job Runner (galaxy.jobs.runners.drmaa)            ║
╠─────────────────────────────────────────────────────╢
║ Pulsar DRMAA Interface (pulsar.managers.util.drmaa)            ║
╠═════════════════════════════════════════════════════╣
║ DRMAA Python                                                   ║
╠═════════════════════════════════════════════════════╣
║ C DRMAA Library (PSNC, vendor)                                 ║
╠═════════════════════════════════════════════════════╣
║ DRM (Slurm, Condor, ...)                                       ║
╚═════════════════════════════════════════════════════╝

```

---
# Exercise

[Running Galaxy jobs with Slurm](https://github.com/gvlproject/dagobah-training/blob/master/sessions/16-compute-cluster/ex1-slurm.md)

---
# Shared Filesystem

Our simple example works because of two important principles:

1. Some things are located *at the same path* on Galaxy server and node(s)
  - Galaxy application (`/srv/galaxy/server`)<sup>[1]</sup>
  - Tool dependencies<sup>[1]</sup>
2. Some things *are the same* on Galaxy server and node(s)
  - Job working directory
  - Input and output datasets

The first can be worked around with symlinks or Pulsar embedded (later)

The second can be worked around with Pulsar REST/MQ (with a performance/throughput penalty)

.footnote[<sup>[1]</sup> A fix for this has been proposed

<sup>[2]</sup> Except conda dependencies!]

---
# Non-shared Galaxy

If Galaxy server is at `/srv/galaxy/server`, nodes must find it there too. Solutions:
- Node-local Galaxy at same path
- Node-local Galaxy at different path w/ symlink at `/srv/galaxy/server`
- Network filesystem Galaxy w/ symlink (usegalaxy.org uses CVMFS)
  - Can be different network FS server from Galaxy datasets
- Use embedded Pulsar to rewrite paths before job submission

---
# One interesting hybrid solution

Galaxy server as network FS server for application

Other server as network FS for datasets, job dirs, dependencies

Benefits:
- Better UI performance when not running from NFS
- Job IO does not affect Galaxy UI

Drawbacks:
- Slower dataset IO on Galaxy server

---
# Multiprocessing

Some tools can greatly improve performance by using multiple cores

Galaxy automatically sets `$GALAXY_SLOTS` to the CPU/core count you specify when submitting, for example, 4:
- Slurm: `sbatch --ntasks=4`
- SGE: `qsub -pe threads 4`
- Torque/PBS Pro: `qsub -l nodes=1:ppn=4`
- LSF: ??

Tool configs: Consume `\${GALAXY_SLOTS:-4}`

---
# Memory requirements

No generally consumable environment variable. But for Java tools, be sure to set `-Xmx`, e.g.:

```xml
<destination id="foo" ...>
    <env id="_JAVA_OPTIONS">-Xmx4096m</env>
</destination>
```

---
# Run jobs as the "real" user

If your Galaxy users == System users:
- Submit jobs to cluster as the actual user
- Configurable callout scripts before/after job to change ownership
- Probably requires limited sudo for Galaxy user

See: [Cluster documentation](https://wiki.galaxyproject.org/Admin/Config/Performance/Cluster)

---
# Exercise

Explore different ways to route jobs to different compute resources

[Advanced Galaxy Job Configurations](https://github.com/gvlproject/dagobah-training/blob/master/sessions/16-compute-cluster/ex2-advanced-job-configs.md)
