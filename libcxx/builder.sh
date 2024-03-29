#!/bin/sh
set -eu -o pipefail

export PATH="$python3/bin:$cmake/bin:$make/bin:$toolchain/bin:$busybox/bin"
export LDFLAGS="-L$musl/lib"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
cmake -S $TMPDIR/source/runtimes \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_ENABLE_RUNTIMES="libunwind;libcxxabi;libcxx" \
      -DLIBCXX_HAS_MUSL_LIBC=ON \
      -DLIBCXXABI_USE_LLVM_UNWINDER=ON \
      -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
