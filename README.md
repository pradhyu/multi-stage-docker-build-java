docker build --target builder -t builder -f .

```bash
#Create the container from the image we just built and retrieve
# its id.
id=$(docker create builder) 
#npm run test and coverage spit their results in a folder called
# results, so we copy these files from container to local host
docker cp $id:/app/target/surefire-reports ./surefire-reports 
# Delete the container 
docker rm $id

#
docker build . -t multistage-docker-build-java
```