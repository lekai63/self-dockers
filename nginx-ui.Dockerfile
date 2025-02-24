FROM uozi/nginx-ui:latest

# 安装SSH客户端
RUN apt-get update && \
    apt-get install -y openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
