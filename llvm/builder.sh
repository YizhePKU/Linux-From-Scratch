#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$git/bin:$python3/bin:$cmake/bin:$make/bin:$busybox/bin"
export CFLAGS="-nostdlibinc -isystem $musl/include -isystem $linuxHeaders/include"
export CXXFLAGS="-nostdlibinc -isystem $libcxx/include/c++/v1 -isystem $musl/include -isystem $linuxHeaders/include"

cmake -S $src/llvm \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DCMAKE_EXE_LINKER_FLAGS="-nostdlib -L$libcxx/lib -L$musl/lib -L$compilerRt/lib/linux -lc++ -lc -lclang_rt.builtins-x86_64 -Wl,--dynamic-linker=$musl/lib/ld-musl-x86_64.so.1 $musl/lib/Scrt1.o $musl/lib/crti.o $compilerRt/lib/linux/clang_rt.crtbegin-x86_64.o $compilerRt/lib/linux/clang_rt.crtend-x86_64.o $musl/lib/crtn.o" \
      -DCMAKE_SHARED_LINKER_FLAGS="-nostdlib -L$libcxx/lib -L$musl/lib -L$compilerRt/lib/linux -lc++ -lc -lclang_rt.builtins-x86_64" \
      -DCMAKE_MODULE_LINKER_FLAGS="-nostdlib -L$libcxx/lib -L$musl/lib -L$compilerRt/lib/linux -lc++ -lc -lclang_rt.builtins-x86_64" \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_TARGETS_TO_BUILD=X86 \
      -DLLVM_DEFAULT_TARGET_TRIPLE="x86_64-unknown-linux-musl" \
      -DLLVM_INSTALL_BINUTILS_SYMLINKS=ON \
      -DZLIB_ROOT=$zlib \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
