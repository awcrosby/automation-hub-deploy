echo 'Running docker container...'

# echo 'FROM quay.io/awcrosby/ans-test-with-archive' >> Dockerfile

echo 'FROM quay.io/awcrosby/galaxy-ansible-test
COPY awcrosby-collection_test-1.0.2.tar.gz /archive
' >> Dockerfile

# docker run --rm -it $(docker build -q .)
docker exec -it $(docker build -q .) bash

# NOTE: "env | grep MYVAR" from entrypoint works, not from cli
# docker run --env MYVAR1=value1 --rm -it $(docker build -q .) echo "env from cli:" && env | grep MYVAR

# rm Dockerfile
