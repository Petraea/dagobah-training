# Galaxy Administrators Course

dagobah - The Solar System for Galaxy Training
> "The planet shown in Dagobah, in the Sluis sector, is a world of murky swamps, steaming bayous, and petrified forests."

---
**Melbourne - 6th to 9th February 2017**

[Event Logisitics]() | [Admin Training Home Page]()

jump to [Monday](#monday) | [Tuesday](#tuesday) | [Wednesday](#wednesday) | [Thursday](#thursday)

Built slides have [an index](https://gvlproject.github.io/dagobah-training/).

### Instructors

* (N)ate Coraor - Galaxy Project, BMB, Penn State University, USA
* (S)imon Gladman - VLSCI, University of Melbourne, Australia
* (E)nis Afgan - Galaxy Project, Department of Biology, Johns Hopkins University, USA
* (B)jörn Grüning - Fribourg, Germany
* (R)oss Lazarus - Galaxy Legend - IDI Baker Institute, Australia.

## Timetable
### Basic Sessions
#### Monday
**6th February** - [TBC](https://www.carltonconnect.com.au/our-community/lab-14/)

| **Time** | **Topic** | **Links** | **Instructor** |
| -------- | --------- | --------- | ----------- |
| 09:15 | Check-in |  |  |
| 09:30 | Welcome and Introduction | [Slides](https://martenson.github.io/dagobah-training/00-intro/intro.html) | All |
| 09:45 | Deployment and Platform Options | [Slides](https://martenson.github.io/dagobah-training/01-deployment-platforms/choices.html) | (N) |
| 10:15 | Get a Basic Galaxy Server Up and Running | [Slides](https://martenson.github.io/dagobah-training/02-basic-server/get-galaxy.html) | (N + M) |
| 11:00 | **Morning Break** | | |
| 11:20 | Database choices and configuration. Introduction to PostgreSQL | [Slides](https://martenson.github.io/dagobah-training/03-databases/databases.html), [Exercise](intro/03-databases/ex1-postgres.md) | (N + M) |
| 12:20 | **Lunch**, *catered* | | |
| 13:20 | Web server choices and configuration. Introduction to Apache and NGINX. | [Slides](https://martenson.github.io/dagobah-training/04-web-servers/webservers.html), [Exercise 1](https://github.com/martenson/dagobah-training/blob/master/intro/04-web-servers/ex1-apache.md), [Exercise 2](https://github.com/martenson/dagobah-training/blob/master/intro/04-web-servers/ex2-nginx.md) | (N) |
| 14:20 | Introduction to the Galaxy Tool Shed: Identifying and installing well-defined tools | [Slides (Shed)](https://martenson.github.io/dagobah-training/05-tool-shed/shed_intro.html), [Slides (Tools)](https://martenson.github.io/dagobah-training/05-tool-shed/tool_installation.html), [Slides (Dependencies)](https://martenson.github.io/dagobah-training/05-tool-shed/tool-dependencies.html), [Exercise](intro/05-tool-shed/ex-tool-management.md)| (M) |
| 15:30 | **Afternoon Break** | | |
| 15:50 | Defining and importing genomes, Data Managers | [Slides](https://martenson.github.io/dagobah-training/06-reference-genomes/reference_genomes.html), [Exercise](intro/06-reference-genomes/ex06_reference_genomes.md) | (S) |
| 17:40 | **Dinner**, *on your own* |  |  |
| 19:00 | Discussion, troubleshooting, ad hoc support |  | All |
| 20:30 | Close Day 1 | | All |

#### Tuesday
**7th February** - [TBC](https://www.carltonconnect.com.au/our-community/lab-14/)

| **Time** | **Topic** | **Links** | **Instructor** |
| -------- | --------- | --------- | ----------- |
| 09:15 | Check-in |  |  |
| 09:30 | Welcome and Questions |  | All |
| 09:45 | Extending your installation: FTP, SMTP, and more| [Slides](https://martenson.github.io/dagobah-training/07-extending-installation/extending.html) | (D) |
| 11:00 | **Morning Break** | | |
| 11:20 | Users, Groups, and Quotas | [Slides](https://martenson.github.io/dagobah-training/08-users-groups-quotas/users-groups-quotas.html) | (D) |
| 12:20 | **Lunch**, *catered* | | |
| 13:20 | Anatomy of a Tool Definition, Planemo, Publishing | [Slides](https://martenson.github.io/dagobah-training/09-tool-basics/tool-basics.html) | (S + M) |
| 14:50 | Updating tools and supporting multiple versions of tools | [Exercise](intro/05-tool-shed/ex-tool-management.md) | (S + M) |
| 15:20 | **Afternoon Break** | | |
| 15:40 | Upgrading to a new Galaxy release | [Slides](https://martenson.github.io/dagobah-training/10-upgrading-release/upgrading.html) | (N + M) |
| 16:50 | When things go wrong: Basic Galaxy server troubleshooting | [Slides](https://martenson.github.io/dagobah-training/11-basic-troubleshooting/basic-troubleshooting.html) | (N + M) |
| 17:40 | **Dinner**, *catered* |  |  |
| 19:00 | Introduction to Galaxy Architecture (Joint session with the Advanced Topics session) | [Slides](https://martenson.github.io/dagobah-training/12-architecture/galaxy_architecture.html) | All |
| 20:20 | Wrap up and close | | All |

### Advanced Sessions

#### Wednesday
**8th February** - [TBC](https://www.carltonconnect.com.au/our-community/lab-14/)

| **Time** | **Topic** | **Links** | **Instructor** |
| -------- | --------- | --------- | ----------- |
| 08:30 | Check-in  |  |  |
| 09:00 | Welcome and Introduction/Questions |  | All |
| 09:20 | Configuration management choices: Introduction to Ansible | [Slides](https://martenson.github.io/dagobah-training/001-ansible/ansible-introduction.html), [Exercise](https://github.com/martenson/dagobah-training/blob/master/advanced/001-ansible/ex1-intro-ansible.md) | (S) |
| 09:50 | Using Ansible to deploy Galaxy I |  [Exercise](https://github.com/martenson/dagobah-training/blob/master/advanced/001-ansible/ex2-galaxy-ansible.md)| (S) |
| 10:30 | **Morning Break** | | |
| 10:50 | Using Ansible to deploy Galaxy II | [uWSGI slides](https://martenson.github.io/dagobah-training/002-monitoring-maintenance/uwsgi.html) | (S + N) |
| 12:20 | **Lunch**, *catered* | | |
| 13:20 | Server monitoring and maintenance: Admin UI, Log files, Direct database queries, Command line & scripts, What to backup and how | [Slides](https://martenson.github.io/dagobah-training/002-monitoring-maintenance/monitoring-maintenance.html) | (S + N) |
| 15:20 | **Afternoon Break** | | |
| 15:40 | Controlling Galaxy with systemd and supervisor | [Slides](https://martenson.github.io/dagobah-training/002a-systemd-supervisor/systemd-supervisor.html), [Exercise](https://github.com/martenson/dagobah-training/blob/master/advanced/002a-systemd-supervisor/ex1-supervisor.md) | (N) |
| 16:10 | Advanced tool definition, tool failures, tool debugging | [Slides](https://martenson.github.io/dagobah-training/003-tools-advanced/tools-advanced.html) | (M) |
| 17:40 | **Dinner**, *on your own* |  |  |
| 19:00 | Discussion, troubleshooting, ad hoc support |  | All |
| 20:30 | Close day 1 | | All |

#### Thursday
**9th February** - [TBC](https://www.carltonconnect.com.au/our-community/lab-14/)

| **Time** | **Topic** | **Links** | **Instructor** |
| -------- | --------- | --------- | ----------- |
| 08:30 | Check-in |  |  |
| 09:00 | Welcome and Introduction/Questions |  | All |
| 09:20 | Using and configuring external authentication services | [Slides](https://martenson.github.io/dagobah-training/004-external-auth/external-auth.html), [Exercise](https://github.com/martenson/dagobah-training/blob/master/advanced/004-external-authentication/ex1-pam-auth.md) | (M + N) |
| 10:30 | **Morning Break** | | |
| 10:50 | Connecting Galaxy to a compute cluster I | [Slides](https://martenson.github.io/dagobah-training/005-compute-cluster/compute-cluster.html), [Exercise 1](https://github.com/martenson/dagobah-training/blob/master/advanced/005-compute-cluster/ex1-slurm.md), [Exercise 2](https://github.com/martenson/dagobah-training/blob/master/advanced/005-compute-cluster/ex2-advanced-job-configs.md) | (N) |
| 12:20 | **Lunch**, *on your own* | | |
| 13:20 | Connecting Galaxy to a compute cluster II |  | (N) |
| 15:20 | **Afternoon Break** | | |
| 15:40 | Using Heterogeneous compute resources | [Slides](https://martenson.github.io/dagobah-training/005-compute-cluster/heterogeneous.html), [Exercise](https://github.com/martenson/dagobah-training/blob/master/advanced/005-compute-cluster/ex3-pulsar.md) | (N) |
| 17:40 | **Dinner**, *on your own* |  |  |
| 19:00 | Using public and private cloud compute resources | [Slides](https://martenson.github.io/dagobah-training/006-clouds/clouds.html) | (S) |
| 20:30 | Close day 2 | | All |


| **Time** | **Topic** | **Links** | **Instructor** |
| -------- | --------- | --------- | ----------- |
| 08:30 | Check-in |  |  |
| 09:00 | Welcome and Introduction/Questions |  | All |
| 09:20 | Storage management and using heterogeneous storage services | [Slides](https://martenson.github.io/dagobah-training/007-storage/storage.html), [Exercise](https://github.com/martenson/dagobah-training/blob/master/advanced/007-storage-management/ex1-objectstore.md) | (N + M) |
| 10:30 | **Morning Break** | | |
| 10:50 | Complex Galaxy servers examples: usegalaxy.org, GVL | [Slides (usegalaxy.org)](https://martenson.github.io/dagobah-training/008-main-galaxy/usegalaxy.html), [Slides (GVL)](https://docs.google.com/presentation/d/1Fm0H-Lg5vHeIhqKIFh8cI69lZMh2C4urMSEPrmgd_Wo/pub?start=false&loop=false&delayms=3000) | (N + S) |
| 12:20 | **Lunch**, *on your own* | | |
| 13:20 | When things go REALLY wrong: Advanced Galaxy server troubleshooting | [Slides](https://martenson.github.io/dagobah-training/009-advanced-troubleshooting/troubleshooting.html#1) | (N) |
| 15:20 | **Afternoon Break** | | |
| 15:50 | Participant selected topics | [Interactive Environments: Jupyter](https://gist.github.com/natefoo/73bdcd9d467efd8d333ec15719e71108) | All |
| 17:30 | **Dinner**, *catered* |  |  |
| 18:50 | Discussion and open questions |  | All |
| 20:30 | Wrap up and close | | All |
