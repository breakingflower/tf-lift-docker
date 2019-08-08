# Author: Floris Remmen (f.remmen@tue.nl)
# Date: 05/08/2019
# Goal: dockerizing tf-lift from https://github.com/cvlab-epfl/tf-lift  
# Requirements client side: nvidia driver compatible with cuda 8 

FROM nvidia/cuda:8.0-cudnn6-runtime-ubuntu16.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc build-essential wget git && \
    apt-get install -y libsm6 libxext6 libxrender-dev libglib2.0-0 && \
    apt-get install -y python3-dev python-dev python-pip python3-pip python3-setuptools && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 10

RUN python -m pip install --upgrade pip && \
    python -m pip install numpy h5py tensorflow==1.4.0 tensorflow-gpu==1.4.0 opencv-python==3.4.5.20 scipy tqdm

RUN git clone https://github.com/cvlab-epfl/tf-lift && \
    cd tf-lift/ && \
    wget http://webhome.cs.uvic.ca/~kyi/files/2018/tflift/release-aug.tar.gz && \
    wget http://webhome.cs.uvic.ca/~kyi/files/2018/tflift/release-no-aug.tar.gz && \
    tar -xvf release-aug.tar.gz && tar -xvf release-no-aug.tar.gz && \
    rm -f release-no-aug.tar.gz && rm -f release-aug.tar.gz

WORKDIR /tf-lift


#  RUN python main.py --task=test --subtask=kp --logdir=release-aug --test_img_file=/data/images/1403775196981912.png --test_out_file=/data/images/1403775196981912.txt --use_batch_norm=False --mean_std_type=hardcoded