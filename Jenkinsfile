pipeline {
	environment {
	imagename = "sv32/jenkins"
	registryCredential = 'dockerhub_id'
	dockerIamge = ''
	}
	agent any
	stages {
           stage('Cloning git') {
                 steps {
                     echo 'Hi, TRying to clone in RAIF.'
                 }
                 }
            stage('Building Image') {
               steps {
                  script {
				dockerImage = docker.build imagename
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
                sh "docker run --rm -d -p80:9090 svetac32/lesson2:latest"
                   }
                }
	}
}