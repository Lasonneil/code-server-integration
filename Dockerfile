FROM codercom/code-server:latest

LABEL MAINTAINER="feicube.com(lasonneil@gmail.com)"

# 使用 root 用户安装工具
USER root

# 安装 Node.js、Vim、Python 和其他工具
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get update && \
    apt-get install -y \
    nodejs \
    vim \
    cron \
    trash-cli \
    build-essential \
    python3 \
    python3-pip \
    python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 全局安装 Hexo 和 Hexo-CLI
RUN npm install -g hexo-cli

RUN echo "alias ll='ls -l'" >> /root/.bashrc

# 确保别名生效
SHELL ["/bin/bash", "-c"]
