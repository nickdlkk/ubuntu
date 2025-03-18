FROM ubuntu:latest

RUN sed -i 's|http://archive.ubuntu.com|http://mirrors.aliyun.com|g; s|http://security.ubuntu.com|http://mirrors.aliyun.com|g' /etc/apt/sources.list.d/ubuntu.sources

# 设置时区（可选）和非交互模式
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    apt-transport-https && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i \
    -e 's|http://archive.ubuntu.com/ubuntu|https://mirrors.aliyun.com/ubuntu|g' \
    -e 's|http://security.ubuntu.com/ubuntu|https://mirrors.aliyun.com/ubuntu|g' \
    /etc/apt/sources.list && \
    apt-get update


RUN apt-get install -y \
        openssh-server \
        sudo && \
    rm -rf /var/lib/apt/lists/*
    
CMD [ "/bin/bash" ]
