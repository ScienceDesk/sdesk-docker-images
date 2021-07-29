# ScienceDesk Docker images

This repository hosts the source code for the Docker images used to run custom
algorithms in the ScienceDesk platform.

## Conda images

There are three Miniconda 3 based images: light, cpu and gpu:

```
base
  |
  `--- light : miniconda3, python 3.7, whith minimal packages
  |
  `--- cpu   : miniconda3, python 3.7, with torch and other packages
  |
  `--- gpu   : miniconda3, python 3.7, nvidia cuda based image
```

## Testing locally

You can use the `run_docker.sh` script to test your code running inside the image.

```
./run_docker.sh [CWD] [...CMD]

# CWD - path that will be available inside the container
# CMD - command to run inside the container (inside CWD directory)
```

Example:

```
echo 'print("Hello world!")' > main.py
./run_docker.sh $PWD python main.py
```

## Building images

To build all images in this repo:

```
./build-images.sh
```

To debug
```
 docker run -it --entrypoint /bin/bash sciencedesk/sdesk-conda3:cpu-latest
 
```