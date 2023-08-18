pipeline {

    agent any

    tools {

      "Terraform-v1.5.3"

    }

   parameters {

        string(name: 'REGION', defaultValue: 'us-east-1', description: 'Select the region')

    }

    environment {

        AWS_DEFAULT_REGION = "${params.REGION}" // Set your desired AWS region

        AWS_CONFIGURE = credentials('AWS_Cred')

        //  withCredentials([aws(credentialsId: 'aws_credentials', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')])

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

 

        // stage('Terraform Apply') {

 

        //     steps {

        //         sh 'terraform apply -auto-approve'

        //     }

        // }  

 

        // stage('Terraform destroy') {

        //     steps {

        //         sh 'terraform destroy -auto-approve'

        //     }

        // }  

 

    }

}
