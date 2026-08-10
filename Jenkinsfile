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

        stage('Terraform Version') {
            steps {
                echo 'Memeriksa Terraform...'
                sh 'terraform version'
            }
        }

        stage('Docker Check') {
            steps {
                echo 'Memeriksa koneksi Docker...'
                sh 'docker ps'
            }
        }

        stage('Terraform Init') {
            steps {
                echo 'Menjalankan Terraform Init...'
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                echo 'Menjalankan Terraform Plan...'
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') { 
            steps { 
                                echo 'Membuat infrastructure dengan Terraform...' 
                                // hapus container lama bernama my-nginx jika ada, agar apply tidak gagal
                                sh '''
                                if [ -n "$(docker ps -a --filter \"name=my-nginx\" -q)" ]; then
                                    docker rm -f $(docker ps -a --filter "name=my-nginx" -q) || true
                                fi
                                '''
                                sh 'terraform apply -auto-approve' 
            } 
        }
    }

    post {
        success {
            echo 'CI Pipeline berhasil!'
        }

        failure {
            echo 'CI Pipeline gagal!'
        }
    }
}
