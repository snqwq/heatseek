FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install desktop environment and VNC server
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    dbus-x11 \
    x11-xserver-utils \
    tigervnc-standalone-server \
    tigervnc-common \
    novnc \
    websockify \
    python3-numpy \
    net-tools \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Set up VNC password directory
RUN mkdir -p /home/vscode/.vnc

# Set VNC password (password: vscode)
RUN echo "vscode" | vncpasswd -f > /home/vscode/.vnc/passwd \
    && chmod 600 /home/vscode/.vnc/passwd \
    && chown -R vscode:vscode /home/vscode/.vnc

# Set up VNC xstartup script
RUN echo '#!/bin/bash\n\
xrdb $HOME/.Xresources\n\
startxfce4 &' > /home/vscode/.vnc/xstartup \
    && chmod +x /home/vscode/.vnc/xstartup \
    && chown vscode:vscode /home/vscode/.vnc/xstartup

# Create a symlink to the noVNC web files
RUN ln -s /usr/share/novnc /home/vscode/novnc

USER vscode

# Set display environment variable
ENV DISPLAY=:1
