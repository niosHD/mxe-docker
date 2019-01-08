FROM ubuntu:16.04

LABEL maintainer Mario Werner <mario.werner@iaik.tugraz.at>

# install required packages: https://mxe.cc/#requirements-debian
RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    autopoint \
    bash \
    bison \
    bzip2 \
    flex \
    g++ \
    g++-multilib \
    gettext \
    git \
    gperf \
    intltool \
    libc6-dev-i386 \
    libgdk-pixbuf2.0-dev \
    libltdl-dev \
    libssl-dev \
    libtool-bin \
    libxml-parser-perl \
    make \
    openssl \
    p7zip-full \
    patch \
    perl \
    pkg-config \
    python \
    ruby \
    sed \
    unzip \
    wget \
    xz-utils

RUN git clone https://github.com/mxe/mxe.git /opt/mxe && \
  cd /opt/mxe && \
  make cc cmake autotools MXE_TARGETS='i686-w64-mingw32.static i686-w64-mingw32.shared x86_64-w64-mingw32.static x86_64-w64-mingw32.shared' && \
  make clean-junk && \
  rm -rf "/opt/mxe/pkg/*"

ENV PATH="/opt/mxe/usr/bin:${PATH}"
