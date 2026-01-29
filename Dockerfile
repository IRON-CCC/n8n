FROM n8nio/n8n:latest

LABEL "language"="nodejs"
LABEL "framework"="n8n"

# 安装 SSH 服务器（使用 apk 而不是 apt-get）
RUN apk add --no-cache openssh

# 创建 SSH 目录
RUN mkdir -p /run/sshd

# 设置 root 密码
RUN echo 'root:zeabur123' | chpasswd

# 允许 root 登录
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# 暴露端口
EXPOSE 22 3000

# 启动 SSH 和 n8n
CMD /usr/sbin/sshd && n8n start
