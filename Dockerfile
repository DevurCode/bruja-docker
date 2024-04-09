FROM openjdk:21
VOLUME /tmp
EXPOSE 8080
ARG JAR_FILE=target/springboot-mysql-docker.jar
ADD ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]# FROM openjdk:21 AS build

# WORKDIR /app

# COPY pom.xml mvnw ./
# RUN chmod +x mvnw
# COPY .mvn .mvn
# RUN ./mvnw dependency:resolve

# COPY src src
# RUN ./mvnw package -Dmaven.test.skip

# # For Java 21,
# FROM adoptopenjdk/openjdk21:alpine-jre

# WORKDIR /app

# COPY --from=build /app/target/*.jar ./springboot-mysql-docker.jar

# ENTRYPOINT ["java","-jar","springboot-mysql-docker.jar"]