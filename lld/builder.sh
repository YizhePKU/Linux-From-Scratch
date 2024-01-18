#!/bin/sh
set -eu -o pipefail

export PATH="$git/bin:$python3/bin:$cmake/bin:$make/bin:$toolchain/bin:$busybox/bin"
export LDFLAGS="-L$libcxx/lib -L$musl/lib -Wl,--dynamic-linker=$musl/lib/ld-musl-x86_64.so.1"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# patch phase
for patch in $patches; do
    git apply $patch
done

# build phase
cmake -S $TMPDIR/source/lld \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_ROOT=$llvm \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
