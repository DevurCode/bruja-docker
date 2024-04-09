FROM maven AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn install

FROM openjdk:21
WORKDIR /app
COPY --from=build /app/target/springboot-mysql-docker.jar springboot-mysql-docker.jar
COPY src/main/resources/application.properties application.properties
ENTRYPOINT ["java", "-jar", "springboot-mysql-docker.jar"]
# FROM openjdk:21 AS build

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