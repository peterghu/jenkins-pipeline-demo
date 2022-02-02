pipeline {
    agent none 
    stages {
        stage('Build') { 
            agent {
                docker {
                    image 'jupyter/datascience-notebook:latest'
                }
            }
            steps {
                echo 'Testing Build Stage'
            }
        }
    }
}