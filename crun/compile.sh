#!/bin/sh

. ./compile_helpers.sh

cd_local_src

clone_or_update crun https://github.com/containers/crun.git
cd crun

# Switch to last stable release
## Remove any tags starts with 'v*' as currently, they are
## all very old release.
checkout_latest_rel 'grep -v v'

./autogen.sh && ./configure
make -j $(nproc)
exec sudo make install -j $(nproc)
