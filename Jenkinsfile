pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/gthri2k/firstwebsite'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                bat 'dir'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }

        stage('Deploy') {
            steps {
                // Use SSH to copy files to the remote server
                sshPublisher(
                    publishers: [
                        sshPublisherDesc(
                            configName: 'MyRemoteServer', // Configured in Jenkins SSH plugin
                            transfers: [
                                sshTransfer(
                                    sourceFiles: '**/*', // Adjust to deploy only necessary files
                                    remoteDirectory: '/var/www/mywebsite', // Target directory on the remote server
                                    removePrefix: '', // Remove base path (if needed)
                                    cleanRemote: false // Set true to clean target directory before deployment
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
            echo 'Deployment completed successfully!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}

stage('Build Docker Image') {
    steps {
        sh 'docker build -t mywebsite:latest .'
    }
}
