# FROM openjdk:11-jdk as builder 
# WORKDIR application
# EXPOSE 8080 5005
# ARG JAR_FILE=target/*.jar
# ADD ${JAR_FILE} application.jar
# RUN java -Djarmode=layertools -jar application.jar extract

FROM openjdk:11.0-jdk
# ENV server.port 8080
# ENV spring.profiles.active default
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java", "-cp", "app:app/lib/*", "org.eunsol.springbootexample.Application"]