#!/bin/sh

export PATH="$gcc/bin:$busybox/bin:$make/bin:$cmake/bin:$python3/bin:$git/bin"
export LDFLAGS="-Wl,--dynamic-linker=$gcc/lib/libc.so -Wl,--enable-new-dtags -Wl,--rpath=$gcc/lib"

cd $TMPDIR
cmake -DLLVM_INSTALL_UTILS=ON -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_ASSERTIONS=ON -DCMAKE_INSTALL_PREFIX=$out -DLLVM_TARGETS_TO_BUILD=X86 $src/llvm
make -j8
make install
