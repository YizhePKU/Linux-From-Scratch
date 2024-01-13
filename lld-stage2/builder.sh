#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$git/bin:$python3/bin:$cmake/bin:$make/bin:$busybox/bin"
export LDFLAGS="-Wl,--rpath=$zlib/lib -Wl,--rpath=$libcxx/lib -Wl,--rpath=$libunwind/lib -Wl,--rpath=$musl/lib -Wl,--rpath=$compilerRt/lib/linux"

# copy source to temporary directory
cp -r $src $TMPDIR/source
chmod -R +w $TMPDIR/source

# apply patches
cd $TMPDIR/source
for patch in $patches; do
    git apply $patch
done

cmake -S $TMPDIR/source/lld \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_ROOT=$llvm \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
