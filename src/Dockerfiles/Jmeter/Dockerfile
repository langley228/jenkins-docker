FROM node:lts-alpine AS mongosh
RUN apk add --update --no-cache mongodb-tools git bash
RUN npm install -g mongosh

FROM mongosh AS build

ARG JMETER_VERSION="5.3"
ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV	JMETER_BIN	${JMETER_HOME}/bin
ENV	JMETER_DOWNLOAD_URL  https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

RUN apk update \
	&& apk upgrade \
	&& apk add ca-certificates \
	&& update-ca-certificates \
	&& apk add --update openjdk8-jre tzdata curl unzip bash \
	&& apk add --no-cache nss \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /tmp/dependencies  \
	&& curl -L --silent ${JMETER_DOWNLOAD_URL} >  /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz  \
	&& mkdir -p /opt  \
	&& mkdir -p /opt/data  \
	&& tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt  \
	&& rm -rf /tmp/dependencies

FROM build AS jmeter

# Set global PATH such that "jmeter" command is found
ENV PATH $PATH:$JMETER_BIN

RUN ls
COPY ./test-plan /opt/data/test-plan
# Entrypoint has same signature as "jmeter" command
COPY test.sh /opt/data

WORKDIR	/opt/data

ENTRYPOINT []
