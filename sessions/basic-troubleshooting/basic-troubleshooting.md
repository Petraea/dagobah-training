layout: true
class: inverse, middle, large

---
class: special
# Basic Galaxy Troubleshooting

slides by @martenson, @natefoo

.footnote[\#usegalaxy / @galaxyproject]

---
class: larger

## Please Interrupt!

We like your questions.

---
# Database migration

In case you see database migration errors during startup you can:

* Check DB table `migrate_version` column `version`.
* Check folder `lib/galaxy/model/migrate/versions/` - the latest migration should match the DB.
* Clean the `*.pyc` files to make sure there is no remnant from other code revisions.
  * Something like `$ find lib -name "*.pyc" -delete` should work.

---
# Mako templates

In case you see page inconsistencies or template errors in logs.

* Clean the `*.pyc` files to make sure there is no remnant from other code revisions.
  * Something like `$ find database/compiled_templates name "*.pyc" -delete`.

---
# Client build

In case your javascript/css local changes are not visible.

* JavaScript files are located in `client/galaxy/scripts`.
* CSS files are in `client/galaxy/style/`.
* Check `client/README.md` for details regarding client build.
* Run `$ make client` from root folder.
  * You can also check the `Makefile` in root for other useful targets.

???
* This should only matter when you modify some of the Galaxy's static assets.
* Does not affect javascript or style in mako templates.

---
class: normal
# Missing tools

* Restart Galaxy and watch the log for
```shell
Loaded tool id: toolshed.g2.bx.psu.edu/repos/iuc/sickle/sickle/1.33, version: 1.33 into tool panel....
```

* Check `integrated_tool_panel.xml` for
```xml
<tool id="toolshed.g2.bx.psu.edu/repos/iuc/sickle/sickle/1.33" />
```

* If it is TS tool check `config/shed_tool_conf.xml` for
```xml
<tool file="toolshed.g2.bx.psu.edu/repos/iuc/sickle/43e081d32f90/sickle/sickle.xml" guid="toolshed.g2.bx.psu.edu/repos/iuc/sickle/sickle/1.33">
...
</tool>
```

---
class: smaller
# Jobs aren't running (always gray)

Check the Galaxy server log for errors. Successful job lifecycle:

```console
galaxy.jobs DEBUG 2016-11-03 20:11:54,897 (2) Working directory for job is: /home/galaxyguest/galaxy/database/jobs_directory/000/2
galaxy.jobs.handler DEBUG 2016-11-03 20:11:54,903 (2) Dispatching to local runner
galaxy.jobs DEBUG 2016-11-03 20:11:54,939 (2) Persisting job destination (destination id: local:///)
galaxy.jobs.runners DEBUG 2016-11-03 20:11:55,205 Job [2] queued (301.934 ms)
galaxy.jobs.handler INFO 2016-11-03 20:11:55,238 (2) Job dispatched
galaxy.jobs.command_factory INFO 2016-11-03 20:11:55,702 Built script [/home/galaxyguest/galaxy/database/jobs_directory/000/2/tool_script.sh] for ...
galaxy.jobs.runners DEBUG 2016-11-03 20:11:56,395 (2) command is: mkdir -p working; cd working; ...
galaxy.jobs.runners.local DEBUG 2016-11-03 20:11:56,410 (2) executing job script: /home/galaxyguest/galaxy/database/jobs_directory/000/2/galaxy_2.sh
galaxy.jobs DEBUG 2016-11-03 20:11:56,424 (2) Persisting job destination (destination id: local:///)
galaxy.jobs.runners.local DEBUG 2016-11-03 20:11:59,665 execution finished: /home/user/galaxy/database/jobs_directory/000/2/galaxy_2.sh
galaxy.model.metadata DEBUG 2016-11-03 20:11:59,821 loading metadata from file for: HistoryDatasetAssociation 2
galaxy.jobs INFO 2016-11-03 20:12:00,577 Collecting metrics for Job 2
galaxy.jobs DEBUG 2016-11-03 20:12:00,872 job 2 ended (finish() executed in (1206.709 ms))
galaxy.model.metadata DEBUG 2016-11-03 20:12:00,891 Cleaning up external metadata files
```

---
# Jobs aren't running -  gray (!)

Not yet picked up by the Galaxy job handler subsystem

Solutions:
- If single or multiprocess
  - Ensure that handler ID(s) in `job_conf.xml` match `--server-name`(s)
- If multiprocess, check to ensure that your job handler(s) are running
  - If yes, restart handler(s)

---
# Jobs aren't running - gray clock

A handler has seen this job

Verify concurrency limits unmet in `job_conf.xml`:
- Local jobs: value of plugin `workers` attribute (default: 4)
- Entire `<limits>` section

Exceeding disk quota also pauses jobs, but users are notified of this.

---
# Jobs aren't running - gray clock

Check database for:
- State
- Destination id assigned?
- Jobs owned by user in non-terminal state if limits in use

---
# Jobs aren't finishing - yellow

The tool/dependency is no longer executing but the job is still "running"

Solutions:
- Check cluster (advanced) for job
- Check last log message for job
- Setting/collecting metadata can be slow: wait
- Check handlers as with gray (!)

---
# Quota not being updated for a certain user

In the Admin/Users menu you can run `Recalculate Disk Usage` on a certain user.

There is also a command line version: `scripts/set_user_disk_usage.py`

![Recalculate Disk Usage Option](images/admin_recalc_usage.png)

---
class: special
# Tool errors

Tools can fail for a variety of reasons, some valid, some invalid.

Some made up examples follow.

---
# Tool errors - stderr

Tool stderr contains:
```shell
Warning: File /galaxy/job/working/foo.tmp created in the future!
```

The system running the job has an incorrect clock, this does not affect the correctness of results.

Solutions:
- Fix the clock
- If the wrapped tool uses proper exit codes, use `<tool profile="16.04">` to ignore stderr

---
# Tool errors - stderr

Tool stderr contains:
```shell
Warning: Discarded 10000 lines of /path/to/input/dataset_1.dat because they looked funny
```

Maybe a problem, maybe not.

Solutions:
- Check tool input(s) and parameters
- Verify input is not corrupt
- If behavior is expected and the tool uses proper exit codes, use `<tool profile="16.04">` to ignore stderr

---
# Tool errors - memory errors

Tool stderr contains one of:
```shell
MemoryError                 # Python
what():  std::bad_alloc     # C++
Segmentation Fault          # C - but could be other problems too
Killed                      # Linux OOM Killer
```

Solutions:
- Change input sizes or params
  - Map/reduce?
- Decrease the amount of memory the tool needs
- Increase the amount of memory available to the job
  - Stop other jobs
  - Add memory
  - Cluster (advanced)
- Cross your fingers and rerun the job

---
# Tool errors - system errors

Tool stderr contains:
```shell
open(): /path/to/input/dataset_1.dat: No such file or directory
```

Verify that `dataset_1.dat` exists.

Solution:
- Fix the filesystem error (NFS?) and rerun the job

---
# Tool errors - dependency problems

Tool stderr contains:
```shell
sh: command not found: samtools
```

Solutions:
- If this is the upload tool and the missing command is really `samtools`
  - install `samtools` on `$PATH` or `<tool_dependencies_dir>/samtools/default`
- Else
  - Verify that tool dependencies are properly installed
  - Verify that `tool_dependency_dir` is accessible

---
# Tool errors - dependency problems

Tool stderr contains:
```shell
foo: /lib/x86_64-linux-gnu/libc.so.6: version 'GLIBC_2.23' not found (required by foo)
```

`foo` was compiled against Glibc 2.23 but Glibc < 2.23 is installed.

Solutions:
- Verify that tool dependencies were properly installed
- Recompile `foo` on the "oldest" system on which it might run

---
# Tool errors - dependency problems

Tool stderr contains:
```shell
foo: error while loading shared libraries: libhitch.so.42: cannot open shared object file: No such file or directory
```

`foo` was compiled against `libhitch.so.42` but it's not on the runtime linker path

Solutions:
- Verify that tool dependencies were properly installed
- Modify dependency's `env.sh` to set `$LD_LIBRARY_PATH` as appropriate
- Install `libhitch` on target system
- Recompile `foo` with `-Wl,-rpath=/path/to/libhitch/dir`
- Recompile `foo` without `-lhitch` (if possible)

---
# Tool errors - Empty green history item

1. The tool is not correctly detecting error conditions: stderr, exit code?
2. The tool correctly produced an empty dataset for the given params, inputs

Solutions:
1. Fix the tool wrapper to detect errors
2. User education

---
# One last word on tool errors

All Devteam/IUC tools have tests

Use these tests to verify that the tool works in the basic case

If yes:
- Input/parameter problem
- Tool wrapper bug
- Tool bug
- Resource problem (sysadmin problem)
If no:
- Sysadmin problem

---
# Where to get help

- [Galaxy Biostar](https://biostar.usegalaxy.org/)
- [galaxy-dev Mailing list](http://dev.list.galaxyproject.org/)
- [IRC](https://wiki.galaxyproject.org/Support/IRC): \#galaxyproject on Freenode
- [Wiki: Support](https://wiki.galaxyproject.org/Support)
