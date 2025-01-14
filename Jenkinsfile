pipeline {
    parameters {
        choice(name: 'terraformAction', choices: ['apply', 'destroy'], description: 'Choose the Terraform action to perform')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    agent any
    stages {
        stage('checkout') {
            steps {
                script {
                    dir("terraform") {
                        git branch: 'Project-Terraform', url: 'https://github.com/ManojKRISHNAPPA/MD_devops_rocksgroup.git'
                    }
                }
            }
        }

        stage('Plan') {
            steps {
                sh 'pwd;cd terraform/Jenkinsfile/ ; terraform init'
                sh "pwd;cd terraform/Jenkinsfile/ ; terraform plan -out tfplan"
                sh 'pwd;cd terraform/Jenkinsfile/ ; terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage('Approval') {
            steps {
                script {
                    def plan = readFile 'terraform/Jenkinsfile/tfplan.txt'
                    input message: "Do you want to proceed with the Terraform action?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }

        stage('Apply or Destroy') {
            when {
                expression {
                    return params.terraformAction == 'apply' || params.terraformAction == 'destroy'
                }
            }
            steps {
                script {
                    if (params.terraformAction == 'apply') {
                        sh "pwd;cd terraform/Jenkinsfile/ ; terraform apply -input=false tfplan"
                    } else if (params.terraformAction == 'destroy') {
                        sh "pwd;cd terraform/Jenkinsfile/ ; terraform destroy -auto-approve"
                    }
                }
            }
        }
    }
}
