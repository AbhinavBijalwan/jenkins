pipeline {
    agent any

    stages {
        stage('Build and Run with Docker Compose') {
            steps {
                sh '''
                    echo "Stopping any previous containers..."
                    docker compose down || true

                    echo "Building and starting app..."
                    docker compose up --build
                    docker ps
                '''
            }
        }
    }
}
