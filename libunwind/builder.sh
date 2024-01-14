#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$python3/bin:$cmake/bin:$make/bin:$busybox/bin"
export CFLAGS="-nostdlibinc -isystem $musl/include"
export CXXFLAGS="-nostdlibinc -isystem $musl/include"
export LDFLAGS="-nostdlib -L$musl/lib -L$compilerRt/lib/linux -lc -lclang_rt.builtins-x86_64"

cmake -S $src/runtimes \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_ENABLE_RUNTIMES="libunwind" \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
