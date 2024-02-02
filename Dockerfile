FROM debian:11-slim

ENV PYENV_ROOT /root/.pyenv

RUN echo "**** install libraries ****" && \
  apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    aria2 \
    build-essential \
    curl \
    gdb \
    git \
    lcov \
    libbz2-dev \
    libffi-dev \
    libgdbm-compat-dev \
    libgdbm-dev \
    liblzma-dev \
    libncurses5-dev \
    libreadline6-dev \
    libsqlite3-dev \
    libssl-dev \
    lzma \
    lzma-dev \
    pkg-config \
    python3-dev \
    python3-pip \
    tk-dev \
    uuid-dev \
    wget \
    zlib1g-dev \
    zsh && \
  echo "**** install python packages ****" && \
    python3 -m pip install -U pip && \
    python3 -m pip install poetry tox && \
  echo "**** configure poetry ****" && \
    poetry config virtualenvs.create true && \
    poetry config virtualenvs.in-project true && \
  echo "**** install pyenv ****" && \
    git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT && \
  echo "**** cleanup ****" && \
    apt-get clean && \
    rm -rf \
      /tmp/* \
      /var/lib/apt/lists/* \
      /var/tmp/*
