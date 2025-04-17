FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install KiCad 9 nightly CLI and dependencies
RUN apt update && apt install -y software-properties-common \
 && add-apt-repository -y ppa:kicad/kicad-9.0-releases \
 && apt update && apt install -y \
    kicad kicad-cli \
    git make python3 python3-pip \
    xvfb libglu1-mesa \
 && apt clean

# Set up default working directory
WORKDIR /workspace
