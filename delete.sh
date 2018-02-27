docker stop $(docker ps -a -q)

if [ "$flag" == "clean" ]; then
    docker rm `docker ps -aqf status=exited`
fi
