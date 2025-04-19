FROM docker.io/kicad/kicad:9.0

USER root

# Install dependencies for CLI tools, rendering, and OpenGL support
RUN apt-get update && apt-get install -y \\
    git make python3 python3-pip \\
    blender xvfb libgl1-mesa-dev libegl-mesa0 libglu1-mesa \\
 && apt-get clean

# Download and install FreeCAD AppImage
RUN mkdir -p /opt/freecad && \\
    wget https://github.com/FreeCAD/FreeCAD/releases/download/1.0.0/FreeCAD_1.0.0-conda-Linux-x86_64-py311.AppImage -O /opt/freecad/FreeCAD.AppImage && \\
    chmod +x /opt/freecad/FreeCAD.AppImage && \\
    ln -s /opt/freecad/FreeCAD.AppImage /usr/local/bin/freecadcmd

WORKDIR /workspace
