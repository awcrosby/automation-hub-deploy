echo 'Running docker container...'

# NOTE: "env | grep MYVAR" from entrypoint works, not from cli
# docker run --env MYVAR1=value1 --rm -it $(docker build -q .) echo "env from cli:" && env | grep MYVAR
# docker run --net host --env ARTIFACT_DOWNLOAD_URL=localhost:5001/api/automation-hub/v3/artifacts/collections/awcrosby.collection_test.1.0.11 --rm -it $(docker build -q .)

# docker run --env ARTIFACT_DOWNLOAD_URL=http://e8101669.ngrok.io/api/automation-hub/v3/artifacts/collections/awcrosby.collection_test.1.0.11 --rm -it $(docker build -q .)


echo 'FROM quay.io/awcrosby/ans-test-dl-archive' >> Dockerfile

docker run --rm -it --env ARTIFACT_DOWNLOAD_URL=http://e8101669.ngrok.io/api/automation-hub/v3/artifacts/collections/awcrosby.collection_test.1.0.11 $(docker build -q .)

# NOTE: "env | grep MYVAR" from entrypoint works, not from cli
# docker run --env MYVAR1=value1 --rm -it $(docker build -q .) echo "env from cli:" && env | grep MYVAR

# rm Dockerfile