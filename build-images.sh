#!/bin/bash

source build-image.inc.sh

IMAGES=(
  conda/base
  conda/light
  conda/cpu
  # conda/gpu
)

for img in ${IMAGES[@]}; do
  echo "Building image from ${img}"
  CONTEXT_DIR=$img
  source "${CONTEXT_DIR}/version.inc.sh"
  build_images
  tag_images
done
