#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$python3/bin:$cmake/bin:$make/bin:$busybox/bin"
export CFLAGS="-nostdlibinc -isystem $musl/include -isystem $libunwind/include -isystem $linuxHeaders/include"
export CXXFLAGS="-nostdlibinc -isystem $musl/include -isystem $libunwind/include -isystem $linuxHeaders/include"
export LDFLAGS="-nostdlib -L$musl/lib -L$compilerRt/lib/linux -L$libunwind/lib -lc -lclang_rt.builtins-x86_64 -lunwind"

cmake -S $src/runtimes \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" \
      -DLIBCXX_HAS_MUSL_LIBC=ON \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
