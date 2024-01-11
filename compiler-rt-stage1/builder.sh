#!/bin/sh

export PATH="$llvm/bin:$clang/bin:$lld/bin:$cmake/bin:$make/bin:$python3/bin:$busybox/bin"
export CFLAGS="-nostdinc -isystem $musl/include -isystem $clang/lib/clang/17/include"
export LDFLAGS="-nostdlib -fuse-ld=lld"

cmake -S $src/compiler-rt/lib/builtins \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
