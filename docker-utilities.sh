#!/bin/bash
############ DOCKER'S UTILITIES SCRIPT ############
######## Coded by Eduu <egonrea@gmail.com> ########

# Set docker environment
function setEnv() {
    echo "*** setting up docker's environment..."
	eval "$(docker-machine env default)"
}

# Show docker machines
function showMachines() {
    docker-machine ls
}

# Start docker machine
function startMachine() {
    if docker-machine start $name; then
        echo "*** $name machine started successfully"
        setEnv
    else
        echo "*** start of $name machine failed"
    fi
}

# Stop docker machine
function stopMachine() {
    if docker-machine stop $name; then
        echo "*** $name machine stopped successfully"
    else
        echo "*** stop of $name machine failed"
    fi
}

# Restart docker machine
function restartMachine() {
    if docker-machine restart $name; then
        echo "*** $name machine restarted successfully"
        setEnv
    else
        echo "*** restart of $name machine failed"
    fi
}

# Show docker machine IP
function showMachineIP() {
    docker-machine ip $name
}

# Show current images
function showImages() {
    docker images
}

# Show all containers
function showContainers() {
    docker ps -a
}

# Build new image
function buildImage() {
    if docker build -t $name $path; then
        echo "*** $name image built successfully"
        setEnv
    else
        echo "*** build of $name image failed"
    fi
}

# Run new container
function runContainer() {
    if docker run -d --name $name -p $ports $image; then
        echo "*** $name container created successfully"
        setEnv
    else
        echo "*** creation of $name container failed"
    fi
}

# Start stopped container
function startContainer() {
   if docker start $name; then
        echo "*** $name container started successfully"
    else
        echo "*** starting of $name container failed"
    fi 
}

# Stop running container
function stopContainer() {
    if docker stop $name; then
        echo "*** $name container stopped successfully"
    else
        echo "*** stopping of $name container failed"
    fi
}

#Remove specific container
function removeContainer() {
    if docker rm $name; then
        echo "*** $name container removed successfully"
    else
        echo "*** removal of $name container failed"
    fi
}

#Remove specific image
function removeImage() {
    if docker rmi $name; then
        echo "*** $name image removed successfully"
    else
        echo "*** removal of $name image failed"
    fi
}

# Remove all dangling images
function cleanImages() {
	if docker rmi $(docker images --filter "dangling=true" -q --no-trunc); then
    	echo "*** dangling images removed successfully"
	else
    	echo "*** removal of dangling images failed (maybe there is nothing to clean)"
	fi
}

# Show all volumes
function showVolumes() {
    docker volume ls
}

# Remove all dangling volumes
function cleanVolumes() {
	if docker volume rm $(docker volume ls -q -f dangling=true); then
    	echo "*** dangling volumes removed successfully"
	else
    	echo "*** removal of dangling volumes failed (maybe there is nothing to clean)"
	fi
}

# Script information
function info() {
    echo "DOCKER'S UTILITIES SCRIPT"
    echo "Coded by Eduu <egonrea@gmail.com>"
    echo "v1.0"
    echo "Tested and working on Windows"
    echo "Prepared for Linux containers (not tested with Hyper-V)"
    echo "For any doubt or improvement please contact this email"
}

# Bash menu
clear
setEnv
echo "Welcome to docker's utilities script"
echo "What do you want me to do?"
PS3="Please enter your choice: "
options=("Show all machines" "Start machine" "Stop machine" "Restart machine" "Show machine IP" 
    "Show images" "Build new image" "Remove image" "Clean dangling images" "Show containers" 
    "Run new container" "Start container" "Stop container" "Remove container" "Show volumes" 
    "Clean dangling volumes" "About this script" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Show all machines")
            echo "*** showing docker machines..."
            showMachines;;
        "Start machine")
            echo "Enter the machine name: "
            read name
            echo "*** starting docker machine..."
            startMachine $name;;
        "Stop machine")
            echo "Enter the machine name: "
            read name
            echo "*** stopping docker machine..."
            stopMachine $name;;
        "Restart machine")
            echo "Enter the machine name: "
            read name
            echo "*** restarting docker machine..."
            restartMachine $name;;
        "Show machine IP")
            echo "Enter the machine name: "
            read name
            echo "*** showing docker machine IP..."
            showMachineIP $name;;
        "Show images")
            echo "*** showing built images..."
            showImages;;
        "Build new image")
            echo "Enter the image name: "
            read name
            echo "Enter the Dockerfile path (. if it's within the current folder): "
            read path
            echo "*** building new image..."
            buildImage $name $path;;
        "Remove image")
            echo "Enter the image name/id: "
            read name
            echo "*** Removing image..."
            removeImage $name;;
        "Clean dangling images")
            echo "*** cleaning up dangling images..."
            cleanImages;;
        "Show containers")
            echo "*** showing all containers..."
            showContainers;;
        "Run new container")
            echo "Enter the container name: "
            read name
            echo "Enter the exposed ports (separated with :): "
            read ports
            echo "Enter the image name: "
            read image
            echo "*** running new container..."
            runContainer $name $ports $image;;
        "Start container")
            echo "Enter the container name/id: "
            read name
            echo "*** starting container..."
            startContainer $name;;
        "Stop container")
            echo "Enter the container name/id: "
            read name
            echo "*** Stopping container..."
            stopContainer $name;;
        "Remove container")
            echo "Enter the container name/id: "
            read name
            echo "*** Removing container..."
            removeContainer $name;;
        "Show volumes")
            echo "*** showing all volumes..."
            showVolumes;;
        "Clean dangling volumes")
            echo "*** cleaning up dangling volumes..."
            cleanVolumes;;
        "About this script")
            info;;
        "Exit")
            echo "Have a nice day :)"
            break;;
        *) 
            echo "Invalid option";;
    esac
done