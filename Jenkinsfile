pipeline {
    agent any 

	  environment {
		    DOCKERHUB_CREDENTIALS = credentials('dockerhub-travis')
	  }

    stages {
        stage('Build') { 
            agent any 
            steps {
                sh 'docker build -t custom-jupyter dockerfiles/jupyterdatascience/.'
                echo 'Build Stage Complete'
            }
        }
      
        stage('Test') { 
            agent any
            steps {
                echo 'Test Stage Complete'
            }
        }
        stage('Docker Login') {
            steps {
			        	sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			      } 
        }

        stage('Push Image') {
			      steps {
                sh 'docker images'
                sh 'docker tag custom-jupyter traviscancode604/build-pipeline-demo'
				        sh 'docker images'
                sh 'docker push traviscancode604/build-pipeline-demo:latest'
			}
		}

    }
}