pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
    }

    stages {
        stage('Terraform Init') {
            steps {
                script {
                    // Checkout the code from your repository
                    checkout scm

                    // Run Terraform Init
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Run Terraform Plan
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Run Terraform Apply
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                script {
                    // Run Terraform Destroy
                    sh 'terraform destroy -auto-approve'
                }
            }
        }
    }
}
