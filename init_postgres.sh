#!/bin/bash
# DATABASE=1 when database is created and running
export DATABASE=0
echo "*** CRIANDO PSQL ***"

# https://en.wikipedia.org/wiki/Here_document#Unix_shells
psql <<- HEREDOCSQL
    CREATE USER user WITH ENCRYPTED PASSWORD 'password' CREATEDB;
    CREATE DATABASE db WITH OWNER user;
    \connect db user;
    CREATE SCHEMA public;
    ALTER SCHEMA public OWNER TO user;
HEREDOCSQL

# import sql_dump
psql user < /tmp/psql_data/create_tables.sql

echo "*** DATABASE CREATED! ***"
export DATABASE=1
