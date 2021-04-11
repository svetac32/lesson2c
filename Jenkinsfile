pipeline {
	environment {
	imagename = "sv32/jenkins"
	registryCredential = 'dockerhub_id'
	dockerIamge = ''
	}
	agent any
	stages {
#           stage('Cloning git') {
#                 steps {
#                     echo 'Hi, itisgood. Starting to build the App.'
#                 }
#                 }
            stage('Building Image') {
               steps {
                  script {
				dockerImage = docker.build svetac32/lesson2
			   }  
                    }
                 }
            stage('Push Image') {
               steps {
                     script {
			docker.withRegistry('', registryCredential) {
			  dockerImage.push("$BUILD_NUMBER")
			  dockerImage.push('latest')
                           }
                           }
			}
		}
            stage('Deploying now') {
              steps {
                sh "docker run --rm -d -p80:9090 mdsn/jenkins:latest"
                   }
                }
	}
