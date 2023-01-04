# For Java 8, try this
 FROM openjdk:8-jdk-alpine

# For Java 11, try this
#FROM adoptopenjdk/openjdk11:alpine-jre

# Refer to Maven build -> finalName
ARG JAR_FILE=target/dockerdemo.jar

# cd /opt/app
WORKDIR /app
COPY .mvn/ ./mvn
COPY mvnw pom.xml ./
#RUN ./mvnw dependency:resolve
COPY src ./src
CMD ["./mvn", "spring-boot:run"]



# cp target/dockerdemo.jar /opt/app/app.jar
#COPY ${JAR_FILE} app.jar

# java -jar /opt/app/app.jar
#ENTRYPOINT ["java","-jar","app.jar"]




