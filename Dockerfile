version: '3'

services:

  ubuntu:
    image: ubuntu:20.04
    privileged: true
    tty: true
    
    ports:
      - "5901:5901"  

    environment:
      - VNC_PASSWORD=235623
    
    command: 
      - /bin/sh
      - -c
      - |
        apt-get update
        apt-get install -y tightvncserver
        # 设置密码
        echo "$VNC_PASSWORD" | vncpasswd -f >> /etc/vncpass
        # 启动vncserver
        tightvncserver :1 -geometry 1280x800 -depth 24
        
    volumes:
      - ubuntu-data:/data

volumes:
  ubuntu-data:
