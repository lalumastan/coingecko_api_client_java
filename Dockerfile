ARG JVM=17
ARG MVN=3.9.6
ARG TOMCAT=9.0.86
ARG APP_NAME=coingecko_api_client_java
ARG APP_FOLDER=/usr/src/
ARG CGJ_APP_FOLDER=${APP_FOLDER}${APP_NAME}

FROM ubuntu

ARG JVM
ARG MVN
ARG APP_NAME
ARG APP_FOLDER
ARG CGJ_APP_FOLDER

RUN apt-get -y update
RUN apt-get -y install git
RUN apt-get -y install wget
RUN apt-get -y install openjdk-${JVM}-jdk-headless

RUN wget https://dlcdn.apache.org/maven/maven-3/${MVN}/binaries/apache-maven-${MVN}-bin.tar.gz -P /tmp
RUN tar xf /tmp/apache-maven-${MVN}-bin.tar.gz -C /opt
ENV JAVA_HOME=/usr/lib/jvm/java-${JVM}-openjdk-amd64
ENV M3_HOME=/opt/apache-maven-${MVN}
ENV MAVEN_HOME=/opt/apache-maven-${MVN}
ENV PATH=${M3_HOME}/bin:${PATH}

WORKDIR ${APP_FOLDER}
RUN git -c http.sslVerify=false clone https://github.com/lalumastan/${APP_NAME}.git
WORKDIR ${CGJ_APP_FOLDER}
RUN mvn package

FROM tomcat:${TOMCAT}-jdk${JVM}-corretto
ARG APP_NAME
ARG CGJ_APP_FOLDER

RUN rm -R ${CATALINA_HOME}/webapps.dist
COPY --from=0 ${CGJ_APP_FOLDER}/target/${APP_NAME}-1.0-SNAPSHOT.war ${CATALINA_HOME}/webapps/${APP_NAME}.war
