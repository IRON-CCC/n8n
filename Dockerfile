FROM n8nio/n8n:latest  
LABEL "language"="nodejs"  
LABEL "framework"="n8n"  
# 安装 SSH 服务器  
RUN apt-get update && apt-get install -y openssh-server && rm -rf /var/lib/apt/lists/*  
# 创建 SSH 目录  
RUN mkdir -p /run/sshd  
# 设置 root 密码（你需要修改这个）  
RUN echo 'root:zeabur123' | chpasswd  
# 允许 root 登录  
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config  
# 暴露端口  
EXPOSE 22 3000  
# 启动 SSH 和 n8n  
CMD service ssh start && n8n start
