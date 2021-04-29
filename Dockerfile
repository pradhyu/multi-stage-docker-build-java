FROM adoptopenjdk/openjdk11 as builder
WORKDIR /app                        # Define where we put the files
COPY . .
RUN ./mvnw clean install 

# Second stage: assemble the runtime image
FROM node:10-alpine as final 
WORKDIR /app                        # Define work directory
COPY --from=builder /app/target/multistage-docker-build-java-0.0.1-SNAPSHOT.jar ./app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]