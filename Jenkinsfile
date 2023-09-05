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
            when {
                expression {
                    // Only run Terraform plan stage for pull requests
                    return env.CHANGE_ID != null && env.CHANGE_BRANCH != null && env.CHANGE_TARGET != null
                }
            }
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            when {
                expression {
                    // Only run Terraform apply stage for merge events
                    return env.CHANGE_ID != null && env.CHANGE_BRANCH == 'main' && env.CHANGE_TARGET == 'main'
                }
            }
            steps {
                sh 'terraform apply -auto-approve -no-color'
            }
        }
    }
}

