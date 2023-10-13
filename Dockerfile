FROM tomcat:latest
LABEL DEVOPS TEAM
ADD ./target/maven-demo-0.1-SNAPSHOT.jar /usr/local/tomcat/webapps
EXPOSE 8080
