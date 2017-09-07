# docker-utilities

![](https://cdn0.iconfinder.com/data/icons/social-media-2104/24/social_media_social_media_logo_docker-64.png)
![](https://cdn0.iconfinder.com/data/icons/social-media-2104/24/social_media_social_media_logo_git-64.png)
![](https://cdn3.iconfinder.com/data/icons/social-media-logos-glyph/2048/5314_-_Windows-64.png)

#### Scripts to automate docker basic actions.

## About
When working with Docker within a Windows environment, you will need to perform some basic actions almost every time.

This repository contains some scripts in order to automate this actions and make things easier. :)

> If you are using docker-compose, this is not your thing.

> Not tested with native Docker running in Unix environment.

## Prerequisites
- Docker for windows (tested and working with v1.11.2).
- Git bash for Windows (tested and working with Windows 7).

## Deployment
1. Install Docker for Windows.
2. Install Git for Windows.
3. Copy the script (without extension) to ``C:\Program Files\Git\mingw64\bin``.
4. Edit file ``.bashrc`` in ``C:\Users\UserName`` (create new one if doesn't exist).
5. Add the line ``export PATH=$PATH:~/bin`` to the file and save.
6. Open Git Bash and type the name of the script.
7. Enjoy. :)

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
6) Show images              15) Clean dangling volumes
7) Build new image          16) About this script
8) Remove image             17) Exit
9) Clean dangling images
Please enter your choice:
``