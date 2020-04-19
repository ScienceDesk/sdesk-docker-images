#!/usr/bin/env bash

source version.inc.sh

SDESK_RUNTIME_IMAGE="$IMG:$TAG"

SDESK_CODE_DIR="$1"
shift
SDESK_PYTHON_ENTRYPOINT="$*"


# Install nvidia drivers to build the nvidia devs in /dev
install_nvidia() {
  curl -o NVIDIA.run https://s3.amazonaws.com/nvidia-gaming/NVIDIA-Linux-x86_64-435.22-grid.run
  sudo ./NVIDIA.run
}

# https://github.com/NVIDIA/nvidia-docker to tag the nvidia driver for docker.
#$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
#$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
#$ curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
#
#$ sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
#$ sudo systemctl restart docker

execute() {
  set -x
  docker run --gpus 'all' --rm \
    -e SDESK_PYTHON_ENTRYPOINT="$SDESK_PYTHON_ENTRYPOINT" \
    --mount type=bind,source="$SDESK_CODE_DIR",target=/code \
    "${SDESK_RUNTIME_IMAGE}"
  set +x
}

install_nvidia
execute
