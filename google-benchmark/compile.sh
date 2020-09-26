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
rm -rf build/
mkdir build/

CFLAGS="-Ofast -Wall -flto -fno-asynchronous-unwind-tables -fno-unwind-tables -fmerge-all-constants"

LDFLAGS="-s -Wl,-icf=all,--gc-sections -flto -Wl,--plugin-opt=O3 -fuse-ld=lld"

# Generate build system files with cmake.
cd  build/
cmake -DCMAKE_BUILD_TYPE=Release   \
      -DBENCHMARK_ENABLE_LTO=true  \
      -DCMAKE_CXX_FLAGS="$CFLAGS"  \
      -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" ../
# Build the library.
cmake --build "." --config Release -j $(nproc)

# Test
ctest --build-config Release
# Install
exec sudo cmake --build "." --config Release --target install
