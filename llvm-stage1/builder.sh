#!/bin/sh

export PATH="$gcc/bin:$busybox/bin:$make/bin:$cmake/bin:$python3/bin:$git/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -Wl,--enable-new-dtags -Wl,--rpath=$gcc/lib -Wl,--rpath=$zlib/lib"

cmake -S $src/llvm \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_TARGETS_TO_BUILD=X86 \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_INSTALL_UTILS=ON \
      -DZLIB_ROOT=$zlib \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
