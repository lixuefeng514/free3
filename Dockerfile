# 指定基础镜像为ubuntu
FROM ubuntu:20.04

# 设置终端环境变量
ENV TERM xterm 

# 安装一些必要的组件
RUN apt-get update && apt-get install -y debconf-utils whiptail

# 设置时区为美国/纽约
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime

# 设置非交互模式
ENV DEBIAN_FRONTEND=noninteractive

# 更新软件源并安装需要的软件
RUN apt-get update && apt-get install -y vim wget nginx supervisor tightvncserver 

# 安装tzdata
RUN apt-get update && apt-get install -y tzdata

# 设置密码  
RUN echo "235623" | vncpasswd -f >> /etc/vncpass

# 暴露端口
EXPOSE 5901
EXPOSE 6080

# 启动supervisord
CMD ["/usr/bin/supervisord"]
