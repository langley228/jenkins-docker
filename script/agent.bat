docker run --rm -it --privileged --name agent2 --user root -v /var/run/docker.sock:/var/run/docker.sock -v /usr/local/bin/docker:/usr/local/bin/docker --init langley228/jenkins-agent -url %JENKINS_URL% %AGENT_KEY% %AGENT_NAME%