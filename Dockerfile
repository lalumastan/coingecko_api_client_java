ARG JVM=21
ARG TOMCAT=9.0.86

FROM tomcat:${TOMCAT}-jdk${JVM}-temurin-jammy
ARG APP_NAME=coingecko_api_client_java

RUN rm -R ${CATALINA_HOME}/webapps.dist
COPY target/${APP_NAME}-1.0-SNAPSHOT.war ${CATALINA_HOME}/webapps/${APP_NAME}.war