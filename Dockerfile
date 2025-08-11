# Dockerfile

FROM openjdk:17-jdk-alpine AS builder

# Set workdir
WORKDIR /app

# Copy Gradle wrapper and build files
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .

# Copy source code
COPY src src

# Make Gradle wrapper executable
RUN chmod +x ./gradlew

# Build the Spring Boot app (skip tests to speed up)
RUN ./gradlew clean build -x test

# ------------------------------------

FROM openjdk:17-jdk-alpine

# Copy jar from builder stage
COPY --from=builder /app/build/libs/*.jar app.jar

# Expose app port
EXPOSE 8200

# Run the app
ENTRYPOINT ["java", "-jar", "/app.jar"]
