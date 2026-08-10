pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Source code sudah diambil dari GitHub'
            }
        }

        stage('Test') {
            steps {
                echo 'Menjalankan test...'
                sh 'echo "Test berhasil"'
            }
        }

    }

    post {
        success {
            echo 'Pipeline berhasil!'
        }

        failure {
            echo 'Pipeline gagal!'
        }
    }
}