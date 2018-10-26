#!/bin/bash

function startGromit {
	ps | grep gromit

	if [ "$?" -ne "0" ];
		then
			gromit-mpx -a &
			
			# setup wacom buttons
			xsetwacom --set "Wacom Bamboo Craft Pad pad" Button 3 "key F9"
			xsetwacom --set "Wacom Bamboo Craft Pad pad" Button 8 "key +super g"
			xsetwacom --set "Wacom Bamboo Craft Pad pad" Button 9 "key +alt F9"
			xsetwacom --set "Wacom Bamboo Craft Pad pad" Button 1 "key +shift F9"

			notify-send "Gromit started"
		else
			notify-send "Gromit already online"
	fi

}

function toggleConky {
	if pidof conky | grep [0-9] > /dev/null
	then
		exec killall conky
	else
		conky &
        sleep 0.1
        wmctrl -a conky
	fi
}

function toggleAlbert {
    albert toggle
    wmctrl -a "albert — Albert" # raise to top
}

function deleteAllDocker {
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
}

$@

