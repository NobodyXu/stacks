#!/bin/bash -ex

# Use ld.ldd as default linker
sudo ln -s -f $(which ld.lld) /usr/bin/ld

# Use clang as default compiler
## Set env variables instead of with /usr/bin/cc, /usr/bin/c++ or /usr/bin/cpp to avoid breaking
## the compilation of kernel modules.
./append.sh 'export CC=clang'    ~/.bashrc
./append.sh 'export CXX=clang++' ~/.bashrc
