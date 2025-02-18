# Build Stage
FROM eclipse-temurin:21.0.2_13-jdk AS build
COPY . .
RUN ./mvnw clean package -DskipTests

# Runtime Stage
FROM eclipse-temurin:21.0.2_13-jdk-slim
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
