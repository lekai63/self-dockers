FROM node:22-bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# 1. 安装基础依赖、Python3 和 Tmux
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    tmux \
    curl \
    git \
    nano \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 2. 安装 Claude Code 官方包
RUN npm install -g @anthropic-ai/claude-code

# 3. 下载官方明确指定的 Web Server 预编译包 (注意这里的文件名变化)
ENV CC_SWITCH_VERSION="v0.10.1"
RUN curl -L -o /usr/local/bin/cc-switch-web \
    "https://github.com/Laliet/cc-switch-web/releases/download/${CC_SWITCH_VERSION}/cc-switch-server-linux-x86_64" && \
    chmod +x /usr/local/bin/cc-switch-web

WORKDIR /workspace
