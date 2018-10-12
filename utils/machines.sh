#!/bin/bash

# show docker machines
function showMachines() {
    docker-machine ls
}

# start docker machine
function startMachine() {
    if docker-machine start $name; then
        echo "... $name started"
        setEnv
    else
        echo "... cannot start $name"
    fi
}

# stop docker machine
function stopMachine() {
    if docker-machine stop $name; then
        echo "... $name stopped"
    else
        echo "... cannot stop $name"
    fi
}

# restart docker machine
function restartMachine() {
    if docker-machine restart $name; then
        echo "... $name restarted"
        setEnv
    else
        echo "... cannot restart $name"
    fi
}

# show docker machine IP
function showMachineIP() {
    docker-machine ip $name
}

# menu
PS3="Please enter your choice: "
options=("Show machines" "Start machine" "Stop machine" "Restart machine" 
    "Show machine IP" "Back")
select opt in "${options[@]}"
do
    case $opt in
        "Show machines") 
            showMachines;;
        "Start machine")
            echo "Enter the machine name: "; read name 
            echo "... starting $name..."
            startMachine $name;;
        "Stop machine")
            echo "Enter the machine name: "; read name
            echo "... stopping $name..."
            stopMachine $name;;
        "Restart machine")
            echo "Enter the machine name: "; read name
            echo "... restarting $name..."
            restartMachine $name;;
        "Show machine IP")
            echo "Enter the machine name: "; read name
            echo "... showing $name IP..."
            showMachineIP $name;;
        "Back")
            echo "... moving to docker-utilities"
            break;;
        *) 
            echo "... invalid option";;
    esac
done