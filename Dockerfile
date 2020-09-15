FROM nvcr.io/nvidia/pytorch:20.08-py3

EXPOSE 8888

# Zsh & Lang
RUN apt-get update && \
    apt-get install -y \
    zsh curl wget unzip git locales \
    libyaml-cpp-dev python-yaml screen sudo

RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Jupyter
RUN pip install jupyter

# ML
RUN pip install sklearn pandas numpy

# DL (Pytorch 1.7 installed)
RUN pip install pytorch-lightning neptune-client neptune-notebooks

# NLP
RUN pip install \
        transformers \
        emoji soynlp
RUN pip install konlpy 

# Create User with ZSH
ARG UID=1000
ARG GID=1000
RUN adduser --uid ${UID} --disabled-password --gecos "" user
RUN adduser user sudo
USER user
WORKDIR /home/user
# User Level Setup
RUN jupyter nbextension enable --py neptune-notebooks
ENV SHELL /usr/bin/zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN mkdir /home/user/code
