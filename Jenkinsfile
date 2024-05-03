pipeline {
    agent {
       node {
           label 'AGENT-1'
        }
        
    }
    //  environment { 
    //     packageVersion = ''
    //     nexusURL =  "172.31.95.33:8081"
    //  }
     options {
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds() 
    }
    parameters {
        string(name: 'version', defaultValue: '1.2.0', description: 'What is artifact version?')
        string(name: 'environment', defaultValue: 'dev', description: 'What is the encironment?')

    }
    stages {
        stage('print version') {
            steps {
                sh """
                   echo "version: ${params.version}"
                   echo "environment: ${params.environment}"
                """
            }
        }
        stage('terraform init') { 
            steps {
                sh """
                  cd terraform
                  terraform init -backend-config=${params.environment}/backend.tf -reconfigure
                """
            }
        }
        stage('terraform plan') { 
            steps {
                sh """
                  cd terraform
                  terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}"
                """
            }
        }
        stage('terraform apply') { 
            when { 
                expression { 
                    params.options ==  "apply"
                } 
            }
            steps {
                sh """
                  cd terraform
                  terraform apply -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -auto-approve
                """
            }
        }
        stage('terraform destroy') {
             when { 
                expression { 
                    params.options ==  "destroy"
                } 
            } 
            steps {
                sh """
                  cd terraform
                  terraform destroy -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -auto-approve
                """
            }
        }
    }        
    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()
        }
        failure { 
        echo 'this runs when pipeline is failed, used generally to send some alerts'
        }
        success{
        echo 'I will say Hello when pipeline is success'
        }
    }
    
}
    