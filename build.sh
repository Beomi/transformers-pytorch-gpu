export UID=$(id -u)
export GID=$(id -g)
DOCKER_VERSION=1.6.0
docker build -t beomi/transformers-pytorch-gpu:$DOCKER_VERSION . \
           --build-arg UID=$UID 
docker tag beomi/transformers-pytorch-gpu:$DOCKER_VERSION \
           beomi/transformers-pytorch-gpu:latest
