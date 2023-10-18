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
       stage('Login') {
            steps {
            withDockerRegistry(credentialsId: 'Docker_credentials', url: 'https://hub.docker.com/repository/docker/mbaig2k7/docker_images/general') {
    
}          }
}
}

}
