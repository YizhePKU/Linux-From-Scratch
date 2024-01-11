#!/bin/sh

export PATH="$llvm/bin:$clang/bin:$gcc/bin:$make/bin:$cmake/bin:$python3/bin:$busybox/bin"
export CC=clang
export CFLAGS="-nostdinc -B$gcc/lib -B$gcc/lib/gcc/x86_64-linux-musl/11.2.1 -isystem $gcc/usr/include -isystem $gcc/lib/gcc/x86_64-linux-musl/11.2.1/include"
export CXXFLAGS="-nostdinc -B$gcc/lib -B$gcc/lib/gcc/x86_64-linux-musl/11.2.1 -isystem $gcc/include/c++/11.2.1 -isystem $gcc/include/c++/11.2.1/x86_64-linux-musl -isystem $gcc/include/c++/11.2.1/backward -isystem $gcc/usr/include -isystem $gcc/lib/gcc/x86_64-linux-musl/11.2.1/include"

# GNU ld requires specifying libraries (-l...) after object files, so we won't use -nostdlib here. 
export LDFLAGS="-L$gcc/lib -L$gcc/lib/gcc/x86_64-linux-musl/11.2.1 -L$gcc/lib/gcc -L$gcc/x86_64-linux-musl/lib -Wl,--dynamic-linker=$gcc/lib/libc.so -Wl,--enable-new-dtags -Wl,--rpath=$gcc/lib -Wl,--rpath=$zlib/lib"

cmake -S $src/lld \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_ROOT=$llvm \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
