pipeline {
  agent any
  environment {
        // Set your Kubernetes cluster configuration
        KUBE_CONFIG = credentials('kube-config-id')
        // Set the Kubernetes namespace
        NAMESPACE = 'examplepod'
        // Set the name of your Kubernetes deployment
        DEPLOYMENT_NAME = 'your-deployment-name'
    }
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
      stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Configure kubectl with the provided kubeconfig
                    withKubeConfig(credentialsId: 'kube-config-id', serverUrl: 'https://your-kube-api-server') {
                        // Deploy the application to Kubernetes
                        sh "kubectl apply -f kubernetes-manifests/deployment.yaml --namespace=${NAMESPACE}"
                    }
                }
            }
      }
}

}
