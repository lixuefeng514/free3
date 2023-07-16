# 指定基础镜像
FROM ubuntu:20.04

# 维护者信息
MAINTAINER xxx "xxx@example.com"

# 更新软件源并安装需要的软件
RUN apt-get update && apt-get install -y vim wget supervisor nginx tightvncserver

# 设置密码
RUN echo "235623" | vncpasswd -f >> /etc/vncpass

# 暴露端口 
EXPOSE 5901
EXPOSE 6080

# 启动supervisord
CMD ["/usr/bin/supervisord"]
