FROM tensorflow/tensorflow:1.10.1-py3

MAINTAINER matej.racinsky@foxconn4tech.com

#################################
# building object detection API #
#################################
RUN apt-get update && apt-get install --no-install-recommends -y \
    git \
    protobuf-compiler \
    python-pil \
    python-lxml \
    python-tk \
    python-opencv \
    python3-setuptools

RUN pip install \
    Cython \
    contextlib2 \
    jupyter \
    setuptools \
    matplotlib \
    python_utils

# the git reset --hard sets specific commit to be used, thus fixing version of used OD API
RUN mkdir /libraries \
    && cd /libraries \
    && git clone https://github.com/tensorflow/models.git \
    && cd /libraries/models \
    && git reset --hard 637f08e \
    && rm -rf /libraries/models/.git \
    && rm -rf /libraries/models/samples \
    && rm -rf /libraries/models/tutorials \
    && rm -rf /libraries/models/official \
    && find /libraries/models -name testdata -prune -exec rm -rf {} \;
# removing other directories except of the research and .git makes the image ~500MB smaller
# the last line removes the testdata directory from models, which makes image additional ~200MB smaller

# installing protoc
RUN cd /tmp && curl -OL https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip \
      && unzip protoc-3.6.1-linux-x86_64.zip -d protoc3 \
      && mv protoc3/bin/protoc /usr/local/bin/protoc3 \
      && rm -r /tmp/protoc*

# compiling proto files
RUN cd /libraries/models/research \
    && protoc3 object_detection/protos/*.proto --python_out=.

# building coco api tools
# using make is problematic, uses python 2 by default, so I call the contents of Makefile and use python 3 explicitly
RUN git clone https://github.com/cocodataset/cocoapi.git /tmp/cocoapi \
    && cd /tmp/cocoapi/PythonAPI \
    && python3 setup.py build_ext --inplace \
    && rm -rf build \
    && cp -r pycocotools /libraries/models/research/ \
    && rm -r /tmp/cocoapi

# because otherwise encodings are huge mess

ENV TF_MODELS_DIR=/libraries/models
ENV TF_MODELS_RESEARCH_DIR=${TF_MODELS_DIR}/research

WORKDIR ${TF_MODELS_RESEARCH_DIR}

# putting object detection libraries on the python path
ENV PYTHONPATH=$PYTHONPATH:${TF_MODELS_RESEARCH_DIR}:${TF_MODELS_RESEARCH_DIR}/slim

#################################
# end of object detection API #
#################################

# without those env vars installing unittest_data_provider broke
ENV LC_ALL C.UTF-8
ENV LC_CTYPE C.UTF-8
ENV LANG C.UTF-8

RUN apt-get update && apt-get install --no-install-recommends -y \
    python3-tk

# packages we use
RUN pip install \
    pylint==2.1.1 \
    pylint_runner==0.5.4 \
    progressbar2==3.38.0 \
    scikit-image==0.14.1 \
    fastcache==1.0.2 \
    unittest_data_provider==1.0.1 \
    pytest==3.10.1 \
    pytest-cov==2.6.1 \
    prettytable==0.7.2 \
    livestats==1.0 \
    bs4==0.0.1 \
    simplification==0.3.9 \
    opencv-python==4.0.0.21
