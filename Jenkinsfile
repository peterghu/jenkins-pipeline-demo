pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker run -p 8888:8888 jupyter/scipy-notebook:b418b67c225b'
                echo 'Docker has sent a run command.'
            }
        }
    }
}
