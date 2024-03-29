#!/bin/sh
set -eu -o pipefail

export PATH="$git/bin:$python3/bin:$cmake/bin:$make/bin:$gcc/bin:$busybox/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -Wl,--rpath=$gcc/lib"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
cmake -S $TMPDIR/source/llvm \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_TARGETS_TO_BUILD=X86 \
      -DLLVM_INSTALL_BINUTILS_SYMLINKS=ON \
      -DLLVM_DEFAULT_TARGET_TRIPLE="x86_64-unknown-linux-musl" \
      -DZLIB_ROOT=$zlib \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
