pipeline {
    agent none 

	  environment {
		    DOCKERHUB_CREDENTIALS = credentials('dockerhub-travis')
	  }

    stages {
        stage('Build') { 
            agent {
                docker {
                    image 'jupyter/datascience-notebook:latest'
                }
            }
            steps {
                echo 'Build Stage Complete'
            }
        }
        stage('Test') { 
            agent any
            steps {
                echo 'Test Stage Complete'
            }
        }
        stage('Login') {
            steps {
			        	sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			      } 
        }

    }
}