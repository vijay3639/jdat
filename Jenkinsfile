pipeline {
  agent any
  stages {
    stage('Building Docker Image') {
      steps{
        script {
          sh "docker build -t saidamo/cicd-poc-jenkins-ansible:$BUILD_NUMBER"
        }
      }
    }
    stage('Push Image To Docker Hub') {
      steps{
        script {
          sh "docker push :$BUILD_NUMBER"
          }
        }
      }
    }
}

