#!/bin/bash

gamma="$1"

nvidia-docker run --rm -it \
  -e DISPLAY=$DISPLAY \
  --privileged \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /dev:/dev \
  -w /tmp \
  --ipc=host \
  --device=/dev/video0 \
  4tech/pylon-test \
        python3 /tmp/test.py -g $gamma

