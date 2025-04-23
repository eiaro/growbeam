FROM ubuntu:24.04
LABEL AUTHOR Ronny Eia
LABEL Description="Export various files from KiCad projects (KiCad 9)"

ENV DEBIAN_FRONTEND=noninteractive

# Install base packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common lsb-release xz-utils \
    wget curl gnupg2 git make python3-venv \
    libgl1-mesa-dev libegl-mesa0 libglu1-mesa xvfb ca-certificates \
    unzip zip \
    inkscape \
    && rm -rf /var/lib/apt/lists/*

# --- VENV & Python avinstallasjoner ---
ENV VENV_PATH=/venv
RUN python3 -m venv $VENV_PATH
ENV PATH="$VENV_PATH/bin:$PATH"

# --- Installer Pythonverktøy ---
RUN pip install --upgrade pip
RUN pip install --no-cache-dir \
    mkdocs-material \
    pymdown-extensions \
    mkdocs-include-markdown-plugin \
    pandas \
    tabulate

# Install KiCad 9.0 (via PPA)
RUN add-apt-repository -y ppa:kicad/kicad-9.0-releases && \
    apt-get update && \
    apt-get install -y kicad && \
    apt-get clean

# Install Blender 4.2 LTS manually
RUN mkdir -p /opt/blender && \
    wget https://ftp.halifax.rwth-aachen.de/blender/release/Blender4.2/blender-4.2.9-linux-x64.tar.xz && \
    tar -xJf blender-4.2.9-linux-x64.tar.xz -C /opt/blender --strip-components=1 && \
    ln -s /opt/blender/blender /usr/local/bin/blender && \
    rm -f blender-4.2.9-linux-x64.tar.xz 

# Install FreeCAD 1.0.0 as AppImage
RUN mkdir -p /opt/freecad && \
    wget https://github.com/FreeCAD/FreeCAD/releases/download/1.0.0/FreeCAD_1.0.0-conda-Linux-x86_64-py311.AppImage -O /opt/freecad/FreeCAD.AppImage && \
    chmod +x /opt/freecad/FreeCAD.AppImage && \
    cd /opt/freecad && ./FreeCAD.AppImage --appimage-extract && \
    ln -s /opt/freecad/squashfs-root/usr/bin/freecadcmd /usr/local/bin/freecadcmd

# Get pcb2blender addon
RUN wget https://github.com/30350n/pcb2blender/archive/refs/heads/master.zip -O /tmp/pcb2blender.zip && \   
    unzip /tmp/pcb2blender.zip -d /opt/ && \
    rm -f /tmp/pcb2blender.zip && \
    mv /opt/pcb2blender-master /opt/pcb2blender && \
    cp -R /opt/pcb2blender/pcb2blender_exporter /usr/share/kicad/scripting/plugins/

# Install the addon
RUN blender --online-mode -b --command extension sync
RUN blender --online-mode -b --command extension install --enable pcb3d_importer
RUN blender --online-mode -b --command extension install --enable web3d_x3d_vrml2_format

# Set working directory
WORKDIR /workspace