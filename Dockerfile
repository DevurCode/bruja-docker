# Etapa de construcción
FROM ubuntu:latest AS build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .

RUN ./gradlew bootJar --no-daemon

# Etapa de producción
FROM eclipse-temurin:21-jre-alpine

# Crear un usuario no root
RUN addgroup -S spring && adduser -S spring -G spring

# Copiar el archivo JAR de Spring
COPY target/*.jar /opt/springboot-mysql-docker.jar

# Establecer el usuario no root como el usuario predeterminado
USER spring:spring

# Establecer el directorio de trabajo
WORKDIR /opt

# Punto de entrada para ejecutar la aplicación Spring Boot
ENTRYPOINT ["java", "-jar", "springboot-mysql-docker.jar"]

# Exponer el puerto 8080 al mundo exterior
EXPOSE 8080

















# FROM eclipse-temurin:21
# RUN mkdir /opt/app
# COPY springboot-mysql-docker.jar /opt/app
# CMD ["java", "-jar", "/opt/app/springboot-mysql-docker.jar"]
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