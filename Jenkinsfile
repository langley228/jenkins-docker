def agentLabel

agentLabel = "agent" + BRANCH_NAME

pipeline {
    agent {        
        node(agentLabel){
            echo "Hello world!"
            sh "sleep 20"
        }
    }
}
