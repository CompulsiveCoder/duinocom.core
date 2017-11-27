pipeline {
    agent any
    triggers {
        pollSCM 'H/30 * * * *'
    }
    stages {
        stage('Prepare') {
            steps {
                sh 'echo "Skipping prepare.sh." # sh prepare.sh'
            }
        }
        stage('Init') {
            steps {
                sh 'sh init.sh'
            }
        }
        stage('Build') {
            steps {
                sh 'sh build.sh'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
