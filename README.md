# CI/CD integration with multi stage builds
```bash
# use stage 1 in multi stage build to build java and test
docker build --target builder . -t builder

#Create the container from the image we just built and retrieve
# its id.
id=$(docker create builder) 
    # copy junit reports for bamboo reporting 
docker cp $id:/app/target/surefire-reports ./surefire-reports 
# Delete the container 
docker rm $id

# now if test pass to run everything and docker image
docker build . -t multistage-docker-build-java

# docker images size check

```