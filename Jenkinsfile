def agentLabel

agentLabel = "agent" + BRANCH_NAME

pipeline {
    agent { label agentLabel }
    //...
    stages {
        stage('Example') {
            steps {
                script {
                    def output = sh(returnStdout: true, script: 'pwd')
                    echo "Output: ${output}"
                }
            }
        }
    }
}
