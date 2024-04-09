# Etapa de construcción
FROM openjdk-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa final
FROM openjdk:21
WORKDIR /app
COPY --from=build /app/target/springboot-mysql-docker.jar springboot-mysql-docker.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "springboot-mysql-docker.jar"]

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