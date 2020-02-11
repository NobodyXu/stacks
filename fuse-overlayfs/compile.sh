#!/bin/bash -e

. ./compile_helpers.sh

cd_local_src

clone_or_update fuse-overlayfs https://github.com/containers/fuse-overlayfs.git
cd fuse-overlayfs

# Switch to last stable release
checkout_latest_rel

./autogen.sh
LIBS="-ldl" ./configure

make -j $(nproc)
exec sudo make install -j $(nproc)
