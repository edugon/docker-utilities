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
When working with Docker within a Windows 7 environment, you will need to perform some basic actions almost every time.
This repository contains some scripts in order to automate these actions and make things easier.
These scripts also allow you to talk docker within any bash terminal (beyond the docker toolbox).

> If you are using **docker-compose**, this is not your thing. :)

## Prerequisites
- **Windows 7** or higher.
- [**Docker for Windows**](https://docs.docker.com/docker-for-windows/install/) (tested and working with v17.05.0-ce).
- [**Git for Windows**](https://git-scm.com/download/win) (tested and working with v2.8.1.windows.1).

## Deployment
1. Copy the script (remove extension) to ``C:\Program Files\Git\mingw64\bin``.
2. Edit file ``.bashrc`` in ``C:\Users\<name>`` (create a new one if it doesn't exist).
3. Add the line ``export PATH=$PATH:~/bin`` to the file and save.
4. Open Git Bash and type the name of the script ``docker-utilities``.
5. Enjoy. :)

If everything goes as expected, you will see the following output:
``
*** setting up docker's environment...
Welcome to docker's utilities script
What do you want me to do?
1) Show all machines        10) Show containers
2) Start machine            11) Run new container
3) Stop machine             12) Start container
4) Restart machine          13) Stop container
5) Show machine IP          14) Remove container
6) Show images              15) Show volumes
7) Build new image          16) Clean dangling volumes
8) Remove image             17) About this script
9) Clean dangling images    18) Exit
Please enter your choice:
``

> Developed for **Windows 7** using **Linux containers**, not tested with **Hyper-V**.