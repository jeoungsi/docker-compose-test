# Quick reference for AIMS Monitoring Installation
![logo](https://user-images.githubusercontent.com/17061046/215271555-8f9c358d-2314-4e36-a85b-18f0d19e28e0.png)

-	**Maintained by**:  
	[AIMS Application Group](https://github.com/orgs/solu-m/teams/aims)

-	**Where to get help about Docker**:  
	[the Docker Community Slack](https://dockr.ly/comm-slack)

-	**Docker official image Versions**:  
    > [grafana](https://hub.docker.com/r/grafana/grafana)      => grafana/grafana:latest  
    > [prometheus](https://hub.docker.com/r/prom/prometheus)    => prom/prometheus:latest  
	> [pgadmin4](https://hub.docker.com/r/dpage/pgadmin4/)      => dpage/pgadmin4  
	> [node_exporter](https://hub.docker.com/r/prom/node-exporter) => prom/node-exporter:v1.5.0  
	> [cadvisor](https://github.com/google/cadvisor/releases)      => gcr.io/cadvisor/cadvisor:latest  

-	**Limitation about this settings**:
	> - This is a reference setting for create the monitor settings as docker-compose when using AIMS.  

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
## Grafana Settings
-	**Graph JSON**:  
	> [node-exporter 1860](https://grafana.com/grafana/dashboards/1860-node-exporter-full/)  
	> [cadvisor graph 14282](https://grafana.com/grafana/dashboards/14282-cadvisor-exporter/)  





