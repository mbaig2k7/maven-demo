FROM tomcat:latest
MAINTAINER DEVOPS TEAM
ADD ./target/maven-demo-0.1-SNAPSHOT.jar /usr/local/tomcat/webapps
RUN mkdir mavensample
EXPOSE 8080
