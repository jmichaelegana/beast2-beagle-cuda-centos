#!/bin/bash

set -e -o pipefail

# Add some basics
yum update -y

yum install -y \
	lsb-release ca-certificates wget rsync curl \
	less nano vim git make \
	dirmngr \
	lz4 pigz bzip2 lbzip2 zstd \
	gcc gcc-c++ autoconf automake libtool git pkgconfig \
	java-11-openjdk-devel

cd /usr/local/src
curl -LO https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3-linux-x86_64.tar.gz
tar -xvf cmake-3.26.3-linux-x86_64.tar.gz
mv cmake-3.26.3-linux-x86_64 /usr/local/cmake
echo 'export PATH="/usr/local/cmake/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

mkdir -p /usr/local/cuda/bin

ln -s /usr/bin/gcc /usr/local/cuda/bin/gcc
ln -s /usr/bin/g++ /usr/local/cuda/bin/g++

# Upgrade and clean
yum upgrade -y
yum clean all -y

echo "Done"

