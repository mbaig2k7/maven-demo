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
       }

}
