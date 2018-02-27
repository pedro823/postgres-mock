#!/bin/bash
flag="$1"

docker build -t docker_psql .

docker run -p 5000:5432 -e POSTGRES_PASSWORD='password' docker_psql:latest &
read -p "Aperte enter para matar os processos do postgres."

docker stop $(docker ps -a -q)

if [ "$flag" == "clean" ]; then
    docker rm `docker ps -aqf status=exited`
fi
