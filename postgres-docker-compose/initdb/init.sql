CREATE USER aims PASSWORD 'aims' SUPERUSER;
CREATE DATABASE "AIMS_CORE_DB" OWNER aims;
CREATE DATABASE "AIMS_PORTAL_DB" OWNER aims;
CREATE DATABASE "AIMS_LBS_DB" OWNER aims;
CREATE DATABASE "AIMS_PDA_DB" OWNER aims;
CREATE DATABASE "AIMS_OTA_DB" OWNER aims;
CREATE DATABASE pgbenchtest OWNER aims;
CREATE USER replicator PASSWORD 'replicator' REPLICATION;