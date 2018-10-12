# docker-utilities
#### Scripts to automate some docker basic actions.

![](https://cdn0.iconfinder.com/data/icons/social-media-2104/24/social_media_social_media_logo_git-64.png)
![](https://cdn0.iconfinder.com/data/icons/logos-brands/24/logo_brand_brands_logos_microsoft_windows-64.png)
![](https://cdn0.iconfinder.com/data/icons/social-media-2104/24/social_media_social_media_logo_docker-64.png)

![](https://d25lcipzij17d.cloudfront.net/badge.svg?id=gh&type=6&v=1.0&x2=0)
![](https://img.shields.io/badge/Maintained%3F-yes-green.svg)
![](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)
![](https://img.shields.io/badge/Ask%20me-anything-1abc9c.svg)

## About
When working with Docker engine, you will need to perform some basic actions almost every time.
This repository contains some scripts in order to automate these actions and make things easier.
These scripts also allow you to talk docker within any bash terminal (beyond the docker toolbox).

> If you are using **docker-compose**, this is not your thing. :)

docker-utilities just automates some basic commands for the management of docker machines, containers and images.

## Prerequisites
- **Unix** or **Windows** based distribution.
- [**Docker Engine**](https://www.docker.com/products/docker-engine) or [**Docker Toolbox**](https://docs.docker.com/toolbox/toolbox_install_windows/) (Windows 7).
- **Git** or [**Git for Windows**](https://git-scm.com/download/win) (Windows 7).
> Tested for Debian 9.5.0 and Windows 7 (Docker Toolbox).

## Run on Unix
Once you have downloaded this repository, just run the main script: 
- `$ sudo bash docker-utilities.sh`

If you want this script to be used from everywhere, add it to your `PATH`:
- `$ export PATH=$PATH:/full-path/docker-utilities`

To make this change persistent, you should add the previous command to your `~/.bashrc`.

> Execute docker-utilities using `sudo` to avoid issues :)

Now you can use `$ sudo docker-utilities.sh` from everywhere!

## Run on Windows

TBD

## Utilities
If everything goes as expected, you will see the following output:
```
... setting up docker's environment
Welcome to docker's utilities script
What do you want me to do?
1) Manage machines    3) Manage containers  5) About this script
2) Manage images      4) Clean system	    6) Exit
Please enter your choice:
```
Machines menu (Docker Toolbox):
```
1) Show machines  3) Stop machine     5) Show machine IP
2) Start machine  4) Restart machine  6) Back
```
Images menu:
```
1) Show images
2) Build image
3) Remove image
4) Back
```
Containers menu:
```
1) Show containers  3) Start container	5) Show volumes
2) Run container    4) Stop container	6) Back
```