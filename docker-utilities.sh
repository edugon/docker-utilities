#!/bin/bash

# set docker environment (Docker Toolbox)
function setEnv() {
    if docker-machine 2> /dev/null; then
        echo "... setting up docker's environment"
        eval "$(docker-machine env default)"
    fi
}

# move to machines management script
function manageMachines() {
    if docker-machine 2> /dev/null; then
        path=$(find . -path "*utils/machines.sh")
        bash $path
    else
        echo "... you are not using Docker Toolbox"  
    fi
}

# move to images management script
function manageImages() {
    if docker-machine 2> /dev/null; then
        path=$(find . -path "*utils/images.sh")
    	bash $path
    else
        path=$(sudo find . -path "*utils/images.sh")
        bash $path
    fi
}

# move to containers management script
function manageContainers() {
    if docker-machine 2> /dev/null; then
        path=$(find . -path "*utils/containers.sh")
    	bash $path
    else 
        path=$(sudo find . -path "*utils/containers.sh")
        bash $path
    fi
}

# clean docker system
function cleanSystem() {
    if docker system prune; then
        echo "... system cleaned"
        setEnv
    else
        echo "... cannot clean system"
    fi
}

# script information
function info() {
    echo "docker-utilities"
    echo "coded by eduu <egonrea@gmail.com>"
    echo "v1.0"
}

# menu
clear; setEnv; makeExecutable
echo "Welcome to docker's utilities script"; echo "What do you want me to do?"
PS3="Please enter your choice: "
options=("Manage machines" "Manage images" "Manage containers" "Clean system" "About this script" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Manage machines") 
			manageMachines;;
        "Manage images")
            manageImages;;
        "Manage containers")
            manageContainers;;
        "Clean system")
            cleanSystem;;
        "About this script")
            info;;
        "Exit")
            echo "... have a nice day :)"
            break;;
        *) 
            echo "... invalid option";;
    esac
done