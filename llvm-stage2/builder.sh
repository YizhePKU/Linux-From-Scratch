#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$clang/bin:$llvm/bin:$git/bin:$python3/bin:$cmake/bin:$make/bin:$busybox/bin"
export CFLAGS="-nostdinc -isystem $musl/include -isystem $linuxHeaders/include -isystem $clang/lib/clang/17/include"
export CXXFLAGS="-nostdinc -isystem $libcxx/include/c++/v1 -isystem $libunwind/include -isystem $musl/include -isystem $linuxHeaders/include -isystem $clang/lib/clang/17/include"

cmake -S $src/llvm \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DCMAKE_EXE_LINKER_FLAGS="-nostdlib -fuse-ld=lld -L$libcxx/lib -L$libunwind/lib -L$musl/lib -L$compilerRt/lib/linux -lc++ -lc++abi -lunwind -lc -lclang_rt.builtins-x86_64 -Wl,--dynamic-linker=$musl/lib/libc.so -Wl,--rpath=$zlib/lib -Wl,--rpath=$libcxx/lib -Wl,--rpath=$libunwind/lib -Wl,--rpath=$musl/lib -Wl,--rpath=$compilerRt/lib/linux $musl/lib/Scrt1.o $musl/lib/crti.o $compilerRt/lib/linux/clang_rt.crtbegin-x86_64.o $compilerRt/lib/linux/clang_rt.crtend-x86_64.o $musl/lib/crtn.o" \
      -DCMAKE_SHARED_LINKER_FLAGS="-nostdlib -fuse-ld=lld -L$libcxx/lib -L$libunwind/lib -L$musl/lib -L$compilerRt/lib/linux -lc++ -lc++abi -lunwind -lc -lclang_rt.builtins-x86_64 -Wl,--rpath=$zlib/lib -Wl,--rpath=$libcxx/lib -Wl,--rpath=$libunwind/lib -Wl,--rpath=$musl/lib -Wl,--rpath=$compilerRt/lib/linux" \
      -DCMAKE_MODULE_LINKER_FLAGS="-nostdlib -fuse-ld=lld -L$libcxx/lib -L$libunwind/lib -L$musl/lib -L$compilerRt/lib/linux -lc++ -lc++abi -lunwind -lc -lclang_rt.builtins-x86_64 -Wl,--rpath=$zlib/lib -Wl,--rpath=$libcxx/lib -Wl,--rpath=$libunwind/lib -Wl,--rpath=$musl/lib -Wl,--rpath=$compilerRt/lib/linux" \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_TARGETS_TO_BUILD=X86 \
      -DLLVM_DEFAULT_TARGET_TRIPLE="x86_64-unknown-linux-musl" \
      -DLLVM_INSTALL_BINUTILS_SYMLINKS=ON \
      -DZLIB_ROOT=$zlib \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
