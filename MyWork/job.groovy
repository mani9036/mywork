pipeline{
    agent any 
        stages{
            stage('Clone the code'){
                steps{
                    git branch: 'main',
                    credentialsId: 'git-credentials',
                    url: 'https://github.com/user/repository.git'
                }
            }

            stage ('Build stage'){
                steps{
                    sh 'mvn clean install'
                }
            }

            stage ('Deploy'){
                steps{
                    sh 'helm upgrade myapp ./chart'
                }
            }
        }
        post{
            failure {
                echo 'deploy failed:rollbacking to previous version'
                sh 'helm rollback myapp'
            }

            success{
                echo 'deployed successfully'
            }

            always{
                cleanWs()
            }
        }
}