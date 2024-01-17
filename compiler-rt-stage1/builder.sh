#!/bin/sh
set -eu -o pipefail

export PATH="$clang/bin:$lld/bin:$llvm/bin:$python3/bin:$cmake/bin:$make/bin:$busybox/bin"
export CFLAGS="-I$musl/include"
export LDFLAGS="-L$gcc/lib/gcc/x86_64-linux-musl/11.2.1 -lgcc --rtlib=libgcc --unwindlib=none"

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
