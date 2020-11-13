DOCKER_VERSION=1.6.0-ZeroOffload
TODAY=$(date +%Y%m%d)
echo "Version: $DOCKER_VERSION.$TODAY"
docker build -t beomi/transformers-pytorch-gpu:$DOCKER_VERSION.$TODAY . \
           --build-arg UID=$(id -u)
