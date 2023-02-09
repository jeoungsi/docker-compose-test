# node_exporter Install & make service in ubuntu

How to install node_exporter in Ubuntu 20.04 & make as a service.  
> - node_exporter version could be updated.  
>   2022-11-04, current version is 1.4.0  
>   2022-12-12, current version is 1.5.0  
> - Must download exact .tar.gz file based on OS & CPU architecture.
 
## 1. Download node_exporter tar file from web
```
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
```

## 2. unzip tar file
```
tar -xvf node_exporter-1.5.0.linux-amd64.tar.gz
```

## 3. copy 'node_exporter' binary file to /user/sbin/
```
sudo cp node_exporter /usr/sbin/
```

## 4. add user node_exporter to server
```
sudo useradd node_exporter -s /sbin/nologin
```

## 5. service creation
```
sudo vi /etc/systemd/system/node_exporter.service

[Unit]
Description=Node Exporter

[Service]
User=node_exporter
EnvironmentFile=/etc/sysconfig/node_exporter
ExecStart=/usr/sbin/node_exporter $OPTIONS

[Install]
WantedBy=multi-user.target
```

## 6. sysconfig file creation
```
sudo mkdir -p /etc/sysconfig
# add own server ip for listen
sudo touch /etc/sysconfig/node_exporter OPTIONS="--web.listen-address 172.17.0.9:9100"
```

## 7. service registration & enable
```
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
```

## 8. service start
```
sudo systemctl start node_exporter
```

## 9. check node_exporter started
```
curl http://172.17.0.9:9100/metrics
```

## 10. extra commands 
```
sudo systemctl stop node_exporter  // stop service
sudo systemctl restart node_exporter  // restart service
```
