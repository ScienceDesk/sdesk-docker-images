#!/bin/bash

source build-image.inc.sh

IMAGES=(
  conda/base
  conda/light
  conda/cpu
  conda/cpu-t
#  conda/gpu
)

if [ $1 != "" ]; then
  test -d $1 || die "folder $1 not found"
  IMAGES=($1)
fi

for img in ${IMAGES[@]}; do
  echo "======================================================================="
  echo "Building image from ${img}"
  echo "======================================================================="
  CONTEXT_DIR=$img
  source "${CONTEXT_DIR}/version.inc.sh"
  build_images
  tag_images
done
