#!/bin/bash

# make files executable
function makeExecutable() {
    chmod a+x utils/*
}

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
        bash utils/machines.sh;
    else
        echo "... you are not using Docker Toolbox"  
    fi
}

# move to images management script
function manageImages() {
    bash utils/images.sh
}

# move to containers management script
function manageContainers() {
    bash utils/containers.sh 
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