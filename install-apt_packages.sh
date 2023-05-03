#!/bin/bash

set -e -o pipefail

# Add some basics
yum update -y
yum install -y \
	lsb-release ca-certificates wget rsync curl \
	less nano vim git make \
	dirmngr \
	lz4 pigz bzip2 lbzip2 zstd \
	cmake gcc gcc-c++ autoconf automake libtool git pkgconfig \
	java-11-openjdk-devel

mkdir -p /usr/local/cuda/bin

ln -s /usr/bin/gcc /usr/local/cuda/bin/gcc
ln -s /usr/bin/g++ /usr/local/cuda/bin/g++

# Upgrade and clean
yum upgrade -y
yum clean all -y

echo "Done"

