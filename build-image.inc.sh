die() {
  echo $1
  exit -1
}

build_images () {
  echo "Building image: ${IMG}:${TAG}"
  docker build  -t ${IMG}:${TAG} -f ${CONTEXT_DIR}/Dockerfile ${CONTEXT_DIR}
}

tag_images () {
  for new_tag in ${TAGS[@]}; do
    echo "Tagging image: ${IMG}:${new_tag}"
    docker tag ${IMG}:${TAG} ${IMG}:${new_tag}
  done
}
