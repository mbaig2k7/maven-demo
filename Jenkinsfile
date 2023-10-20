pipeline {
  agent any
     tools { 
        maven 'MAVEN' 
        }
    stages{
        stage("mvn build") {
            steps {
                    sh 'mvn clean package'
         
                }
                }
        stage("Docker") {
            steps {
                    sh 'docker build . -t my-image:1.0.0'
         
                }
                }
       stage('Docker Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'Docker_credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        // Use the 'withCredentials' block to securely provide credentials

                        def dockerRegistryURL = 'hub.docker.com'
                        def dockerImageName = 'my-image:1.0.0'

                        sh """
                            echo \${DOCKER_PASSWORD} | docker login --username \${DOCKER_USERNAME} --password-stdin \${dockerRegistryURL}
                            docker push docker.io/mbaig2k7/my-image
                        """
                    }
                }
            }
        }
}

}
