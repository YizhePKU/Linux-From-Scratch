#!/bin/sh
set -eu -o pipefail

export PATH="$llvm/bin:$git/bin:$python3/bin:$cmake/bin:$make/bin:$gcc/bin:$busybox/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -Wl,--rpath=$gcc/lib -Wl,--rpath=$zlib/lib"

cmake -S $src/clang \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_TARGETS_TO_BUILD=X86 \
      -DLLVM_ROOT=$llvm \
      -DCLANG_ENABLE_ARCMT=Off \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
