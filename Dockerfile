# For Java 8, try this


# For Java 11, try this
#FROM adoptopenjdk/openjdk11:alpine-jre

# Refer to Maven build -> finalName
#ARG JAR_FILE=target/dockerdemo.jar

# cd /opt/app


FROM openjdk:8-jdk-alpine as  builder
WORKDIR /opt/app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:resolve
COPY src ./src
RUN ./mvnw clean install

FROM openjdk:8-jdk-alpine
WORKDIR /opt/app
EXPOSE 8888
COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
ENTRYPOINT ["java", "-jar", "/opt/app/*.jar" ]

#CMD ["./mvnw", "spring-boot:run"]


# cp target/dockerdemo.jar /opt/app/app.jar
#COPY ${JAR_FILE} app.jar

# java -jar /opt/app/app.jar
#ENTRYPOINT ["java","-jar","app.jar"]




