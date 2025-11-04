# heatseek

## Development with Desktop Environment

This repository is configured with a devcontainer that includes a desktop environment accessible via noVNC. This allows you to debug desktop applications directly in GitHub Codespaces or VS Code with Dev Containers.

### Accessing the Desktop

1. Open this repository in GitHub Codespaces or VS Code with Dev Containers
2. Wait for the container to build and start
3. Once ready, you'll see a notification about forwarded ports
4. Open the forwarded port 6080 in your browser
5. Navigate to `http://localhost:6080/vnc.html` (or use the forwarded port URL)
6. Click "Connect" and enter the password: `vscode`
7. You now have access to a full XFCE desktop environment!

### What's Included

- **Desktop Environment**: XFCE4 (lightweight and fast)
- **VNC Server**: TigerVNC running on port 5901
- **noVNC**: Web-based VNC client on port 6080
- **Python**: Python 3.11 with standard development tools
- **Display**: Set to `:1` with 1920x1080 resolution

### Running Desktop Applications

You can run any desktop application from the terminal in Codespaces:

```bash
# The application will open in the noVNC desktop
xterm &
firefox &
# or any other GUI application
```

### Troubleshooting

If the desktop doesn't appear:
1. Check that the VNC server is running: `ps aux | grep vnc`
2. Restart the VNC server: `vncserver -kill :1 && vncserver :1 -geometry 1920x1080 -depth 24`
3. Restart noVNC: `pkill websockify && websockify -D --web=/usr/share/novnc/ 6080 localhost:5901`