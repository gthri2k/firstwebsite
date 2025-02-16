pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git branch: 'main', url: 'https://github.com/gthri2k/firstwebsite'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                // Build process (can be adjusted based on your needs)
                bat 'dir'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add your test steps or commands here
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                sh 'docker build -t mywebsite:latest .'
            }
        }

        stage('Push Docker Image') {
            steps {
                // Login and push Docker image to Docker Hub
                sh '''
                docker login -u gthri -p Jpmc!2345
                docker tag mywebsite:latest gthri/mywebsite:latest
                docker push gthri/mywebsite:latest
                '''
            }
        }

        stage('Deploy Docker Container') {
            steps {
                sshPublisher(
                    publishers: [
                        sshPublisherDesc(
                            configName: 'MyRemoteServer', // Pre-configured in Jenkins SSH plugin
                            transfers: [
                                sshTransfer(
                                    execCommand: '''
                                    docker pull gthri/mywebsite:latest
                                    docker stop mywebsite || true
                                    docker rm mywebsite || true
                                    docker run -d -p 80:80 --name mywebsite gthri/mywebsite:latest
                                    '''
                                )
                            ]
                        )
                    ]
                )
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully! Deployment completed!'
        }
        failure {
            echo 'Pipeline failed. Please check the logs.'
        }
    }
}
