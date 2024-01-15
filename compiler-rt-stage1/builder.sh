#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$python3/bin:$cmake/bin:$make/bin:$busybox/bin"
export CFLAGS="-nostdinc -isystem $musl/include -isystem $clang/lib/clang/17/include"
export LDFLAGS="-nostdlib -fuse-ld=lld -L$gcc/lib/gcc/x86_64-linux-musl/11.2.1 -lgcc"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
cmake -S $TMPDIR/source/compiler-rt/lib/builtins \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
