FROM postgres:9.6

RUN mkdir -p /tmp/psql_data/

COPY create_tables.sql /tmp/psql_data/
COPY init_postgres.sh /docker-entrypoint-initdb.d/

RUN chmod 777 /tmp/psql_data/create_tables.sql
