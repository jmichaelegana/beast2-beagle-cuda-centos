#!/bin/bash

set -e -o pipefail

# report CPU info
lscpu
cat /proc/cpuinfo

cd /opt/docker

# beagle 3.1.2, known working with beast 1.10.5pre
#git clone --depth=1 --branch="v3.1.2" https://github.com/beagle-dev/beagle-lib.git
git clone --depth=1 --branch "v4.0.0" https://github.com/beagle-dev/beagle-lib.git
cd beagle-lib

mkdir build
cd build
#cmake -DBUILD_OPENCL=OFF -DBEAGLE_OPTIMIZE_FOR_NATIVE_ARCH=false -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
#cmake -DBUILD_OPENCL=OFF -DBEAGLE_OPTIMIZE_FOR_NATIVE_ARCH=true -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
# generic 64-bit cpu
#cmake -DBUILD_OPENCL=OFF -DBEAGLE_OPTIMIZE_FOR_NATIVE_ARCH=false -DCMAKE_CXX_FLAGS="-march=x86-64 -mtune=intel" -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
cmake -DBUILD_CUDA=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr/local ..
make install

ldconfig # LD_LIBRARY_PATH is also set in the Dockerfile to include /usr/local/lib

examples/synthetictest