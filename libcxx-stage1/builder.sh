#!/bin/sh

export PATH="$llvm/bin:$clang/bin:$lld/bin:$cmake/bin:$make/bin:$python3/bin:$busybox/bin"
export CFLAGS="-nostdinc -isystem $musl/include -isystem $clang/lib/clang/17/include -isystem $libunwind/include -isystem $linuxHeaders/include"
export CXXFLAGS="-nostdinc -isystem $musl/include -isystem $clang/lib/clang/17/include -isystem $libunwind/include -isystem $linuxHeaders/include"
export LDFLAGS="-nostdlib -fuse-ld=lld -L$musl/lib -L$compilerRt/lib/linux -L$libunwind/lib -lc -lclang_rt.builtins-x86_64 -lunwind -Wl,--rpath=$musl/lib -Wl,--rpath=$compilerRt/lib -Wl,--rpath=$libunwind/lib"

cmake -S $src/runtimes \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" \
      -DLIBCXX_HAS_MUSL_LIBC=ON \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
