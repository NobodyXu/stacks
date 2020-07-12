#!/bin/bash -e

. ./compile_helpers.sh

cd_local_src

clone_or_update bloaty https://github.com/google/bloaty.git
cd bloaty

# Switch to last stable release
## Remove any tags starts with 'v*' as currently, they are
## all very old release.
checkout_latest_rel ''

cmake -DCMAKE_BUILD_TYPE=Release .
make -j $(nproc)
exec sudo make install -j $(nproc)
