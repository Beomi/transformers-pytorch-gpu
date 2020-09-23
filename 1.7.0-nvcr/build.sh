export UID=$(id -u)
export GID=$(id -g)
DOCKER_VERSION="1.7.0-nvcr"
docker build -t beomi/transformers-pytorch-gpu:$DOCKER_VERSION . \
           --build-arg UID=$UID 
