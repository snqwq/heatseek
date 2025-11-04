#!/bin/bash

# Start VNC server
vncserver :1 -geometry 1920x1080 -depth 24 &

# Wait for VNC server to start
sleep 5

# Start noVNC websockify proxy
websockify -D --web=/usr/share/novnc/ 6080 localhost:5901

echo ""
echo "========================================"
echo "noVNC Desktop is now available!"
echo "========================================"
echo "Access the desktop at: http://localhost:6080/vnc.html"
echo "VNC Password: vscode"
echo "========================================"
echo ""
