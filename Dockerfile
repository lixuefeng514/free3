# 指定基础镜像为ubuntu
FROM ubuntu:20.04

# 设置终端环境变量
ENV TERM xterm

# 安装一些必要的组件
RUN apt-get update && apt-get install -y debconf-utils whiptail

# 更新软件源并安装需要的软件
RUN apt-get update && apt-get install -y vim wget nginx supervisor tightvncserver

# 设置时区为上海
ENV TZ Asia/Shanghai

# 安装tzdata,跳过交互提示
RUN DEBIAN_FRONTEND=noninteractive tzdata -u -A -f /etc/localtime

# 设置密码
RUN echo "235623" | vncpasswd -f >> /etc/vncpass

# 暴露端口
EXPOSE 5901
EXPOSE 6080 

# 启动supervisord
CMD ["/usr/bin/supervisord"]
