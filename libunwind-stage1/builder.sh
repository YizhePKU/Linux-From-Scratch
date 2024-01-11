#!/bin/sh

export PATH="$llvm/bin:$clang/bin:$lld/bin:$cmake/bin:$make/bin:$python3/bin:$busybox/bin"
export CFLAGS="-nostdinc -isystem $musl/include -isystem $clang/lib/clang/17/include"
export CXXFLAGS="-nostdinc -isystem $musl/include -isystem $clang/lib/clang/17/include"
export LDFLAGS="-nostdlib -fuse-ld=lld -L$musl/lib -L$compilerRt/lib/linux -lc -lclang_rt.builtins-x86_64 -Wl,--rpath=$musl/lib -Wl,--rpath=$compilerRt/lib"

cmake -S $src/runtimes \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_ENABLE_RUNTIMES="libunwind" \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
