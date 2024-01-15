#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$git/bin:$python3/bin:$cmake/bin:$make/bin:$busybox/bin"
export LDFLAGS="-Wl,--rpath=$zlib/lib -Wl,--rpath=$libcxx/lib -Wl,--rpath=$musl/lib -Wl,--rpath=$compilerRt/lib/linux"

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
