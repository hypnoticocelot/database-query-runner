FROM openjdk:11-jdk-slim-buster AS builder

WORKDIR /app
COPY * /app/
COPY .mvn/ /app/.mvn/
RUN ./mvnw -B package --file pom.xml

FROM openjdk:11-jre-slim-buster

WORKDIR /app
COPY --from=builder /app/target/database-query-runner-1.0-SNAPSHOT.jar /app