#!/bin/sh

export PATH="$clang/bin:$lld/bin:$busybox/bin:$make/bin:$cmake/bin:$python3/bin:$git/bin"
export CFLAGS="-nostdinc -B$gcc/lib -B$gcc/lib/gcc/x86_64-linux-musl/11.2.1 -isystem $gcc/usr/include -isystem $gcc/lib/gcc/x86_64-linux-musl/11.2.1/include"
export CXXFLAGS="-nostdinc -B$gcc/lib -B$gcc/lib/gcc/x86_64-linux-musl/11.2.1 -isystem $gcc/usr/include -isystem $gcc/lib/gcc/x86_64-linux-musl/11.2.1/include"
export LDFLAGS="-fuse-ld=lld -nostdinc -nostdlib -L$gcc/lib -L$gcc/lib/gcc/x86_64-linux-musl/11.2.1 -L$gcc/lib/gcc -L$gcc/x86_64-linux-musl/lib -lc -lgcc -Wl,--enable-new-dtags -Wl,--rpath=$gcc/lib"

cmake -S $src/runtimes \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DCMAKE_AR=$llvm/bin/llvm-ar \
      -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi;libunwind" \
      -DLIBCXX_HAS_MUSL_LIBC=ON \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
