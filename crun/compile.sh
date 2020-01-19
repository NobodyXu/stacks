#!/bin/sh

mkdir -p ~/.local/src
cd ~/.local/src

git clone https://github.com/containers/crun.git
cd crun

./autogen.sh && ./configure
make -j $(nproc)
sudo make install -j $(nproc)
