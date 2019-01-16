FROM nvidia/cuda:9.1-cudnn7-devel

# apt-get
RUN apt-get update
RUN apt-get install wget git vim unzip build-essential cmake python python-pip python3 python3-pip libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y
RUN apt-get clean

RUN pip install opencv-python
RUN pip3 install opencv-python
RUN pip3 install --upgrade imutils

# move to work dir
WORKDIR /tmp

RUN wget https://www.baslerweb.com/fp-1535524609/media/downloads/software/pylon_software/pylon-5.1.0.12682-x86_64.tar.gz
RUN tar -xvf pylon-5.1.0.12682-x86_64.tar.gz
WORKDIR /tmp/pylon-5.1.0.12682-x86_64
RUN tar -C /opt -xzf pylonSDK-5.1.0.12682-x86_64.tar.gz

RUN mkdir /etc/udev/rules.d
RUN sh -c '/bin/echo -e "yes\n" | ./setup-usb.sh'


WORKDIR /tmp

RUN wget http://prdownloads.sourceforge.net/swig/swig-3.0.12.tar.gz
RUN tar -xvf swig-3.0.12.tar.gz
WORKDIR /tmp/swig-3.0.12
RUN ./configure
RUN make
RUN make install

WORKDIR /tmp
#RUN wget https://github.com/basler/pypylon/releases/download/1.3.1/pypylon-1.3.1-cp34-cp34m-linux_x86_64.whl
#RUN pip3 install pypylon-1.3.1-cp34-cp34m-linux_x86_64.whl

RUN git clone https://github.com/basler/pypylon
WORKDIR  /tmp/pypylon
RUN pip3 install .

WORKDIR /tmp
ADD test.py .
