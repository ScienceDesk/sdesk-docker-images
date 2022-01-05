#!/bin/bash

source version.inc.sh

#SDESK_RUNTIME_IMAGE="$IMG:$TAG"
SDESK_RUNTIME_IMAGE="sciencedesk/sdesk-conda3:cpu"

SDESK_CODE_DIR="$1"
shift
SDESK_PYTHON_ENTRYPOINT="$*"

execute() {
  set -x
  docker run --rm \
    -e SDESK_PYTHON_ENTRYPOINT="$SDESK_PYTHON_ENTRYPOINT" \
    --mount type=bind,source="$SDESK_CODE_DIR",target=/code \
    "${SDESK_RUNTIME_IMAGE}"
  set +x
}


execute
