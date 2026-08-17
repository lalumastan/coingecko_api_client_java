ARG JVM=21
ARG TOMCAT=11.0.4

# Tomcat 9 implements the old javax.servlet API; Struts 7 / Jakarta EE 10
# requires jakarta.servlet (Servlet API 6.0+), which only Tomcat 10.1+
# provides. Using Tomcat 11 here for the latest jakarta-based release.
FROM tomcat:${TOMCAT}-jre${JVM}-temurin-jammy
ARG APP_NAME=coingecko_api_client_java

RUN rm -R ${CATALINA_HOME}/webapps.dist
COPY target/${APP_NAME}-1.0-SNAPSHOT.war ${CATALINA_HOME}/webapps/${APP_NAME}.war
