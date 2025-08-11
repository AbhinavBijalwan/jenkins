pipeline {
    agent any

    stages {
        stage('Without Docker') {
            steps {
                sh '''
                    echo "Without Docker"
                    ls -la
                    touch m-agent-m-hun.txt
                '''
            }
        }

        stage('With Docker') {
            agent {
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    echo "With Docker"
                    echo node -v
                    ls -la
                    touch m-container-m-hun.txt
                '''
            }
        }
    }
}
