pipeline {
    agent { docker { image 'docker jupyter/datascience-notebook:latest' } }
    stages {
        stage('build') {
            steps {
                sh 'python --version'
            }
        }
    }
}
