#!/bin/sh

mkdir -p ~/.local/src
cd ~/.local/src

if [ ! -d crun ]; then
    git clone https://github.com/containers/crun.git
    cd crun
else
    cd crun
    git pull
fi
# Switch to last stable release
## Remove any tags starts with 'v*' as currently, they are
## all very old release.
git tag -l | sort -V | grep -v 'v' | tail -n 1

./autogen.sh && ./configure
make -j $(nproc)
sudo make install -j $(nproc)
