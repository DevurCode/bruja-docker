# Utiliza la imagen base de OpenJDK 21
FROM eclipse-temurin:21

# Crea un directorio para la aplicación
RUN mkdir /opt/app

# Copia el archivo JAR precompilado (japp.jar) a la ubicación adecuada
COPY springboot-mysql-docker.jar /opt/app

# Establece el directorio de trabajo
WORKDIR /opt/app

# Ejecuta la aplicación Spring Boot
CMD ["java", "-jar", "springboot-mysql-docker.jar"]
















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