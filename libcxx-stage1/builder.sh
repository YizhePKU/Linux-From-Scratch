#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$python3/bin:$cmake/bin:$make/bin:$busybox/bin"
export CFLAGS="-nostdlibinc -isystem $musl/include -isystem $linuxHeaders/include"
export CXXFLAGS="-nostdlibinc -isystem $musl/include -isystem $linuxHeaders/include"
export LDFLAGS="-nostdlib -fuse-ld=lld -L$musl/lib -L$compilerRt/lib/linux -lc -lclang_rt.builtins-x86_64 -Wl,--rpath=$musl/lib -Wl,--rpath=$out/lib"

cmake -S $src/runtimes \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
      -DLIBCXX_HAS_MUSL_LIBC=ON \
      -DLIBCXXABI_USE_LLVM_UNWINDER=ON \
      -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
