#!/bin/bash -ex

. ./compile_helpers.sh

cd_local_src

clone_or_update benchmark            https://github.com/google/benchmark.git
clone_or_update benchmark/googletest https://github.com/google/googletest.git

# Go to the library root directory
cd benchmark

# Change both repositories to their latest stable release
## For benchmark
checkout_latest_rel

## For googletest
cd googletest
checkout_latest_rel 'grep release'
cd ..

# Make a build directory to place the build output.
mkdir -p build
cd build

# Generate a Makefile with cmake.
# Use cmake -G <generator> to generate a different file type.
cmake -DCMAKE_BUILD_TYPE=Release -DBENCHMARK_ENABLE_LTO=true ../

# Build the library.
make -j $(nproc)
# Test
make test -j $(nproc)
# Install
exec sudo make install -j $(nproc)
