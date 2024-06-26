FROM openjdk:21
ADD target/springboot-mysql-docker.jar springboot-mysql-docker.jar
ENTRYPOINT ["java", "-jar", "springboot-mysql-docker.jar"]

# Set environment variables
ENV SPRING_DATASOURCE_URL jdbc:mysql://db:3306/db_labrujastore?useSSL=false
ENV SPRING_DATASOURCE_USERNAME root
ENV SPRING_DATASOURCE_PASSWORD labruja12














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