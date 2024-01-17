#!/bin/sh
set -eu -o pipefail

export PATH="$clang/bin:$lld/bin:$llvm/bin:$python3/bin:$cmake/bin:$make/bin:$busybox/bin"
export CFLAGS="-I$musl/include -I$linuxHeaders/include"
export CXXFLAGS="-I$musl/include -I$linuxHeaders/include"
export LDFLAGS="-nostdlib -B$gcc/lib -B$gcc/lib/gcc/x86_64-linux-musl/11.2.1 -L$gcc/lib -L$gcc/lib/gcc/x86_64-linux-musl/11.2.1 -lc -lgcc --rtlib=libgcc --unwindlib=none"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# build phase
cmake -S $TMPDIR/source/runtimes \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DCMAKE_INSTALL_RPATH=$out/lib \
      -DLLVM_ENABLE_RUNTIMES="libunwind;libcxxabi;libcxx" \
      -DLIBCXX_HAS_MUSL_LIBC=ON \
      -DLIBCXXABI_USE_LLVM_UNWINDER=ON \
      -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
