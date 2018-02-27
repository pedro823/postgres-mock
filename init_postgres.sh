#!/bin/bash
# DATABASE=1 when database is created and running
export DATABASE=0
echo "*** CRIANDO PSQL ***"

# https://en.wikipedia.org/wiki/Here_document#Unix_shells
psql <<- HEREDOCSQL
    CREATE USER myuser WITH ENCRYPTED PASSWORD 'password' CREATEDB;
    CREATE DATABASE myuser WITH OWNER myuser;
    \connect myuser;
    ALTER SCHEMA public OWNER TO myuser;
HEREDOCSQL

# import sql_dump
psql myuser < /tmp/psql_data/create_tables.sql

echo "*** DATABASE CREATED! ***"
export DATABASE=1
