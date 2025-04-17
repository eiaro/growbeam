FROM kicad/kicad:9.0

USER root

# Install KiCad 9 nightly CLI and dependencies
RUN apt-get update && apt-get install -y \
    git make python3 python3-pip \
    xvfb libglu1-mesa \
 && apt-get clean

# Install FreeCAD
RUN apt-get update && apt-get install -y freecad freecad-common

# Set up default working directory
WORKDIR /workspace
