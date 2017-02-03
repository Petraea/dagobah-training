![GATC Logo](../../docs/shared-images/gatc2017_logo_150.png) ![galaxy logo](../../docs/shared-images/galaxy_logo_25percent_transparent.png)

### GATC - 2017 - Melbourne

# Run Galaxy with uWSGI - Exercise.

#### Authors: Nate Coraor, Simon Gladman. 2017

## Introduction

uWSGI serves as a more powerful, performant, and fault tolerant replacement to the pure-Python "Paste" http server that Galaxy comes with. uWSGI will soon be the default web server for Galaxy, but in the meantime, production servers should switch to uWSGI on their own.

## Section 1 - Installation and basic configuration

You can install uWSGI in one of two ways:

1. From the system package manager, e.g. `apt install uwsgi uwsgi-plugin-python`
2. Directly into Galaxy's `virutalenv` using `pip`<sup>[1]</sup>

We'll use the system package manager method, but either method is fine.

```console
$ sudo apt install uwsgi uwsgi-plugin-python
```

<sup>1. It is worth noting that Debian splits uWSGI plugins into an array of individual packages. When installing from `pip`, the entire application with all its standard plugins is built and installed.</sup>

## Section 2 - Configure uWSGI

We'll use uWSGI's "Paste Deploy" support to configure uWSGI with just a few small modifications to `galaxy.ini`. Begin by opening `galaxy.ini` in your editor:

```console
$ sudo -e /srv/galaxy/config/galaxy.ini
```

And add the following section (the easiest place to put it is *above* the `[server:main]` section, which will now be unused):

```ini
[uwsgi]
processes = 2
threads = 2
socket = 127.0.0.1:4001     # uwsgi protocol for nginx
pythonpath = lib
master = True
logto = /srv/galaxy/log/uwsgi.log
```

Then, save and quit your editor.

## Section 3 - Define job handlers

So far, Galaxy has used a default job configuration. We need to modify this to prevent uWSGI-managed Galaxy server processes from attempting to run jobs. Begin by making a copy of the sample configuration, then editing it:

```console
$ sudo -u galaxy cp /srv/galaxy/server/config/job_conf.xml.sample_basic /srv/galaxy/config/job_conf.xml
$ sudo -e /srv/galaxy/config/job_conf.xml
```

Locate the `<handlers>` block and change it to define two handlers with the IDs `handler0` and `handler1`. The default ID of `main` is also the default ID of Galaxy servers started under Paste or uWSGI. We've also defined a "tag", which is equivalent to a group. The `<handlers>` block should look like this:

```xml
    <handlers default="handlers">
        <handler id="handler0" tags="handlers"/>
        <handler id="handler1" tags="handlers"/>
    </handlers>
```

Then, save and quit your editor.

Next, we need to instruct Galaxy as to the location of the job configuration file. This is done in `galaxy.ini`. Edit it with:

```console
$ sudo -e /srv/galaxy/config/galaxy.ini
```

Locate and set `job_config_file` accordingly:

```ini
job_config_file = /srv/galaxy/config/job_conf.xml
```

Then, save and quit your editor.

## Section 4 - Configure nginx and test

**Part 1 - Configure nginx**

nginx is currently configured to communicate with Galaxy using the http protocol on port 8080. We need to change this to communicate using uWSGI protocol on port 4001, as we configured in the `[uwsgi]` section above. To do this, we need to return to the nginx configs we worked on in the nginx session:

```console
$ sudo -e /etc/nginx/sites-available/galaxy
```

Locate the `location / { ... }` block and comment out the `proxy_*` directives within, and adding new directives:

```nginx
    location / {
        #proxy_pass          http://galaxy;
        #proxy_set_header    X-Forwarded-Host $host;
        #proxy_set_header    X-Forwarded-For  $proxy_add_x_forwarded_for;
        uwsgi_pass           127.0.0.1:4001;
        include              uwsgi_params;
    }
```

Then, save and quit your editor. Restart nginx with:

```console
$ sudo systemctl restart nginx
```

**Part 2 - Run Galaxy with uWSGI**

If you are still running Galaxy, stop it with `CTRL+C` followed by `sudo -Hu galaxy galaxy` or `sudo -Hu galaxy galaxy --stop-daemon && sudo -Hu galaxy galaxy --daemon`. Then, start it up under uWSGI with:

```console
$ sudo -Hu galaxy sh -c 'cd /srv/galaxy/server && uwsgi --plugin python --virtualenv /srv/galaxy/venv --ini-paste /srv/galaxy/config/galaxy.ini'
```

Galaxy should now be available at `http://<your_ip>/`

Starting uWSGI this way is a bit tedious. In addition, your job handlers aren't running yet. We'll solve both of these problems in the next section using *supervisor*.

## Further reading

- [uWSGI docs](http://uwsgi-docs.readthedocs.org/)
- [Galaxy uWSGI docs](https://wiki.galaxyproject.org/Admin/Config/Performance/Scaling#uWSGI)
