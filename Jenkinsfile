pipeline {
    agent {
        // Eğer Jenkins master node üzerinde çalışıyorsanız 'any' kullanabilirsiniz.
        // Docker komutları çalıştıracaksanız 'docker-enabled' gibi bir node label kullanabilirsiniz.
        label 'any'
    }

    environment {
        DOCKER_IMAGE = "yusufgzb/devops-app"  // Docker image adı (örn: yusufgzb/devops-app)
        DOCKER_TAG = "latest"                 // Docker tag (örn: latest)
    }

    stages {
        stage('Checkout') {
            steps {
                // Kodunuzu version kontrol sisteminden çekiyoruz
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Docker imajını build ediyoruz
                    sh """
                        docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ./cd python_pipeline-1
                    """
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Docker container'ını çalıştırıyoruz
                    sh """
                        docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG}
                    """
                }
            }
        }
    }

    post {
        always {
            // Docker imajını temizlemek için, opsiyonel
            script {
                sh "docker rmi ${DOCKER_IMAGE}:${DOCKER_TAG} || true"
            }
        }
    }
}
