pipeline {
    agent any
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
        stage('Clean') {
            when { expression { !shouldSkipBuild() } }
            steps {
                sh 'sh clean.sh'
            }
        }
        stage('Nuget') {
            when { expression { !shouldSkipBuild() } }
            steps {
                shHide( 'sh nuget-set-api-key.sh ${NUGETTOKEN}' )
                sh 'sh nuget-pack-and-push.sh'
            }
        } 
        stage('Graduate') {
            when { expression { !shouldSkipBuild() } }
            steps {
                sh 'sh graduate.sh'
            }
        }
        stage('Increment Version') {
            when { expression { !shouldSkipBuild() } }
            steps {
              sh 'sh increment-version.sh'
            }
        }
        stage('Push Version') {
            when { expression { !shouldSkipBuild() } }
            steps {
                sh 'sh push-version.sh'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}

