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
       
            }
}

