# Quick reference for AIMS RabbitMQ Installation
![logo](https://www.rabbitmq.com/img/rabbitmq_logo_strap.png)

-	**Maintained by**:  
	[AIMS Application Group](https://github.com/orgs/solu-m/teams/aims)

-	**Where to get help about Docker**:  
	[the Docker Community Slack](https://dockr.ly/comm-slack)

-	**Official RabbitMQ docker support**:  
	[RabbitMQ Docker hub](https://hub.docker.com/_/rabbitmq)

-	**Official RabbitMQ documentation**:  
	[RabbitMQ Documentation ](https://www.rabbitmq.com/documentation.html)

-	**RabbitMQ Versions**:  
    > rabbitmq:3-management-alpine  
    > RabbitMQ 3.11.6, Erlang 25.2 - 2023.01.12

-	**Limitation about this settings**:
	> - This is a reference setting for creating rabbitmq as docker-compose when using AIMS.  
    > - Not recommended using with the AIMS as a single machine.  
	> - Clustering Not Set.  

# How to use this image

## start up & shutdown docker compose command

```console
# when create & start container
$ docker compose up -d

# when stop container
$ docker compose stop

# when start container
$ docker compose start

# when stop container, and remove container (RabbitMQ DATA remained in host's data folder.)
$ docker compose down
```

There are many docker-compose related commands in [here](https://docs.docker.com/engine/reference/commandline/)

## RabbitMQ Configuration

### rabbitmq.conf

There are many properties to set RabbitMQ server configuration. For information on what is available to configure, see the [RabbitMQ doc](https://www.rabbitmq.com/configure.html).

### default user creation
The default_user and default_password are only affect when initial RabbitMQ data folder creation.

### ssl settings
AIMS communicate with the gateway using amqp/ssl as default. so `listeners.ssl.default` port must be set.  
If you want to use the management UI web with ssl, `management.ssl.port` and `management.ssl.cacertfile` and `management.ssl.certfile`
 and `management.ssl.keyfile` should be set.

### memory and storage settings
`vm_memory_high_watermark.relative` to set 0.8, It means using hosts 80% memory.
`disk_free_limit.absolute` must be adjusted depends on hosts storage size. This configuration is set to 2GB.

## Definitions Backup
[RabbitMQ Definitions Backup](https://www.rabbitmq.com/backup.html#rabbitmq-definitions) is needed to prepare for a sudden situation.
```console
# export json file
curl -u {username}:{password} -X GET http://{hostname}:15672/api/definitions > definitions.file.json

# import json file
curl -u {username}:{password} -H "Content-Type: application/json" -X POST -T /path/to/definitions.file.json http://{hostname}:15672/api/definitions
```
## Setting Prometheus for monitoring
[RabbitMQ-Overview](https://grafana.com/grafana/dashboards/10991-rabbitmq-overview/)



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


