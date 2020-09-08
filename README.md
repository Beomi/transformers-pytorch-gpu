# transformers-pytorch-gpu
💡 Docker setup for Huggingface 🤗 Transformers + GPU + Jupyter notebook + OhMyZsh 

## Features

- Base Docker image: NVIDIA PyTorch 20.08 (1.7.0)
  - Built-in PyTorch 1.7 & CUDA  
- Added `pip` packages:
  - jupyter
  - pytorch-lightning
  - neptune-client
  - transformers
  - emoji
  - soynlp
  - konlpy
- Custom uid support
- Zsh & OhMyZsh support
- Default LANG to `en_US.UTF-8`

## How to use

> 💡 Do this first! 💡

```shell
id -u && id -g
```

**If your result is like below:**

```bash
$ id -u && id -g
1000
1000
```

GOTO -> [Pull from dockerhub](#pull-from-dockerhub)

**Else:**

(example)
```
$ id -u && id -g
1004
1004
```

GOTO -> [Build from scratch](#build-from-scratch)

### Pull from dockerhub

```shell
git clone https://github.com/Beomi/transformers-pytorch-gpu
cd transformers-pytorch-gpu
docker pull beomi/transformers-pytorch-gpu:latest
./run.sh
```

Now open http://your-server-ip:42000 

Jupyter Notebook is waiting for you :)

### Build from scratch

```shell
git clone https://github.com/Beomi/transformers-pytorch-gpu
cd transformers-pytorch-gpu 
./build.sh
./run.sh
```

Now open http://your-server-ip:42000 

Jupyter Notebook is waiting for you :)
