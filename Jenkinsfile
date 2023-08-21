pipeline {
    agent any

    parameters {
        string(name: 'REGION', defaultValue: 'us-east-1', description: 'Select the region')
    }

    environment {
        AWS_DEFAULT_REGION = "${params.REGION}"
        AWS_CONFIGURE = credentials('AWS_Cred')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/Shoaibnadeemsk/TU-TF.git'
            }
        }

        stage('aws setup Check') {
            steps {
                sh 'aws sts get-caller-identity'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
    }
}
