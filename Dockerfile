FROM mcr.microsoft.com/mirror/docker/library/ubuntu:22.04


ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    software-properties-common \
    ca-certificates \
    gnupg \
    lsb-release \
    zip \
    unzip \
    sudo \
    bash \
    xvfb \
    jq \
    tree \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

ENV NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt
ENV NVM_DIR=/opt/nvm
RUN mkdir -p "$NVM_DIR" \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash \
    && . /opt/nvm/nvm.sh && nvm install 22 \
    && echo '. /opt/nvm/nvm.sh' > /opt/activate_node.sh \
    && chmod +x /opt/activate_node.sh

RUN . /opt/activate_node.sh \
    && ln -s "$(which node)" /usr/local/bin/node \
    && ln -s "$(which npm)" /usr/local/bin/npm \
    && ln -s "$(which npx)" /usr/local/bin/npx