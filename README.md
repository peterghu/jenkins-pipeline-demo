<p align = "center">
    <img src='./images/pipeline-logo.PNG' alt='Sample Build Pipeline' width = '650'/>
</p>

# Simple Build Pipeline using Jenkins 
> Objective: Create a simple build pipeline using Jenkins pulling from Github and deploying JupyterLab

---
## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Supporting Documentation](#supporting-documentation)

README last updated: February 01, 2022

---

## Introduction


---

## Prerequisites
Please have all of the following configured and ready to use on your local machine:
- [Docker](https://docs.docker.com/get-docker/)


---

## Installation
### Part 1 - Setup Jenkins Container
1. Clone this repository to your local machine.
2. Ensure Docker is running on your local machine.
    - See [Docker Help](https://docs.docker.com/get-docker/) for installation support if you do not already have Docker running on your local machine.
3. To use **Docker** to launch a container running an image of **Jenkins**, run the `runMe.sh` Shell command in the CLI for local repo directory and follow the directions of the on-screen prompts (e.g.: type `sh runMe.sh` and enter passwords went prompted).
  > Note: For more details on what is included in the Shell command, please see the [Jenkins Support](https://www.jenkins.io/doc/book/installing/docker/) website.

By this point, a **Jenkins** container will be de running on your local machine, but you will need to perform a one time set up. This is outliend in the subsequent steps. If additional support is needed, please see the [Jenkins post-installation setup wizard page](https://www.jenkins.io/doc/book/installing/docker/#setup-wizard). You will need the intial admin password from the Docker log for the `myjenkins-blueocean` container.

4. In the CLI type: `docker logs <cotainer ID for myjenkins-blueocean:2.319.2-1>` to obtain the initial admin password. it will appear in the following message:
```pt
*************************************************************
*************************************************************
*************************************************************

Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

7c5d354a49c241748bed58e0a7486b8f

This may also be found at: /var/jenkins_home/secrets/initialAdminPassword

*************************************************************
*************************************************************
*************************************************************

```
5. Open your browser and go to the webpage http://localhost:8080/ to access Jenkins.
6. Type in the intial password and follow the prompts on screen to unlock Jenkins. 
  > Note: Please follow the instructions in the Jenkins post-installation setup wizard if the on-screen prompts are unclear.


### Part 2 - Jenkins Initial Setup

### Part 3 - Creating A Jenkins Pipeline

### Part 4 - Running JupyterLab Image


`docker run -it --rm --name jupyter -p 8888:8888 traviscancode604/build-pipeline-demo`

```pt
Serving notebooks from local directory: /home/jovyan
0 active kernels
Jupyter Server 1.13.4 is running at:
http://f6eed57b27b0:8888/lab?token=a20e3ac554e503a621add091cb9c28368eecacd4e8bfbad7
 or http://127.0.0.1:8888/lab?token=a20e3ac554e503a621add091cb9c28368eecacd4e8bfbad7
```

## Supporting Documentation

### Pushing Images to Docker Hub via Jenkins
- Jenkins Pipeline to Create Docker Image and Push to Dockerhub (https://medium.com/swlh/jenkins-pipeline-to-create-docker-image-and-push-to-docker-hub-721919512f2)
- How To Push a Docker Image To Docker Hub Using Jenkins