#!/bin/sh
set -eu -o pipefail

export PATH="$lld/bin:$llvm/bin:$git/bin:$python3/bin:$cmake/bin:$make/bin:$gcc/bin:$busybox/bin"
export LDFLAGS="-fuse-ld=lld -Wl,--dynamic-linker=$gcc/lib/libc.so"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

# patch phase
for patch in $patches; do
    git apply $patch
done

# build phase
cmake -S $TMPDIR/source/clang \
      -B $TMPDIR/build \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$out \
      -DLLVM_INCLUDE_TESTS=OFF \
      -DLLVM_TARGETS_TO_BUILD=X86 \
      -DLLVM_ROOT=$llvm \
      -DCLANG_DEFAULT_LINKER="lld" \
      -DCLANG_DEFAULT_CXX_STDLIB="libc++" \
      -DCLANG_DEFAULT_RTLIB="compiler-rt" \
      -DCLANG_DEFAULT_UNWINDLIB="libunwind" \
      -DCLANG_DYNAMIC_LINKER="$gcc/lib/libc.so"

cmake --build $TMPDIR/build -j8
cmake --install $TMPDIR/build
