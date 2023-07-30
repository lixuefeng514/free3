# 基础镜像使用ubuntu
FROM ubuntu:20.04

# 安装VNC相关软件
RUN apt-get update && apt-get install -y xfce4 xfce4-goodies tightvncserver

# 设置VNC参数
ENV VNC_PORT 5901
ENV VNC_RESOLUTION 1280x800
ENV VNC_DPI 96

# 复制配置文件到容器内
COPY vnc/xstartup /tmp/xstartup

# 启动容器时运行VNC
CMD ["/bin/bash", "/tmp/xstartup"] 

# VNC启动脚本
RUN mkdir /tmp/vnc \
    && chown -R root /tmp/vnc
COPY vnc/xstartup /tmp/vnc/
RUN chmod +x /tmp/vnc/xstartup
EXPOSE 5901
#!/bin/bash
# 启动xfce桌面
startxfce4 & 

# 设置vnc密码
echo "123456" | vncpasswd -f > /home/password.txt
chmod 600 /home/password.txt

# 启动vnc服务
vncserver -geometry ${VNC_RESOLUTION} -depth 16 -dpi ${VNC_DPI} :${VNC_PORT}

tail -F /dev/null
