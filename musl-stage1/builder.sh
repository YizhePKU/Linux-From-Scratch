#!/bin/sh
set -eu -o pipefail

export PATH="$clang/bin:$lld/bin:$llvm/bin:$make/bin:$busybox/bin"
export CC=clang
export LDFLAGS="-L$gcc/lib/gcc/x86_64-linux-musl/11.2.1 -lgcc --rtlib=libgcc --unwindlib=none"

# unpack phase
mkdir $TMPDIR/source && cd $TMPDIR/source
tar xf $src --strip-components=1

./configure --prefix=$out --syslibdir=$out/lib
make -j8
make install


