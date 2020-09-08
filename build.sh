export UID=$(id -u)
export GID=$(id -g)
docker build -t beomi/transformers-pytorch-gpu:1.7.0 . \
           --build-arg UID=$UID  
