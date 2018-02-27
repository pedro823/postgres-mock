FROM postgres:9.6

RUN mkdir -p /tmp/psql_data/

COPY test_sample.sql /tmp/psql_data/
COPY init_postgres.sh /docker-entrypoint-initdb.d/

RUN chmod 777 /tmp/psql_data/test_sample.sql
