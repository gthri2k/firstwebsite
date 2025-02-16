pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clone the GitHub repository
                git branch: 'main', url: 'https://github.com/gthri2k/firstwebsite'
            }
        }

        stage('Build') {
            steps {
                // Add your build step (replace 'echo' with actual commands)
                echo 'Building the project...'
                bat 'dir' // For Windows (lists files in the repo)
            }
        }

        stage('Test') {
            steps {
                // Add your test commands here
                echo 'Running tests...'
                bat 'echo No tests defined yet.'
            }
        }

        stage('Archive Artifacts') {
            steps {
                // Archive HTML or other artifacts
                archiveArtifacts artifacts: '*.html', allowEmptyArchive: true
            }
        }
    }

    post {
        success {
            echo 'Build completed successfully!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
