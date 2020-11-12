# FROM nvcr.io/nvidia/cuda:10.1-devel-ubuntu18.04
FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel

EXPOSE 8888

# Zsh & Lang
RUN apt-get update && \
    apt-get install -y \
    zsh curl wget unzip git locales \
    libyaml-cpp-dev python-yaml screen sudo 

RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# PyTorch
# RUN pip3 install torch==1.6.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html

# Jupyter
RUN pip install jupyter

# ML
RUN pip install sklearn pandas

# DL
RUN pip install pytorch-lightning neptune-client neptune-notebooks

# NLP
RUN pip install \
        transformers \
        emoji soynlp konlpy \
		bokeh seaborn matplotlib \
		gensim spacy nltk tqdm \
		fairseq

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
