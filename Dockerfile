# Build Stage
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy project files and build
COPY . .
RUN mvn clean package -DskipTests

# Runtime Stage
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
