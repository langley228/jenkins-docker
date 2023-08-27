export JENKINS_URL="http://192.168.1.107:28080"
export AGENT_NAME="agent1"
export AGENT_KEY="9a96d1badc671178bf1a69b1dea40e22a324252f71cf119fcdfc5e18b6276591"
docker run --rm -it --privileged --name agent --user root -v /var/run/docker.sock:/var/run/docker.sock -v /usr/local/bin/docker:/usr/local/bin/docker --init langley228/jenkins-agent -url $JENKINS_URL $AGENT_KEY $AGENT_NAME