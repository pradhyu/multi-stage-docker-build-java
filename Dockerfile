FROM adoptopenjdk/openjdk11 as builder
WORKDIR /app
COPY . .
RUN ./mvnw clean install 

# Second stage: assemble the runtime image
FROM adoptopenjdk/openjdk11 as final 
WORKDIR /app
# fixme: get the jar name from the env variable 
COPY --from=builder /app/target/multistage-docker-build-java-*.jar ./app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]