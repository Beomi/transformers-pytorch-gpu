# FROM nvcr.io/nvidia/cuda:10.1-devel-ubuntu18.04
FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel

EXPOSE 8888

# Zsh & Lang
RUN apt-get update && \
    apt-get install -y \
    zsh curl wget unzip git locales \
    libyaml-cpp-dev python-yaml screen \
    sudo htop \
    llvm-9-dev cmake git-lfs vim 

RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

COPY requirements.txt .
RUN pip install -r requirements.txt

# ZeroOffload
RUN pip install cpufeature
RUN git clone -q https://github.com/microsoft/DeepSpeed && cd DeepSpeed && \
    git submodule update --init --recursive && \
    DS_BUILD_SPARSE_ATTN=1 DS_BUILD_CPU_ADAM=1 bash install.sh -n -r && \
    cd DeepSpeedExamples/Megatron-LM && \
    pip install -r requirements.txt

# Create User with ZSH
ARG UID=1000
ARG GID=1000
RUN adduser --uid ${UID} --disabled-password --gecos "" user
RUN adduser user sudo
RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN cat /etc/sudoers
USER user
WORKDIR /home/user

# User Level Setup
RUN jupyter nbextension enable --py neptune-notebooks
ENV SHELL /usr/bin/zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
RUN mkdir /home/user/code
ENV PATH $PATH:/home/user/.local/bin
ENV PYTHONPATH /home/user/.local/lib/python3.7/site-packages
