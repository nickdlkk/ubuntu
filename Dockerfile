FROM python:3.11-slim

RUN tee /etc/apt/sources.list.d/debian.sources <<EOF
    Types: deb
    URIs: https://mirrors.tuna.tsinghua.edu.cn/debian
    Suites: bookworm bookworm-updates bookworm-backports
    Components: main contrib non-free non-free-firmware
    Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
    EOF

# 设置时区（可选）和非交互模式
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    apt-transport-https && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*
    
CMD [ "/bin/bash" ]
