pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'hatakekakashihk/webapp'
        DOCKER_REGISTRY = 'https://index.docker.io/v1/'
        DOCKER_CREDENTIALS = 'dockerhub-credentials'
    }
    
    stages {
        stage('Fetch code') {
            steps {
                git branch: 'main', url: 'https://github.com/Elevate-labs-intership/Task-2-CI-CD-JENKINS.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${BUILD_NUMBER}", ".")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry(DOCKER_REGISTRY, DOCKER_CREDENTIALS) {
                        dockerImage.push("${BUILD_NUMBER}")
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}