FROM ubuntu:18.04

RUN apt-get update && apt-get -y upgrade && apt-get install -y g++

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
COPY Miniconda3-latest-Linux-x86_64.sh .
RUN bash Miniconda3-latest-Linux-x86_64.sh -b && \
    conda init bash && \
    . /root/.bashrc && \
    conda create --name d2l python=3.9 -y && \
    conda activate d2l
RUN pip install torch==1.12.0 -i https://mirrors.cloud.tencent.com/pypi/simple
RUN pip install torchvision==0.13.0 -i https://mirrors.cloud.tencent.com/pypi/simple
RUN pip install d2l==0.17.6 -i https://mirrors.cloud.tencent.com/pypi/simple
RUN pip install --upgrade numpy -i https://mirrors.cloud.tencent.com/pypi/simple
