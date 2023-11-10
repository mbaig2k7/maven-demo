pipeline {
  agent any
     tools { 
        maven 'maven' 
        }
    stages{
        stage("mvn build") {
            steps {
                    sh 'mvn clean package'
         
                }
                }
       stage("Docker") {
            steps {
                    sh 'docker build . -t myimages:1.0.3'
         
                }
                }
       stage('Docker Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'Docker_credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Use the 'withCredentials' block to securely provide credentials

                        def dockerRegistryURL = 'hub.docker.com'
                        def dockerImageName = 'myimages:1.0.3'

                        sh """
                            echo \${DOCKER_PASSWORD} | docker login --username \${DOCKER_USERNAME} --password-stdin \${dockerRegistryURL}
                            docker push docker.io/mbaig2k7/myimages:1.0.3
                        """
                    }
                }
            }
        }
}

}
