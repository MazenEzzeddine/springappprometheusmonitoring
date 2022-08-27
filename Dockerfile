FROM centos:7

RUN yum -y update && yum -y install java-11-openjdk-headless openssl && yum -y clean all

# Set JAVA_HOME env var
ENV JAVA_HOME /usr/lib/jvm/java

ARG version=latest
ENV VERSION ${version}

#COPY ./scripts/ /bin
#COPY src/main/java/resources /bin/log4j2.properties

ADD target/spring-boot-with-metrics-0.0.1-SNAPSHOT.jar /

CMD ["java", "-jar" ,  "/spring-boot-with-metrics-0.0.1-SNAPSHOT.jar"]
