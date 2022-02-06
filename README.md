<p align = "center">
    <img src='./images/pipeline-logo.PNG' alt='Sample Build Pipeline' width = '650'/>
</p>

# Simple Build Pipeline using Jenkins 
> Objective: Create a simple build pipeline using Jenkins pulling from Github and deploying JupyterLab.

---
## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Part 1 - Setup Jenkins Container](#part-1---setup-jenkins-container)
  - [Part 2 - Jenkins Initial Setup](#part-2---jenkins-initial-setup)
  - [Part 3 - Adding Docker Credentials into Jenkins](#part-3---adding-docker-credentials-into-jenkins)
  - [Part 4 - Create Docker Hub Repo and Update Jenkinsfile](#part-4---create-docker-hub-repo-and-update-jenkinsfile)
  - [Part 5 - Creating A Jenkins Pipeline](#part-5---creating-a-jenkins-pipeline)
- [Post Setup](#post-setup)
  - [Part 6 - Start JupyterLab](#part-6---start-jupyterlab)
- [Troubleshooting](#troubleshooting)
- [Supporting Documentation](#supporting-documentation)


---

## Introduction
I have writen this README to show how I set up a simple build pipeline using **Jenkins**. While I have tried to be explicit in the steps so that readers can follow along, there may be times where more detail is needed. I have tried to provide additional resources where required to help clarify any background info if it is needed.

My recommendation would be to clone or fork this repo to your GitHub (and local machine) and to update the credentials / GitHub / Docker Hub links as noted as we progress through this README. I've tried my best to flag all instances of this in this document. 

**Good luck, and have fun!**

### My Machine
Lenovo Legion 5 (15”, AMD) Gaming Laptop
- AMD Ryzen 5 4600H with Radeon Graphics, 3000 MHz 6 Cores, 12 Logical Processors
- NVIDIA GeForce GTX 1650 
- 8 GB DDR4 RAM
- Windows 10 Home

### My Oracle VM Virtual Machine
- Ubuntu (64-Bit) 
- 2 VM Processors
- 4 GB Memory
- G32 MB Video Memory

---

## Prerequisites
Please have all of the following configured and ready to use on your local machine:
- [Docker](https://docs.docker.com/get-docker/)

---

## Installation
### Part 1 - Setup Jenkins Container
1. Clone this repository to your local machine and set up your GitHub repo for this project if you did not clone/fork my repo.
2. Ensure **Docker** is running on your local machine. You can see if Docker is running by typing `systemctl is-active docker` in the CLI.
    - See [Docker Help](https://docs.docker.com/get-docker/) for installation support if you do not already have **Docker** running on your local machine.
3. Type `sh runMe.sh` in the command line interface (CLI) of the local repo to run the Shell command. 

By this point, a **Jenkins** container will be running on your local machine. However, if this is your first time running **Jenkins** on this machine, you will need to perform a one time setup. This is outlined in Part 2. If additional support is needed, please see the [Jenkins post-installation setup wizard page](https://www.jenkins.io/doc/book/installing/docker/#setup-wizard). You will need the intial admin password from the **Docker** logs for the `myjenkins-blueocean` container.
> Note: If you ran the `runMe.sh` Shell file but had to leave the set up by this point, you can run the Shell command again to start the **Jenkins** containers. This can be used after the installation is complete as a way to start your **Jenkins** if you wish to explore other **Jenkins** projects.

<br>

### Part 2 - Jenkins Initial Setup
1. Type `docker ps -a` in the CLI to find the **Docker** container ID for your `myjenkins-blueocean:2.319.2-1` image.

<p align = "center">
    <img src='./images/docker-containers.PNG' alt='Find Your Docker Container ID' width = ''/>
</p>

2. To obtain the initial admin password, type: `docker logs <container ID>` where the container ID is the ID for myjenkins-blueocean:2.319.2-1 in the CLI. The password will appear in the following message:

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
3. Open your browser and go to the webpage [http://localhost:8080/](http://localhost:8080/) to access **Jenkins**.
4. Type in the intial password and follow the prompts on screen to unlock **Jenkins**. 

<p align = "center">
        <img src='./images/setup-jenkins-01-unlock-jenkins-page.jpg' alt='Jenkins Initial Setup' width = '600'/> 
</p>

> Note: The following steps are from the [Build a Python app with PyInstaller](https://www.jenkins.io/doc/tutorials/build-a-python-app-with-pyinstaller/#unlocking-jenkins) tutorial. The steps have been copied to the README file for convenience. 

5. After unlocking Jenkins, the **Customize Jenkins** page appears. On this page, click **Install suggested plugins**.
6. When the **Create First Admin User** page appears, specify your details in the respective fields and click **Save and Finish**.
7. When the **Jenkins is ready** page appears, click **Start using Jenkins**.
8. When the Jenkins is ready page appears, click Start using Jenkins.

    > Note: This page may indicate **Jenkins is almost ready!** instead and if so, click **Restart**. If the page doesn’t automatically refresh after a minute, use your web browser to refresh the page manually.

9. If required, log into **Jenkins** with the credentials of the user you just created. You’re ready to start using Jenkins!

<br>

### Part 3 - Adding Docker Credentials into Jenkins
1. Click Manage Jenkins
2. Click Manage Credentials
3. Under Stores Scoped to Jenkins, click Jenkins
4. Click Global Credentials
5. Click Add Credentials
6. Fill out the username, password and description fields. Name the ID `docker-creds` so that the Jenkinsfile can read these credentials.
7. Click **Ok** when finished.

<p align = "center">
        <img src='./images/dockerhub-creds.PNG' alt='Add Credentials' width = '600'/> 
</p>

<br>

### Part 4 - Create Docker Hub Repo and Update Jenkinsfile 
1. Go to Docker Hub and create a new public repository. For this demo, I named the repo `build-pipeline-demo`.

<p align = "center">
        <img src='./images/dockerhub-repo.PNG' alt='Docker Hub Repo' width = ''/> 
</p>

2. Notice how I have used `traviscancode604/build-pipeline-demo` on lines 38 and 40. Update lines 38 and 40 to reference your **Docker Hub** repo (no I will not give you my Docker Hub credentials to push to my repo :smirk: ).  

<p align = "center">
        <img src='./images/jenkinsfile-repo.PNG' alt='Jenkinsfile Changes' width = '600'/> 
</p>

3. Once the Jenkinsfile has been updated, don't forget to push it to your GitHub project repo (so that the pipeline can read the file in part 5).

<br>

### Part 5 - Creating A Jenkins Pipeline
1. From the Jenkins Dashboard, click **New Item**.

<p align = "center">
    <img src='./images/jenkins-new-item1.PNG' alt='Jenkins New Item' width = ''/> 
</p>

2. Enter a name for the new pipeline in the **Enter an item name** field.
3. Select **Pipeline**, then click **OK** at the bottom of the page.

<p align = "center">
    <img src='./images/jenkins-new-item2.PNG' alt='Jenkins New Item' width = '600'/> 
</p>

4. On the new page, give the pipeline a description.
5. Click the **Pipeline** tab at the top of the page.

<p align = "center">
    <img src='./images/jenkins-new-pipeline.PNG' alt='Give your pipeline a description.' width = '600'/> 
</p>

6. Select a definition of **Pipeline Script from SCM**. 
7. From **SCM**, choose **Git**.
8. Type your GitHub Repo for this project into the **Repository URL field**. Mine is `https://github.com/traviscancode604/buildPipelineDemo`  
9. Under branches to build, select the appropraite branch. For my repo, this was `main`.

<p align = "center">
    <img src='./images/jenkins-pipeline-config.PNG' alt='Setting Up a New Pipeline' width = '600'/> 
</p>

10. Click **Save** at the bottom of the page.
11. A new page should load for the pipeline. On the left hand side, click **Open Blue Ocean** to access the Blue Ocean interface. 
12. Assuming this is your first time on this screen, you will have a prompt that says "This job has not been run". Click **Run**. This will run the **Jenkinsfile** from the Git repository.

<p align = "center">
    <img src='./images/jenkins-blueocean2.PNG' alt='New Job on Blue Ocean Interface' width = '600'/> 
</p>

13. Click the row with your pipeline name to view the status of the job.
14. When the job is complete, you should see a screen like this:

<p align = "center">
    <img src='./images/jenkins-blueocean3.PNG' alt='Finished Job in Blue Ocean Interface' width = '600'/> 
</p>

## Post Setup
By this point, **Jenkins** will have built a **Docker** image of **JupyterLab** and uploaded it to **Docker Hub**. You can safely leave **Jenkins**. You are also now ready to pull this new Docker image to any machine running **Docker**!

### Part 6 - Start JupyterLab
1. In your CLI, type `docker run -it --rm --name jupyter -p 8888:8888 traviscancode604/build-pipeline-demo`. You should get a message like this in your CLI:

```pt
Serving notebooks from local directory: /home/jovyan
0 active kernels
Jupyter Server 1.13.4 is running at:
http://f6eed57b27b0:8888/lab?token=a20e3ac554e503a621add091cb9c28368eecacd4e8bfbad7
 or http://127.0.0.1:8888/lab?token=a20e3ac554e503a621add091cb9c28368eecacd4e8bfbad7
```
2. Copy the link from the CLI and paste it into your browser.
  Note: that if you follow the link in your browser without the generated token at the end (e.g.: `?token=a20e3...`), Jupyter will contest you for credentials.

You should see a screen like this:

<p align = "center">
    <img src='./images/jupyter1.PNG' alt='JupyterLab' width = '600'/>
</p>

<p align = "center">
<b>Congratulations! You now have a container of JupyterLab (for Python) running on your machine with a demo notebook ready for use!</b>
<br>
</p>

The Image was built with a data and a Python Notebook included. Double click `demo-notebook.ipynb` to launch the notebook:

<p align = "center">
    <img src='./images/jupyter2.PNG' alt='JupyterLab with Sample Notebook' width = '600'/>
</p>


---

## Troubleshooting
If you see an image like this one, something didn't go according to plan: 


<p align = "center">
    Blue Ocean Git Interface Here.
</p> 


You can read the output from the Blue Ocean interface to start troubleshooting, but here are some things to note that might help:

### GitHub
Blue Ocean will pull from GitHub for the repo that was specified in [part 5](#part-5---creating-a-jenkins-pipeline), so be mindful if you are referrencing my repo or your cloned repo if you went that route.


<p align = "center">
    Blue Ocean Git Interface Here.
</p>


## Docker Hub Credentials in Jenkins
If you didn't use the ID `docker-creds` detailed in [part 3](#part-3---adding-docker-credentials-into-jenkins), you might see an error similar to this:


<p align = "center">
    Blue Ocean Docker Credential Error Here.
</p>


## Jenkinsfile Location
We updated the Jenkinsfile in [part 4](), if the file has incorrect links or typos, you might see something similar to this:


<p align = "center">
    Blue Ocean Docker Credential Error Here.
</p>


If you're curious, or want to add in stages one at a time you can start with a bare bones Jenkinsfile like this:

```jenkinsfile
pipeline {

    agent any

    stages {
        stage("build") {
            steps {
                echo 'Build stage'
            }
        }
        stage("test") {
            steps {
                echo 'Test stage'
            }
        }
        stage("deploy") {
            steps {
                echo 'Deploy stage'
            }
        }
    }   
}
```

---

## Supporting Documentation
While the intent of this README was to include all of the required steps for demonstration, you may be interested in the following topics for a deeper understanding.

### How to Make A Basic Jenkinsfile
- [Jenkins Tutorial - Build a Python app with PyInstaller](https://www.jenkins.io/doc/tutorials/build-a-python-app-with-pyinstaller/)
- [Jenkinsfile Pipeline Syntax](https://www.jenkins.io/doc/book/pipeline/syntax/)

### Pushing Images to Docker Hub via Jenkins
- [Jenkins Pipeline to Create Docker Image and Push to Dockerhub](https://medium.com/swlh/jenkins-pipeline-to-create-docker-image-and-push-to-docker-hub-721919512f2)
- [How To Push a Docker Image To Docker Hub Using Jenkins](https://medium.com/codex/how-to-push-a-docker-image-to-docker-hub-using-jenkins-487fb1fcbe25)

