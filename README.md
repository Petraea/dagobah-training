![gatc2017_logo.png](docs/shared-images/gatc2017_logo.png)

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
* (B)jörn Grüning - Head of Freiburg Galaxy Team, University of Freiburg, Germany
* (R)oss Lazarus - Galaxy Project and formerly of Baker IDI, Australia.

## Timetable
#### Monday
**6th February** - [Lab 14 Seminar Room, 700 Swanston St, Carlton, Victoria](https://goo.gl/maps/FD2cdrFeDfG2)

| **Time** | **Topic** | **Links** | **Instructor** |
| -------- | --------- | --------- | ----------- |
| 08:30 | Registration |  |  |
| 09:15 | Welcome and introduction | [Slides](https://gvlproject.github.io/dagobah-training/00-intro/intro.html) | All |
| 09:30 | Deployment and platform options | [Slides](https://gvlproject.github.io/dagobah-training/01-deployment-platforms/choices.html) | (N) |
| 10:00 | Get a basic Galaxy server up and running | [Slides](https://gvlproject.github.io/dagobah-training/02-basic-server/get-galaxy.html) | (N) + (E)?) |
| 10:45 | **Morning break** | | |
| 11:00 | Galaxy server optional necessities: PostgreSQL and NGINX | [PostgreSQL Slides](https://gvlproject.github.io/dagobah-training/03-databases/databases.html), [PostgreSQL Exercise](intro/03-databases/ex1-postgres.md)  [NGINX/Apache Slides](https://gvlproject.github.io/dagobah-training/04-web-servers/webservers.html), [NGINX Exercise](https://github.com/gvlproject/dagobah-training/blob/master/intro/04-web-servers/ex2-nginx.md) [Apache Exercise](https://github.com/gvlproject/dagobah-training/blob/master/intro/04-web-servers/ex1-apache.md) (for reference)| (N) + (E) |
| 12:15 | **Lunch** | | |
| 13:00 | Galaxy server optional necessities (continued)| | |
| 13:45 | Introduction to the Galaxy Tool Shed: Identifying and installing well-defined tools | [Slides (Shed)](https://gvlproject.github.io/dagobah-training/05-tool-shed/shed_intro.html), [Slides (Tools)](https://gvlproject.github.io/dagobah-training/05-tool-shed/tool_installation.html), [Slides (Dependencies)](https://gvlproject.github.io/dagobah-training/05-tool-shed/tool-dependencies.html), [Exercise](intro/05-tool-shed/ex-tool-management.md)| (B) |
| 15:00 | **Afternoon break** | | |
| 15:15 | Defining and importing genomes, Data Managers | [Slides](https://gvlproject.github.io/dagobah-training/06-reference-genomes/reference_genomes.html), [Exercise](intro/06-reference-genomes/ex06_reference_genomes.md) | (S) |
| 16:50 | Extending your installation: FTP, SMTP, and more | [Slides](https://gvlproject.github.io/dagobah-training/07-extending-installation/extending.html) | (N) |
| 18:00 | Close Day 1 | | All |

#### Tuesday
**7th February** - [Lab 14 Seminar Room, 700 Swanston St, Carlton, Victoria](https://goo.gl/maps/FD2cdrFeDfG2)

| **Time** | **Topic** | **Links** | **Instructor** |
| -------- | --------- | --------- | ----------- |
| 09:00 | Welcome and questions |  | All |
| 09:15 | Users, Groups, and Quotas | [Slides](https://gvlproject.github.io/dagobah-training/08-users-groups-quotas/users-groups-quotas.html) | (S) |
| 10:30 | Updating tools and supporting multiple versions of tools | [Exercise](intro/05-tool-shed/ex-tool-management.md) | (B) |
| 11:00 | **Morning break** | | |
| 11:15 | Upgrading to a new Galaxy release | [Slides](https://gvlproject.github.io/dagobah-training/10-upgrading-release/upgrading.html) | (E) + (R)? |
| 12:30 | **Lunch** | | |
| 13:15 | Improving the web serving experience with uWSGI | [uWSGI slides](https://gvlproject.github.io/dagobah-training/002-monitoring-maintenance/uwsgi.html) | (N) |
| 14:30 | Server monitoring and maintenance I: Admin UI, Log files, Direct database queries | [Slides](https://gvlproject.github.io/dagobah-training/002-monitoring-maintenance/monitoring-maintenance.html) | (S) + (N) |
| 15:15 | **Afternoon break** | | |
| 15:30 | Server monitoring and maintenance II : Command line & scripts, What to backup and how | | (S) + (N) |
| 16:15 | Using and configuring external authentication services | [Slides](https://gvlproject.github.io/dagobah-training/004-external-auth/external-auth.html), [Exercise](https://github.com/gvlproject/dagobah-training/blob/master/advanced/004-external-authentication/ex1-pam-auth.md) | (N) |
| 17:45 | Questions and ad-hoc troubleshooting | | All |
| 18:00 | Close Day 2 | | All |

#### Wednesday
**8th February** - [Lab 14 Seminar Room, 700 Swanston St, Carlton, Victoria](https://goo.gl/maps/FD2cdrFeDfG2)

| **Time** | **Topic** | **Links** | **Instructor** |
| -------- | --------- | --------- | ----------- |
| 09:00 | Welcome and questions |  | All |
| 09:15 | Configuration management choices: Introduction to Ansible | [Slides](https://gvlproject.github.io/dagobah-training/001-ansible/ansible-introduction.html), [Exercise](https://github.com/gvlproject/dagobah-training/blob/master/advanced/001-ansible/ex1-intro-ansible.md) | (S) |
| 10:00 | Using Ansible to deploy Galaxy I |  [Exercise](https://github.com/gvlproject/dagobah-training/blob/master/advanced/001-ansible/ex2-galaxy-ansible.md)| (S) |
| 10:30 | **Morning break** | | |
| 10:45 | Using Ansible to deploy Galaxy II |  | (S) + (N) |
| 12:20 | **Lunch** | | |
| 13:05 | Controlling Galaxy with systemd and supervisor | [Slides](https://gvlproject.github.io/dagobah-training/002a-systemd-supervisor/systemd-supervisor.html), [Exercise](https://github.com/gvlproject/dagobah-training/blob/master/advanced/002a-systemd-supervisor/ex1-supervisor.md) | (N) |
| 14:30 | Connecting Galaxy to a compute cluster I | [Slides](https://gvlproject.github.io/dagobah-training/005-compute-cluster/compute-cluster.html), [Exercise 1](https://github.com/gvlproject/dagobah-training/blob/master/advanced/005-compute-cluster/ex1-slurm.md), [Exercise 2](https://github.com/gvlproject/dagobah-training/blob/master/advanced/005-compute-cluster/ex2-advanced-job-configs.md) | (N)|
| 15:30 | **Afternoon break** | | |
| 15:45 | Connecting Galaxy to a compute cluster II |  | (N) |
| 16:30 | Using heterogeneous compute resources | [Slides](https://gvlproject.github.io/dagobah-training/005-compute-cluster/heterogeneous.html), [Exercise](https://github.com/gvlproject/dagobah-training/blob/master/advanced/005-compute-cluster/ex3-pulsar.md) | (N) |
| 17:30 | Using public and private cloud compute resources | [Slides](https://gvlproject.github.io/dagobah-training/006-clouds/clouds.html) | (E) |
| 18:00 | Close day 3 | | All |

**We will most likely all go out for dinner together somewhere local tonight**

#### Thursday
**9th February** - [Lab 14 Seminar Room, 700 Swanston St, Carlton, Victoria](https://goo.gl/maps/FD2cdrFeDfG2)

| **Time** | **Topic** | **Links** | **Instructor** |
| -------- | --------- | --------- | ----------- |
| 09:00 | Welcome and questions |  | All |
| 09:15 | Storage management and using heterogeneous storage services | [Slides](https://gvlproject.github.io/dagobah-training/007-storage/storage.html), [Exercise](https://github.com/gvlproject/dagobah-training/blob/master/advanced/007-storage-management/ex1-objectstore.md) | (N) |
| 10:30 | **Morning break** | | |
| 10:50 | Containerize all the things: Galaxy in Docker and Docker in Galaxy | | (B) |
| 12:30 | **Lunch** | | |
| 13:15 | Running Jupyter in Galaxy with Galaxy Interactive Environments | [Slides + Exercise](https://gist.github.com/natefoo/73bdcd9d467efd8d333ec15719e71108) | (B) + (N) |
| 14:30 | When things go wrong: Galaxy Server Troubleshooting I | [Slides](https://gvlproject.github.io/dagobah-training/11-basic-troubleshooting/basic-troubleshooting.html)| (N) |
| 15:30 | **Afternoon break** | | |
| 15:45 | When things go REALLY wrong: Galaxy Server Trobuleshooting II |  [Slides](https://gvlproject.github.io/dagobah-training/009-advanced-troubleshooting/troubleshooting.html#1) | |
| 16:45 | Galaxy server architecture | [Slides](https://gvlproject.github.io/dagobah-training/12-architecture/galaxy_architecture.html) | | 
| 18:00 | Wrap up and close | | All |
