pipeline {
    agent any

    parameters {
        string(name: 'REGION', defaultValue: 'us-east-1', description: 'Select the region')
    }

    environment {
        AWS_DEFAULT_REGION = "${params.REGION}" // Set your desired AWS region
    }

    options {
        skipStagesAfterUnstable()
    }

    stages {
        stage('Install Terraform') {
            steps {
                script {
                    // Download and install Terraform
                    sh 'curl -LO https://releases.hashicorp.com/terraform/1.0.6/terraform_1.0.6_linux_amd64.zip'
                    sh 'unzip terraform_1.0.6_linux_amd64.zip'
                    sh 'sudo mv terraform /usr/local/bin/'
                    sh 'terraform --version'
                }
            }
        }

        stage('Checkout') {
            steps {
                // Checkout your code from the repository
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/Shoaibnadeemsk/TU-TF.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init -reconfigure'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

        // stage('Terraform destroy') {
        //     steps {
        //         sh 'terraform destroy -auto-approve'
        //     }
        // }
    }
}
