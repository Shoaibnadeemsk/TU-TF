pipeline {
    agent any

    tools {
        terraform 'terraform'
    }

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

        stage('Checkout') {
            steps {
                // Checkout your code from the repository
                git branch: 'main', changelog: false, credentialsId: 'Git_credentials', poll: false, url: 'https://github.com/Shoaibnadeemsk/TU-TF.git'
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
