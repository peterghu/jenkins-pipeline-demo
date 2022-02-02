pipeline {
    agent none 
    stages {
        stage('Build') { 
            agent {
                docker {
                    image 'jupyter/datascience-notebook'
                }
            }
            steps {
                echo 'Testing Build Stage'
            }
        }
    }
}