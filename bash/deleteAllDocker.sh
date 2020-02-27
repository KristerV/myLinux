
printf "Connected to machine: "
docker-machine active

read -p "Delete all the Docker containers, volumes and everything? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
    docker rmi -f $(docker images -q)
    docker volume rm $(docker volume ls -q)
fi
