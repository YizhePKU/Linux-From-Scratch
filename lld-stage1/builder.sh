#!/bin/sh
set -eu -o pipefail

export PATH="$llvm/bin:$git/bin:$python3/bin:$cmake/bin:$make/bin:$gcc/bin:$busybox/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -Wl,--rpath=$gcc/lib -Wl,--rpath=$zlib/lib"

cmake -S $src/lld \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_ROOT=$llvm \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
