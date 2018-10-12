#!/bin/bash

# run new container
function runContainer() {
    if docker run -d --name $name -p $ports $image; then
        echo "... $name is running"
        setEnv
    else
        echo "... cannot run $name"
    fi
}

# show all containers
function showContainers() {
    docker ps -a
}

# start stopped container
function startContainer() {
   if docker start $name; then
        echo "... $name started"
    else
        echo "... cannot start $name"
    fi 
}

# stop running container
function stopContainer() {
    if docker stop $name; then
        echo "... $name stopped"
    else
        echo "... cannot stop $name"
    fi
}

#remove specific container
function removeContainer() {
    if docker rm $name; then
        echo "... $name removed"
    else
        echo "... cannot remove $name"
    fi
}

# show all volumes
function showVolumes() {
    if docker volume ls; then
        echo "> this script does not manage volumes"
    else
        echo "... cannot show volumes :("
    fi 
}

# menu
PS3="Please enter your choice: "
options=("Show containers" "Run container" "Start container" "Stop container" 
    "Show volumes" "Back")
select opt in "${options[@]}"
do
    case $opt in
        "Show containers") 
            showContainers;;
        "Run container")
            echo "Enter the container name: "; read name
            echo "Enter the exposed ports (0000:0000): "; read ports
            echo "Enter the image name: "; read image
            echo "... running $name"
            runContainer $name $ports $image;;
        "Start container")
            echo "Enter the container name/id: "; read name
            echo "... starting $name"
            startCotainer $name;;
        "Stop container")
            echo "Enter the container name/id: "; read name
            echo "... stopping $name"
            stopContainer $name;;
        "Show volumes")
            showVolumes;;
        "Back")
            echo "... moving to docker-utilities"
            break;;
        *) 
            echo "... invalid option";;
    esac
done