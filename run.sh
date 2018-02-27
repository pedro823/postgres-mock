#!/bin/bash
flag="$1"

docker build -t docker_psql .

docker run -p 5000:5432 -e POSTGRES_PASSWORD='password' docker_psql:latest
