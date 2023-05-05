#!/bin/bash

beast_version="2.6.7"
# uncomment when out of pre-release:
#wget --quiet https://github.com/beast-dev/beast-mcmc/releases/download/v${beast_version}/BEASTv${beast_version}.tgz
wget --quiet https://github.com/CompEvol/beast2/releases/download/v2.6.7/BEAST.v2.6.7.Linux.tgz

tar -xzpf BEASTv${beast_version}.Linux.tgz
rm BEASTv${beast_version}.Linux.tgz

mv BEASTv${beast_version}.Linux/bin/* /usr/local/bin
mv BEASTv${beast_version}.Linux/lib/* /usr/local/lib

beast -beagle_info
