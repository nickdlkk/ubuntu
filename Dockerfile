FROM node:20-bullseye

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
    libvips-dev \
    build-essential \
    apt-transport-https && \
    rm -rf /var/lib/apt/lists/*

# 设置npm淘宝镜像源并安装pnpm
RUN npm config set registry https://registry.npmmirror.com && \
    # 安装指定版本的pnpm（可修改版本号）
    npm install -g pnpm@8 && \
    # 设置pnpm淘宝镜像源
    pnpm config set registry https://registry.npmmirror.com && \
    # 清理缓存减小镜像体积
    npm cache clean --force && \
    pnpm store prune

CMD [ "/bin/bash" ]
