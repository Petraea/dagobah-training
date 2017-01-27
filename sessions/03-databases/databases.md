layout: true
class: inverse, middle, large

---
class: special
# Galactic Database

slides by @martenson

.footnote[\#usegalaxy / @galaxyproject]

---
class: larger

## Please Interrupt!
Your questions are bound to be answered.

---
# Defaults

* Galaxy uses database abstraction layer [SQLAlchemy](http://www.sqlalchemy.org/). This allows for different databases to be plugged in.
* By default Galaxy will automatically create and use [SQLite](https://sqlite.org/) database during first startup.
  * The database is in file `database/universe.sqlite`

---
# Choices

* SQLite
  * Useful for ad-hoc Galaxies or development.
* **PostgreSQL**
  * The recommended standard for anything serious.
* ~~MySQL~~
  * Supported in past but Galaxy is not tested against it anymore.

---
# Configuration

`database_connection` is specified as a connection string in `galaxy.ini` file.
  * default SQLite `sqlite:///./database/universe.sqlite?isolation_level=IMMEDIATE`
  * local PostgreSQL `postgres://<name>:<password>@localhost:5432/galaxy`
  * production example `postgresql:///galaxy?host=/var/run/postgresql`

---
# Tuning - pool

If the server logs errors about not having enough database pool connections.
* `database_engine_option_pool_size = 5` (10 on Main)
* `database_engine_option_max_overflow = 10` (20 on Main)

---
# Tuning - server cursor

If large database query results are causing memory or response time issues in the Galaxy process leave it on server.
* `database_engine_option_server_side_cursors = False` (True on Main, PostgreSQL only, recommended)

---
# Tuning - install database

Galaxy can track Tool Shed data in a separate DB.

```shell
install_database_connection = sqlite:///./database/universe.sqlite?isolation_level=IMMEDIATE
```

This allows bootstrapping fresh Galaxy instances with pretested installs.

???
All other database config options but prefixed with `install_` are also available.

---
# Migrations

The changes in DB model are captured incrementally in form of [atomic scripts](https://github.com/galaxyproject/galaxy/tree/dev/lib/galaxy/model/migrate/versions).

Each script can both upgrade and downgrade a DB.

```shell
$ bash manage_db.sh upgrade
$ bash manage_db.sh downgrade --version=132
```

---
# Access through model

Provided script allows access to Galaxy's database layer **via the Galaxy models**.

```shell
$ python -i scripts/db_shell.py
>>> new_user = User("admin@gmail.com")
>>> new_user.set_password
>>> sa_session.add(new_user)
>>> sa_session.commit()
>>> sa_session.query(User).all()
```

---
# Other Databases

* Reports app is hooked to the Galaxy DB to present data in useful format.
* Tool Shed app has its own database.

---
# Exercise

[Connecting Galaxy to PostgreSQL - Exercise](https://github.com/martenson/dagobah-training/blob/master/intro/03-databases/ex1-postgres.md)
