FROM eclipse-temurin:21.0.2_13-jdk
COPY . .
RUN mvn clean package -DskipTests -X  

From eclipse-temurin:21.0.2_13-jdk-slim
COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demor.jar"]