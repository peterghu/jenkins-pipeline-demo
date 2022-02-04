<p align = "center">
    <img src='./images/pipeline-logo.PNG' alt='Sample Build Pipeline' width = '650'/>
</p>

# Simple Build Pipeline using Jenkins 
> Objective: Create a simple build pipeline using Jenkins pulling from Github and deploying JupyterLab.

---
## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Supporting Documentation](#supporting-documentation)


---

## Introduction


---

## Prerequisites
Please have all of the following configured and ready to use on your local machine:
- [Docker](https://docs.docker.com/get-docker/)


---

## Installation / Start-Up
### Part 1 - Setup Jenkins Container
1. Clone this repository to your local machine.
2. Ensure **Docker** is running on your local machine.
    - See [Docker Help](https://docs.docker.com/get-docker/) for installation support if you do not already have Docker running on your local machine.
3. Type `sh runMe.sh` in the CLI of the local repo to run the Shell command. Follow the directions and on-screen prompts to launch a **Docker** container running an image of **Jenkins**.

By this point, a **Jenkins** container will be running on your local machine. However, if this is your first time running **Jenkins** on this machine, you will need to perform a one time set up. This is outlined in Part 2. If additional support is needed, please see the [Jenkins post-installation setup wizard page](https://www.jenkins.io/doc/book/installing/docker/#setup-wizard). You will need the intial admin password from the Docker logs for the `myjenkins-blueocean` container.


### Part 2 - Jenkins Initial Setup
4. Type `docker ps -a` in the CLI to find the **Docker** container ID for your `myjenkins-blueocean:2.319.2-1` image.

<p align = "center">
    <img src='./images/docker-containers.PNG' alt='Find Your Docker Container ID' width = ''/>
</p>

5. In the CLI type: `docker logs <cotainer ID for myjenkins-blueocean:2.319.2-1>` to obtain the initial admin password. it will appear in the following message:

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
6. Open your browser and go to the webpage http://localhost:8080/ to access **Jenkins**.
7. Type in the intial password and follow the prompts on screen to unlock **Jenkins**. 

<p align = "center">
        <img src='./images/setup-jenkins-01-unlock-jenkins-page.jpg' alt='Jenkins Initial Setup' width = '600'/> 
    <br>Source: Jenkins.io
</p>

> Note: The following steps are from the [Build a Python app with PyInstaller](https://www.jenkins.io/doc/tutorials/build-a-python-app-with-pyinstaller/#unlocking-jenkins) tutorial. The steps have been copied to the README file for convenience. 

8. After unlocking Jenkins, the **Customize Jenkins** page appears. On this page, click **Install suggested plugins**.
9. When the **Create First Admin User** page appears, specify your details in the respective fields and click **Save and Finish**.
10. When the **Jenkins is ready** page appears, click **Start using Jenkins**.
11. When the Jenkins is ready page appears, click Start using Jenkins.

    > Note: This page may indicate **Jenkins is almost ready!** instead and if so, click **Restart**. If the page doesn’t automatically refresh after a minute, use your web browser to refresh the page manually.

12. If required, log in to Jenkins with the credentials of the user you just created and you’re ready to start using Jenkins!

### Part 2.5 - Adding Docker Credentials into Jenkins
Coming soon!

### Part 3 - Creating A Jenkins Pipeline
13. From the Jenkins Dashboard, click New Item.

<p align = "center">
    <img src='./images/jenkins-new-item1.PNG' alt='Jenkins New Item' width = ''/> 
</p>

14. Enter a name for the new pipeline in the **Enter an item name** field.
15. Select **Pipeline**, then click **OK** at the bottom of the page.

<p align = "center">
    <img src='./images/jenkins-new-item2.PNG' alt='Jenkins New Item' width = '600'/> 
</p>

16. On the new page, give the pipeline a description.
17. Click the **Pipeline** tab at the top of the page.
18. From **SCM**, choose **Git**.
19. Type your Git repository  path in the **Repository URL field**.

<p align = "center">
    <img src='./images/jenkins-pipeline-config.PNG' alt='Setting Up a New Pipeline' width = '600'/> 
</p>

20. Click **OK** at the bottom of the page.
21. On the Jenkins Dashboard, click **Open Blue Ocean** on the lefthand side to access Jenkins’s Blue Ocean interface. 

<p align = "center">
    <img src='./images/jenkins-blueocean2.PNG' alt='New Job on Blue Ocean Interface' width = '600'/> 
</p>

22. Assuming this is your first time on this screen, you will have a prompt that says "This job has not been run". Click **Run**. This will run the **Jenkinsfile** from the Git repository.
23. Click the row with your pipeline name to view the status of the job.

By this point, **Jenkins** should have built a **Docker** image of **JupyterLab** and uploaded it to **Docker Hub**.

### Part 4 - Running JupyterLab Image
Coming soon!

`docker run -it --rm --name jupyter -p 8888:8888 traviscancode604/build-pipeline-demo`

```pt
Serving notebooks from local directory: /home/jovyan
0 active kernels
Jupyter Server 1.13.4 is running at:
http://f6eed57b27b0:8888/lab?token=a20e3ac554e503a621add091cb9c28368eecacd4e8bfbad7
 or http://127.0.0.1:8888/lab?token=a20e3ac554e503a621add091cb9c28368eecacd4e8bfbad7
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

