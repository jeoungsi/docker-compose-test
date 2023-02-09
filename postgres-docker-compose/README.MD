# Quick reference for AIMS Postgresql installation
![logo](https://raw.githubusercontent.com/docker-library/docs/01c12653951b2fe592c1f93a13b4e289ada0e3a1/postgres/logo.png)

-	**Maintained by**:  
	[AIMS Application Group](https://github.com/orgs/solu-m/teams/aims)

-	**Where to get help about Docker**:  
	[the Docker Community Slack](https://dockr.ly/comm-slack)

-	**Official postgresql docker support**:  
	[PostgreSQL Docker hub](https://hub.docker.com/_/postgres)

-	**Official postgresql docker documents full description**:  
	[PostgreSQL Docker README in github ](https://github.com/docker-library/docs/blob/master/postgres/README.md)

-	**PostgreSQL Image Versions**:  
    > postgres:14-alpine [14.6  2023.01.11]

-	**Limitation about this settings**:
	> - This is a reference setting for creating postgresql as docker-compose when using AIMS.  
    > - Not recommended using with the AIMS as a single machine. The AIMS database uses high IOPS.  
	> - Replication Not Set.  
    > - External secrets(memory) needs to set the docker swarm mode.  

# How to use this image

## start up & shutdown docker compose command

```console
# when create & start container
$ docker compose up -d

# when stop container
$ docker compose stop

# when start container
$ docker compose start

# when stop container, and remove container (database DATA remained in host's data folder.)
$ docker compose down
```

There are many docker-compose related commands in [here](https://docs.docker.com/engine/reference/commandline/)

## Initial database creation
After the entrypoint calls initdb to create the default postgres user and database, it will run any *.sql files, run any executable *.sh scripts in container.
This initialization jobs should be run at first time.
```console 
# When container up firstly, create database and user role at database at initialization.
/docker-entrypoint-initdb.d/init.sql

# create postgresql.conf file
/docker-entrypoint-initdb.d/make.conf.sh
```

## Docker Secrets

As an alternative to passing sensitive information via environment variables, `_FILE` may be appended to some of the previously listed environment variables, causing the initialization script to load the values for those variables from files present in the container. In particular, this can be used to load passwords from Docker secrets stored in `/run/secrets/<secret_name>` files.

> Docker Swarm Mode Enabled, remain secrets in memory.
```
$ echo "aims" | docker secret create postgres-passwd -
```
> Docker Swarm Mode Disabled, remain secrets in a host file.
```
postgres-passwd-host:
    file: ./postgres_password.txt
```

## Database Configuration

There are many ways to set PostgreSQL server configuration. For information on what is available to configure, see the [PostgreSQL docs](https://www.postgresql.org/docs/14/runtime-config.html) for the specific version of PostgreSQL that you are running.

Initial `postgresql.conf` file created by `make.conf.sh` script.
After starting the database, a data folder is created and the `postgresql.conf` file is in the folder. Therefore, can modify the `postgresql.conf` file after you create the database.

## Other Docker configurations

It is possible to change the cpu & memory resources. see the [Compose file version 3 reference](https://docs.docker.com/compose/compose-file/compose-file-v3/)
```
# Beware!! It must be changed according to the host machine.
deploy:
  resources:
    limits:
      cpus: '1.00'
	  memory: 500M
```


