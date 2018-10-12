#!/bin/bash

# build new image
function buildImage() {
    if docker build -t $name $path; then
        echo "... $name built"
        setEnv
    else
        echo "... cannot build $name"
    fi
}

# show current images
function showImages() {
    docker images
}

# remove specific image
function removeImage() {
    if docker rmi $name; then
        echo "... $name removed"
    else
        echo "... cannot remove $name"
    fi
}

# menu
PS3="Please enter your choice: "
options=("Show images" "Build image" "Remove image" "Back")
select opt in "${options[@]}"
do
    case $opt in
        "Show images") 
            showImages;;
        "Build image")
            echo "Enter the image name: "; read name
            echo "Enter the Dockerfile path: "; read path
            echo "... building $name"
            buildImage $name $path;;
        "Remove image")
            echo "Enter the image name/id: "; read name
            echo "... removing $name"
            removeImage $name;;
        "Back")
            echo "... moving to docker-utilities"
            break;;
        *) 
            echo "... invalid option";;
    esac
done