#!/bin/bash

if pidof conky | grep [0-9] > /dev/null
then
    exec killall conky
else
    conky &
    sleep 0.1
    wmctrl -a conky
fi
