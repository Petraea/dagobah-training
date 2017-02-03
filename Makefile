# Location of virtualenv used for development.
VENV?=../galaxy/.venv
IN_VENV=if [ -f $(VENV)/bin/activate ]; then . $(VENV)/bin/activate; fi;

generate-slides:
	rm docs/index.html
	echo "<html><head></head><body>" > docs/index.html
	$(IN_VENV) python slideshow/build_slideshow.py 'Welcome and Introduction' sessions/00-intro/intro.md 00-intro
	$(IN_VENV) python slideshow/build_slideshow.py 'Deployment and Platform Options' sessions/01-deployment-platforms/choices.md 01-deployment-platforms
	$(IN_VENV) python slideshow/build_slideshow.py 'Get Galaxy' sessions/02-basic-server/get-galaxy.md 02-basic-server
	$(IN_VENV) python slideshow/build_slideshow.py 'Production Basics' sessions/03-production-basics/production.md 03-production-basics
	$(IN_VENV) python slideshow/build_slideshow.py 'Galactic Database' sessions/03-production-basics/databases.md 03-production-basics
	$(IN_VENV) python slideshow/build_slideshow.py 'Web Servers' sessions/03-production-basics/webservers.md 03-production-basics
	$(IN_VENV) python slideshow/build_slideshow.py 'Tool Shed' sessions/04-tool-shed/shed_intro.md 04-tool-shed
	$(IN_VENV) python slideshow/build_slideshow.py 'Tool Dependencies' sessions/04-tool-shed/tool-dependencies.md 04-tool-shed
	$(IN_VENV) python slideshow/build_slideshow.py 'Tool Installation' sessions/04-tool-shed/tool_installation.md 04-tool-shed
	$(IN_VENV) python slideshow/build_slideshow.py 'Reference Genomes' sessions/05-reference-genomes/reference_genomes.md 05-reference-genomes
	$(IN_VENV) python slideshow/build_slideshow.py 'Extending Installation' sessions/06-extending-installation/extending.md 06-extending-installation
	$(IN_VENV) python slideshow/build_slideshow.py 'Users, Groups, Quotas' sessions/07-users-groups-quotas/users-groups-quotas.md 07-users-groups-quotas
	$(IN_VENV) python slideshow/build_slideshow.py 'Upgrading & Releases' sessions/08-upgrading-release/upgrading.md 08-upgrading-release
	$(IN_VENV) python slideshow/build_slideshow.py 'uWSGI' sessions/10-uwsgi/uwsgi.md 10-uwsgi
	$(IN_VENV) python slideshow/build_slideshow.py 'Systemd and Supervisor' sessions/11-systemd-supervisor/systemd-supervisor.md 11-systemd-supervisor
	$(IN_VENV) python slideshow/build_slideshow.py 'Monitoring and Maintenance' sessions/12-monitoring-maintenance/monitoring-maintenance.md 12-monitoring-maintenance
	$(IN_VENV) python slideshow/build_slideshow.py 'External Authentication' sessions/13-external-auth/external-auth.md 13-external-auth
	$(IN_VENV) python slideshow/build_slideshow.py 'Ansible and Galaxy - Part 1' sessions/14-ansible/ansible-introduction.md 14-ansible
	$(IN_VENV) python slideshow/build_slideshow.py 'Galaxy Job Configuration' sessions/15-job-conf/job_conf.md 15-job-conf
	#
	$(IN_VENV) python slideshow/build_slideshow.py 'Compute Cluster' advanced/005-compute-cluster/compute-cluster.md 005-compute-cluster
	cp advanced/005-compute-cluster/slurm-wlm-configurator.html docs/005-compute-cluster
	$(IN_VENV) python slideshow/build_slideshow.py 'Heterogeneous Resources' advanced/005-compute-cluster/heterogeneous.md 005-compute-cluster
	$(IN_VENV) python slideshow/build_slideshow.py 'Clouds' advanced/006-cloud/clouds.md 006-clouds
	$(IN_VENV) python slideshow/build_slideshow.py 'Storage Management' advanced/007-storage-management/storage.md 007-storage
	$(IN_VENV) python slideshow/build_slideshow.py 'Complex Galaxy Server Examples' advanced/008-main-galaxy/usegalaxy.md 008-main-galaxy
	$(IN_VENV) python slideshow/build_slideshow.py 'Advanced Troubleshooting' advanced/009-advanced-troubleshooting/troubleshooting.md 009-advanced-troubleshooting
	#
	$(IN_VENV) python slideshow/build_slideshow.py 'Basic Troubleshooting' sessions/basic-troubleshooting/basic-troubleshooting.md basic-troubleshooting
	$(IN_VENV) python slideshow/build_slideshow.py 'Galaxy Architecture' sessions/architecture/galaxy_architecture.md architecture
	$(IN_VENV) python slideshow/build_slideshow.py 'Galaxy Tool Basics' sessions/x01-tool-basics/tool-basics.md x01-tool-basics
	$(IN_VENV) python slideshow/build_slideshow.py 'Advanced Tool Wrapping' sessions/x02-tools-advanced/tools-advanced.md x02-tools-advanced
	echo "</body></html>" >> docs/index.html
