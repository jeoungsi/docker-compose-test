#!/usr/bin/env bash

# env used only this script running..
PG_CONF=/postgresql.conf

echo "init Master postgres conf files...."

if [ -s "$PGDATA/PG_VERSION" ]; then
  DATABASE_ALREADY_EXISTS='true'
fi

if [ -z "$DATABASE_ALREADY_EXISTS" ]; then
  echo "do database initialize..."
else

  # create postgresql.conf file.
  # optional performance data => https://pgtune.leopard.in.ua/#/
  echo "create postgresql.conf file"
  echo -e "listen_addresses = '*'\n" > ${PGDATA}${PG_CONF}
  echo -e "port = 5432\n" >> ${PGDATA}${PG_CONF}
  echo -e "max_connections = 500\n" >> ${PGDATA}${PG_CONF}
  echo -e "shared_buffers = 512MB\n" >> ${PGDATA}${PG_CONF}

  #echo -e "wal_buffers = 16MB" >> ${PGDATA}${PG_CONF}
  #echo -e "effective_cache_size = 6GB" >> ${PGDATA}${PG_CONF}
  #echo -e "maintenance_work_mem = 512MB" >> ${PGDATA}${PG_CONF}
  #echo -e "work_mem = 10485kB" >> ${PGDATA}${PG_CONF}
  #echo -e "checkpoint_completion_target = 0.7" >> ${PGDATA}${PG_CONF}
  #echo -e "default_statistics_target = 100" >> ${PGDATA}${PG_CONF}
  #echo -e "random_page_cost = 1.1" >> ${PGDATA}${PG_CONF}
  #echo -e "effective_io_concurrency = 200" >> ${PGDATA}${PG_CONF}
  #echo -e "min_wal_size = 1GB" >> ${PGDATA}${PG_CONF}
  #echo -e "max_wal_size = 4GB" >> ${PGDATA}${PG_CONF}
  #echo -e "max_worker_processes = 4" >> ${PGDATA}${PG_CONF}
  #echo -e "max_parallel_workers_per_gather = 2" >> ${PGDATA}${PG_CONF}
  #echo -e "max_parallel_workers = 4" >> ${PGDATA}${PG_CONF}
  #echo -e "max_parallel_maintenance_workers = 2" >> ${PGDATA}${PG_CONF}

  # replication options
  #echo -e "\nwal_level = hot_standby\nmax_wal_senders = 2\nmax_replication_slots = 2\n" >> ${PGDATA}${PG_CONF}

  # create pg_hba.conf file.
  #echo "create pg_hba.conf file"
  #echo -e "local all all trust \n host all all 0.0.0.0/0 password \n host replication ${REPL_USER} ${REPL_ADDR} trust \n" > ${PGDATA}/pg_hba.conf

fi
