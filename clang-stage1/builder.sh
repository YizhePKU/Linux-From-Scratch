#!/bin/sh

export PATH="$llvm/bin:$gcc/bin:$make/bin:$cmake/bin:$python3/bin:$busybox/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -Wl,--enable-new-dtags -Wl,--rpath=$gcc/lib -Wl,--rpath=$zlib/lib"

cmake -S $src/clang \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_TARGETS_TO_BUILD=X86 \
      -DLLVM_ROOT=$llvm \

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
