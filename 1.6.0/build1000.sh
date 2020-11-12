DOCKER_VERSION=1.6.0
docker build -t beomi/transformers-pytorch-gpu:$DOCKER_VERSION . \
           --build-arg UID=1000
