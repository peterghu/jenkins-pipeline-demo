pipeline {
    agent { docker { image 'jupyter/datascience-notebook:latest' } }
    stages {
        stage('Build') {
            steps {
                sh 'python --version'
            }
        }
    }
}