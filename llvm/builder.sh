#!/bin/sh
set -eu -o pipefail

export PATH="$git/bin:$python3/bin:$cmake/bin:$make/bin:$toolchain/bin:$busybox/bin"
export LDFLAGS="-L$libcxx/lib -L$musl/lib -Wl,--dynamic-linker=$musl/lib/ld-musl-x86_64.so.1"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
cmake -S $TMPDIR/source/llvm \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_TARGETS_TO_BUILD=X86 \
      -DLLVM_INSTALL_BINUTILS_SYMLINKS=ON \
      -DLLVM_DEFAULT_TARGET_TRIPLE="x86_64-unknown-linux-musl" \
      -DZLIB_ROOT=$zlib \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
