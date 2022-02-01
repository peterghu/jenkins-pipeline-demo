# Simple Build Pipeline using Jenkins 
> Objective: Create a simple build pipeline using Jenkins pulling from Github and deploying JupyterLab

---
## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)


README last updated: February 01, 2022

---

## Introduction

a

---

## Prerequisites
Please have all of the following configured and ready to use on your local machine:
- [Docker](https://docs.docker.com/get-docker/)


---

## Installation
### Part 1 - Jenkins
1. Clone this repository to your local machine.
2. Ensure Docker is running on your local machine.
    - See [Docker Help](https://docs.docker.com/get-docker/) for installation support if you do not already have Docker running on your local machine.
3. To use **Docker** to launch a container running an image of **Jenkins**, run the `runMe.sh` Shell command in the CLI for local repo directory and follow the directions of the on-screen prompts (e.g.: type `sh runMe.sh` and enter passwords went prompted).
  > Note: For more details on what is included in the Shell command, please see the [Jenkins Support](https://www.jenkins.io/doc/book/installing/docker/) website.

By this point, a **Jenkins** will be de deployed on your local machine, but you will need to perform a one time set up. This is outliend in the subsequent steps. If additional support is needed, please see the [Jenkins post-installation setup wizard page](https://www.jenkins.io/doc/book/installing/docker/#setup-wizard).

4. In the CLI type: `sudo cat /var/lib/jenkins/secrets/initialAdminPassword` to obtain the initial admin password (e.g.: 44543046bf40427a867cf336f1f5f62b).
5. Open your browser and go to the webpage http://localhost:8080/ to access Jenkins.
6. Type in the intial password and follow the prompts on screen. Follow the instructions in the Jenkins post-installation setup wizard if the on-screen prompts are unclear.

# Part 2 - Jenkins Pipeline
1. In Jenkins, click New Item.
2. Enter a name for the pipeline (e.g.: jupyterPipeline)
3. Create a multibranch pipeline.
4. Under Branch Sources:
  - Click **Add source**.
  - Select **GitHub** from the dropdown menu.
  - Paste the URL https://github.com/traviscancode604/buildPipelineDemo and click **Valide**. Note that as this is a public repo, no credential is required.
  - Click **Save**.
