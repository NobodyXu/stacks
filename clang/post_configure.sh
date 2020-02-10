#!/bin/bash -ex

# Use ld.ldd as default linker
sudo ln -f $(which ld.lld) /usr/bin/ld

# Use clang as default compiler
sudo update-alternatives --install /usr/bin/cc  cc  $(which clang)   100
sudo update-alternatives --install /usr/bin/c++ c++ $(which clang++) 100
sudo update-alternatives --install /usr/bin/cpp cpp $(which clang) 100
